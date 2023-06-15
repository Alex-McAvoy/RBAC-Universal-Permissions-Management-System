package com.auth.system.security.config;

import com.auth.system.log.service.SysLoginLogService;
import com.auth.system.security.component.Md5Password;
import com.auth.system.security.filter.TokenAuthenticationFilter;
import com.auth.system.security.filter.TokenLoginFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * Spring Security配置类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 19:19
 **/
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private Md5Password md5Password;

    @Autowired
    RedisTemplate<String, String> redisTemplate;

    @Autowired
    SysLoginLogService sysLoginLogService;

    @Bean
    @Override
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    /**
     * Spring Security配置
     *
     * @param httpSecurity HttpSecurity对象
     * @author Alex McAvoy
     * @date 2023/2/27 20:31
     **/
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                //关闭csrf
                .csrf().disable()
                // 开启跨域以便前端调用接口
                .cors().and()
                .authorizeRequests()
                // 指定不需要通过验证即可访问的接口
                .antMatchers("/admin/system/index/login")
                .permitAll()
                // 其它所有接口需要认证才能访问
                .anyRequest().authenticated()
                // 除登录时查询数据库外，其他时候都用token进行认证
                .and().addFilterBefore(new TokenAuthenticationFilter(redisTemplate), UsernamePasswordAuthenticationFilter.class)
                .addFilter(new TokenLoginFilter(authenticationManager(), redisTemplate, sysLoginLogService));

        // 禁用session
        httpSecurity
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }

    /**
     * 认证对象提供者
     *
     * @return org.springframework.security.authentication.dao.DaoAuthenticationProvider
     * @author Alex McAvoy
     * @date 2023/2/27 21:19
     **/
    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        // 取消隐藏用户不存在异常
        daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
        // 指定UserDetailService
        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
        // 指定密码加密器
        daoAuthenticationProvider.setPasswordEncoder(md5Password);
        return daoAuthenticationProvider;
    }

    /**
     * 指定认证对象提供者
     *
     * @param auth 认证管理构造对象
     * @author Alex McAvoy
     * @date 2023/2/27 20:34
     **/
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(this.daoAuthenticationProvider());
    }

    /**
     * 配置不拦截的请求
     *
     * @param webSecurity WebSecurity对象
     * @author Alex McAvoy
     * @date 2023/2/27 20:35
     **/
    @Override
    public void configure(WebSecurity webSecurity) throws Exception {
        webSecurity
                .ignoring()
                .antMatchers("/favicon.ico",
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/**",
                        "/swagger-ui.html/**",
                        "/doc.html",
                        "/druid/**");
    }
}
