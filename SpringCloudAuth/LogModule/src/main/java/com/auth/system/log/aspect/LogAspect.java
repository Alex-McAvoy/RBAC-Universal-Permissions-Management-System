package com.auth.system.log.aspect;

import com.alibaba.fastjson2.JSON;
import com.auth.system.common.utils.IpUtil;
import com.auth.system.common.utils.JwtHelper;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.service.SysOperLogService;
import com.auth.system.model.entity.SysOperLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Map;

/**
 * 操作日志记录处理AOP类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/2 15:07
 **/
@Aspect
@Component
public class LogAspect {
    @Autowired
    SysOperLogService sysOperLogService;

    /**
     * 处理完请求后执行
     *
     * @param joinPoint     切点
     * @param controllerLog 日志
     * @param jsonResult    返回结果
     * @author Alex McAvoy
     * @date 2023/3/2 15:10
     **/
    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint,
                                 Log controllerLog,
                                 Object jsonResult) {
        handleLog(joinPoint, controllerLog, null, jsonResult);
    }

    /**
     * 处理日志
     *
     * @param joinPoint     切点
     * @param controllerLog 日志
     * @param e             异常
     * @param jsonResult    返回结果
     * @author Alex McAvoy
     * @date 2023/3/2 15:20
     **/
    protected void handleLog(final JoinPoint joinPoint,
                             Log controllerLog,
                             final Exception e,
                             Object jsonResult) {
        try {
            // 获取Request对象
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            HttpServletRequest request = servletRequestAttributes.getRequest();

            // 数据库中的操作日志
            SysOperLog sysOperLog = new SysOperLog();
            // 设置状态
            sysOperLog.setStatus(1);
            // 设置请求ip地址
            String ip = IpUtil.getIpAddress(request);
            sysOperLog.setOperIp(ip);
            sysOperLog.setOperUrl(request.getRequestURI());
            // 设置token
            String token = request.getHeader("token");
            String userName = JwtHelper.getUsername(token);
            sysOperLog.setOperName(userName);
            // 存在异常
            if (e != null) {
                sysOperLog.setStatus(0);
                sysOperLog.setErrorMsg(e.getMessage());
            }
            // 设置方法名
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            sysOperLog.setMethod(className + "." + methodName + "()");
            // 设置请求方式
            sysOperLog.setRequestMethod(request.getMethod());
            // 设置注解上的参数
            getControllerMethodDescription(joinPoint, controllerLog, sysOperLog, jsonResult);

            // 操作日志保存数据库
            sysOperLogService.saveSysOperLog(sysOperLog);
        } catch (Exception exp) {
            exp.printStackTrace();
        }
    }

    /*** 通过注解，获取对方法的描述信息，用于Controller层注解
     * @param joinPoint 切点
     * @param log 日志
     * @param sysOperLog 数据库中的操作日志
     * @param jsonResult 返回结果
     * @author Alex McAvoy
     * @date 2023/3/2 15:12
     **/
    private void getControllerMethodDescription(JoinPoint joinPoint,
                                                Log log,
                                                SysOperLog sysOperLog,
                                                Object jsonResult)
            throws Exception {
        // 设置action动作
        sysOperLog.setBusinessType(log.businessType().name());
        // 设置标题
        sysOperLog.setTitle(log.title());
        // 设置操作人类别
        sysOperLog.setOperatorType(log.operatorType().name());
        // 是否需要保存request，参数和值
        if (log.isSaveRequestData()) {
            // 获取参数的信息，传入到数据库中
            setRequestValue(joinPoint, sysOperLog);
        }
        // 是否需要保存response，参数和值
        if (log.isSaveResponseData()) {
            if (jsonResult != null && jsonResult != "") {
                sysOperLog.setJsonResult(JSON.toJSONString(jsonResult));
            }
        }
    }

    /**
     * 获取请求的参数，放到操作日志中
     *
     * @param joinPoint  切点
     * @param sysOperLog 操作日志
     * @author Alex McAvoy
     * @date 2023/3/2 15:13
     **/
    private void setRequestValue(JoinPoint joinPoint,
                                 SysOperLog sysOperLog)
            throws Exception {
        String requestMethod = sysOperLog.getRequestMethod();
        if (HttpMethod.PUT.name().equals(requestMethod) || HttpMethod.POST.name().equals(requestMethod)) {
            String params = argsArrayToString(joinPoint.getArgs());
            sysOperLog.setOperParam(params);
        }
    }

    /**
     * 参数拼装
     *
     * @param paramsArray 参数列表
     * @return java.lang.String
     * @author Alex McAvoy
     * @date 2023/3/2 15:13
     **/
    private String argsArrayToString(Object[] paramsArray) {
        String params = "";
        if (paramsArray != null && paramsArray.length > 0) {
            for (Object obj : paramsArray) {
                if (obj != null && obj != "" && !isFilterObject(obj)) {
                    try {
                        Object jsonObj = JSON.toJSON(obj);
                        params += jsonObj.toString() + " ";
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return params.trim();
    }

    /**
     * 判断是否需要过滤的对象，需要过滤返回true
     *
     * @param obj 对象信息
     * @return boolean
     * @author Alex McAvoy
     * @date 2023/3/2 15:14
     **/
    @SuppressWarnings("rawtypes")
    private boolean isFilterObject(final Object obj) {
        Class<?> clazz = obj.getClass();
        if (clazz.isArray()) {
            return clazz.getComponentType().isAssignableFrom(MultipartFile.class);
        } else if (Collection.class.isAssignableFrom(clazz)) {
            Collection collection = (Collection) obj;
            for (Object value : collection) {
                return value instanceof MultipartFile;
            }
        } else if (Map.class.isAssignableFrom(clazz)) {
            Map map = (Map) obj;
            for (Object value : map.entrySet()) {
                Map.Entry entry = (Map.Entry) value;
                return entry.getValue() instanceof MultipartFile;
            }
        }
        return obj instanceof MultipartFile
                || obj instanceof HttpServletRequest
                || obj instanceof HttpServletResponse
                || obj instanceof BindingResult;
    }
}
