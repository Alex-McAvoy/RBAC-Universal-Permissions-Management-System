package com.auth.system.security.component;

import com.auth.system.common.utils.MD5;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * Spring Security自定义MD5加密处理组件
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 19:31
 **/
@Component
public class Md5Password implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        return MD5.encrypt(rawPassword.toString());
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encodedPassword.equals(MD5.encrypt(rawPassword.toString()));
    }
}
