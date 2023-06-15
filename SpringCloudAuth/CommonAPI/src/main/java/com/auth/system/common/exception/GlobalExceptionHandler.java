package com.auth.system.common.exception;

import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常处理类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/15 14:26
 **/
@ControllerAdvice
public class GlobalExceptionHandler {

    /** 全局异常处理
     * @param e 全局异常
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:27
     **/
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Result error(Exception e) {
        e.printStackTrace();
        return Result.fail().message("执行全局异常处理");
    }

    /** 特定异常处理（无权限），优先级高于全局异常处理
     * @param e 无权限异常
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/3/1 20:40
     **/
    @ResponseBody
    @ExceptionHandler(AccessDeniedException.class)
    public Result error(AccessDeniedException e) {
        return Result.build(null, ResultCodeEnum.PERMISSION);
    }

    /** 自定义异常处理，需手动抛出异常
     * @param e 自定义异常
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:31
     **/
    @ResponseBody
    @ExceptionHandler(CustomerException.class)
    public Result error(CustomerException e) {
        e.printStackTrace();
        return Result.fail().code(e.getCode()).message(e.getMessage());
    }
}
