package com.auth.system.security.filter;

import com.alibaba.fastjson2.JSON;
import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.common.utils.JwtHelper;
import com.auth.system.common.utils.ResponseUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * token认证解析过滤器
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 20:14
 **/
public class TokenAuthenticationFilter extends OncePerRequestFilter {
    private RedisTemplate redisTemplate;

    public TokenAuthenticationFilter(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    /**
     * 根据token进行认证
     *
     * @param request     Request对象
     * @param response    Response对象
     * @param filterChain 过滤器链
     * @author Alex McAvoy
     * @date 2023/2/27 20:24
     **/
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        // 登录接口，直接放行
        if ("/admin/system/index/login".equals(request.getRequestURI())) {
            filterChain.doFilter(request, response);
            return;
        }

        // 从request对象中获取token并封装为认证token
        UsernamePasswordAuthenticationToken authentication = getAuthentication(request);

        // 根据认证token进行判断
        if (authentication != null) {
            SecurityContextHolder.getContext().setAuthentication(authentication);
            filterChain.doFilter(request, response);
        } else {
            // 无权限
            ResponseUtil.out(response, Result.build(null, ResultCodeEnum.PERMISSION));
        }
    }

    /**
     * 从Request对象中获取token并封装成认证token
     *
     * @param request Request对象
     * @return org.springframework.security.authentication.UsernamePasswordAuthenticationToken
     * @author Alex McAvoy
     * @date 2023/2/27 20:23
     **/
    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        // 从header中获取token
        String token = request.getHeader("token");

        // 将token封装为认证token
        if (token != null && !token.isEmpty()) {
            String username = JwtHelper.getUsername(token);
            if (username != null && !username.isEmpty()) {
                // 从redis中获取权限数据
                String authoritiesString = (String) redisTemplate.opsForValue().get(username);
                List<Map> mapList = JSON.parseArray(authoritiesString, Map.class);
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                for(Map map: mapList) {
                    authorities.add(new SimpleGrantedAuthority((String) map.get("authority")));
                }

                return new UsernamePasswordAuthenticationToken(username, null, authorities);
            }
        }
        return null;
    }
}
