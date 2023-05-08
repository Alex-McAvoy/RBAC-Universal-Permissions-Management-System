package com.auth.system.security.bean;

import com.auth.system.model.entity.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * Spring Security自定义用户对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 19:34
 **/
public class SecurityUser extends User {
    private SysUser sysUser;

    public SecurityUser(SysUser sysUser, Collection<? extends GrantedAuthority> authorities) {
        super(sysUser.getUsername(), sysUser.getPassword(), authorities);
        this.sysUser = sysUser;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }
}
