package com.auth.system.service.impl;

import com.auth.system.model.entity.SysUser;
import com.auth.system.security.bean.SecurityUser;
import com.auth.system.service.SysMenuService;
import com.auth.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Spring Security业务对象UserDetailsService实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/27 19:38
 **/
@Component
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysMenuService sysMenuService;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException, RuntimeException {
        SysUser sysUser = sysUserService.getUserByUsername(username);
        if(sysUser == null) {
            throw new UsernameNotFoundException("");
        }

        if(sysUser.getStatus() == 0) {
            throw new RuntimeException();
        }

        // 根据用户id查询按钮权限列表
        List<String> userPermissionList = sysMenuService.getUserButtonList(sysUser.getId());
        // 转为Security要求的GrantedAuthority格式
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (String permission: userPermissionList) {
            authorities.add(new SimpleGrantedAuthority(permission.trim()));
        }

        return new SecurityUser(sysUser, authorities);
    }
}
