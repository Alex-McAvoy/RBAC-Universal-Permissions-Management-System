package com.auth.system.common.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis Plus配置类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 19:29
 **/
@Configuration
public class MybatisPlusConfig {

    /** MyBatis Plus 分页插件
     * @return com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor
     * @author Alex McAvoy
     * @date 2023/2/14 19:31
     **/
    @Bean
    public MybatisPlusInterceptor addPaginationInnerInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        //向MyBatis过滤器链中添加分页拦截器
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }
}
