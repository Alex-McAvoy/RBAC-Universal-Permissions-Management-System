package com.auth.system.security.filter;

import com.alibaba.fastjson2.JSON;
import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.common.utils.IpUtil;
import com.auth.system.common.utils.JwtHelper;
import com.auth.system.common.utils.ResponseUtil;
import com.auth.system.log.service.SysLoginLogService;
import com.auth.system.model.vo.LoginVo;
import com.auth.system.bean.SecurityUser;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Spring Security用户登录过滤器，对用户名密码进行登录校验
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 19:48
 **/
public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {

    private RedisTemplate<String, String> redisTemplate;

    private SysLoginLogService sysLoginLogService;

    /**
     * 构造函数
     *
     * @param authenticationManager 身份验证管理器
     * @author Alex McAvoy
     * @date 2023/2/27 19:51
     **/
    public TokenLoginFilter(AuthenticationManager authenticationManager,
                            RedisTemplate<String, String> redisTemplate,
                            SysLoginLogService sysLoginLogService) {
        this.setAuthenticationManager(authenticationManager);
        this.redisTemplate = redisTemplate;
        this.sysLoginLogService = sysLoginLogService;
        this.setPostOnly(false);
        // 指定登录接口与提交方式
        this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/admin/system/index/login", "POST"));
    }

    /**
     * 从request中获取用户名密码，进行登录认证
     *
     * @param request  Request对象
     * @param response Response对象
     * @return org.springframework.security.core.Authentication
     * @author Alex McAvoy
     * @date 2023/2/27 19:56
     **/
    @Override
    public Authentication attemptAuthentication(HttpServletRequest request,
                                                HttpServletResponse response)
            throws AuthenticationException {
        try {
            // 从Request中获取登录视图对象
            LoginVo loginVo = new ObjectMapper().readValue(request.getInputStream(), LoginVo.class);
            String username = loginVo.getUsername();
            String password = loginVo.getPassword();
            // 封装后认证
            Authentication authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            return this.getAuthenticationManager().authenticate(authenticationToken);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 认证成功
     *
     * @param request  Request对象
     * @param response Response对象
     * @param chain    过滤器链
     * @param auth     认证对象
     * @author Alex McAvoy
     * @date 2023/2/27 20:02
     **/
    @Override
    protected void successfulAuthentication(HttpServletRequest request,
                                            HttpServletResponse response,
                                            FilterChain chain,
                                            Authentication auth)
            throws IOException, ServletException {

        // 从认证对象中获取用户id、用户名、按钮权限
        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        Integer id = securityUser.getSysUser().getId();
        String username = securityUser.getSysUser().getUsername();
        Collection<GrantedAuthority> authorities = securityUser.getAuthorities();

        // 保存权限数据
        redisTemplate.opsForValue().set(username, JSON.toJSONString(authorities));

        // 写入登录日志
        sysLoginLogService.recordLoginLog(username, 1, IpUtil.getIpAddress(request), "登录成功");

        // 根据用户id和用户名生成token
        String token = JwtHelper.createToken(id, username);
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);

        // 将token通过response对象返回
        ResponseUtil.out(response, Result.success(map));
    }

    /**
     * 认证失败
     *
     * @param request  Request对象
     * @param response Response对象
     * @param e        认证异常对象
     * @author Alex McAvoy
     * @date 2023/2/27 19:59
     **/
    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request,
                                              HttpServletResponse response,
                                              AuthenticationException e)
            throws IOException, ServletException {

        if (e.getClass().equals(UsernameNotFoundException.class)) {
            // 用户不存在
            ResponseUtil.out(response, Result.build(null, ResultCodeEnum.ACCOUNT_ERROR));
        } else if (e.getClass().equals(InternalAuthenticationServiceException.class)) {
            // 账号停用
            ResponseUtil.out(response,Result.build(null,ResultCodeEnum.ACCOUNT_STOP));
        } else if(e.getCause() instanceof RuntimeException) {
            // 服务异常
            ResponseUtil.out(response, Result.build(null, ResultCodeEnum.SERVICE_ERROR));
        } else {
            // 密码错误
            ResponseUtil.out(response, Result.build(null, ResultCodeEnum.PASSWORD_ERROR));
        }
    }
}
