package com.auth.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * 通用权限管理主启动类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/13 22:04
 **/
@EnableCaching
@MapperScan(basePackages = {"com.auth.system.dao", "com.auth.system.log.dao"})
@SpringBootApplication
public class SystemService8001 {
    public static void main(String[] args) {
        SpringApplication.run(SystemService8001.class, args);
    }
}
