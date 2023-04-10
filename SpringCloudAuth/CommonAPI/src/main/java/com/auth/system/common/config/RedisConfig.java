package com.auth.system.common.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.lang.reflect.Method;
import java.time.Duration;

/**
 * Redis 配置类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/4 20:28
 **/
@Configuration
public class RedisConfig {
    /**
     * Redis 缓存管理器
     *
     * @param redisConnectionFactory 默认缓存管理器
     * @return org.springframework.data.redis.cache.RedisCacheManager
     * @author Alex McAvoy
     * @date 2023/3/4 20:30
     **/
    @Primary
    @Bean
    RedisCacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
        //Redis 序列化器
        RedisSerializer<String> redisSerializer = new StringRedisSerializer();
        //Json 序列化器
        Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Object.class);

        // 解决查询缓存转换异常的问题
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.activateDefaultTyping(LaissezFaireSubTypeValidator.instance,
                ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.PROPERTY);
        jackson2JsonRedisSerializer.setObjectMapper(om);

        // 配置 Json 序列化，解决乱码问题
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig()
                //过期时间0秒
                .entryTtl(Duration.ZERO)
                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(redisSerializer))
                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer))
                .disableCachingNullValues();

        // 返回 Redis 缓存管理器
        return RedisCacheManager.builder(redisConnectionFactory)
                .cacheDefaults(config)
                .build();
    }

    /** 获取整个菜单的缓存keyGenerator
     * @return org.springframework.cache.interceptor.KeyGenerator
     * @author Alex McAvoy
     * @date 2023/3/4 21:46
     **/
    @Bean("menuListKeyGenerator")
    public KeyGenerator menuListKeyGenerator() {
        return new KeyGenerator() {
            @Override
            public Object generate(Object target, Method method, Object... params) {
                return "menuList";
            }
        };
    }

    /** 获取所有角色的缓存keyGenerator
     * @return org.springframework.cache.interceptor.KeyGenerator
     * @author Alex McAvoy
     * @date 2023/3/4 22:04
     **/
    @Bean("roleListKeyGenerator")
    public KeyGenerator roleListKeyGenerator() {
        return new KeyGenerator() {
            @Override
            public Object generate(Object target, Method method, Object... params) {
                return "roleList";
            }
        };
    }
}
