package com.auth.system.common.utils;

import io.jsonwebtoken.*;

import java.util.Date;

/**
 * JWT工具类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/24 21:16
 **/
public class JwtHelper {
    // token加密秘钥
    private static String tokenSignKey = "123456";

    /**
     * 根据用户id和用户名生成token
     *
     * @param userId   用户id
     * @param username 用户名
     * @return java.lang.String
     * @author Alex McAvoy
     * @date 2023/2/24 21:46
     **/
    public static String createToken(Integer userId, String username) {
        // token过期时间
        long tokenExpiration = 365 * 24 * 60 * 60 * 1000;
        return Jwts.builder()
                .setSubject("AUTH-USER")
                .setExpiration(new Date(System.currentTimeMillis() + tokenExpiration))
                .claim("userId", userId)
                .claim("username", username)
                .signWith(SignatureAlgorithm.HS512, tokenSignKey)
                .compressWith(CompressionCodecs.GZIP)
                .compact();
    }

    /**
     * 从token中获取用户id
     *
     * @param token token
     * @return java.lang.Long
     * @author Alex McAvoy
     * @date 2023/2/24 22:02
     **/
    public static Integer getUserId(String token) {
        try {
            if (token.isEmpty()) {
                return null;
            }
            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            return (Integer) claims.get("userId");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 从token中获取用户名
     *
     * @param token token
     * @return java.lang.String
     * @author Alex McAvoy
     * @date 2023/2/24 22:02
     **/
    public static String getUsername(String token) {
        try {
            if (token.isEmpty()) {
                return "";
            }
            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            return (String) claims.get("username");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 销毁token，无需删除，客户端扔掉即可
     *
     * @param token token
     * @author Alex McAvoy
     * @date 2023/2/24 22:00
     **/
    public static void removeToken(String token) {
    }

}
