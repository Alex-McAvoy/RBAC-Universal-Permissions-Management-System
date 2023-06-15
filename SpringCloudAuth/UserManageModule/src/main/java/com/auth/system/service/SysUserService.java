package com.auth.system.service;

import com.auth.system.model.entity.SysUser;
import com.auth.system.model.vo.SysUserQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * 用户service
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/18 14:38
 **/
public interface SysUserService extends IService<SysUser>  {
    /**
     * 用户分页查询
     *
     * @param pageParam      分页参数信息
     * @param sysUserQueryVo 角色查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.model.entity.SysUser>
     * @author Alex McAvoy
     * @date 2023/2/18 20:30
     **/
    IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo sysUserQueryVo);

    /** 用户状态更新
     * @param id 用户id
     * @param status 状态，1正常，0停用
     * @author Alex McAvoy
     * @date 2023/2/27 22:41
     **/
    void updateStatus(Integer id, Integer status);

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return com.auth.model.entity.SysUser
     * @author Alex McAvoy
     * @date 2023/2/24 22:15
     **/
    SysUser getUserByUsername(String username);

    /**
     * 根据用户名获取用户信息（基本信息、菜单权限、按钮权限）
     *
     * @param username 用户名
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author Alex McAvoy
     * @date 2023/2/26 14:07
     **/
    Map<String, Object> getUserInfoByUsername(String username);

    /** 根据用户id获取用户信息（基本信息）
     * @param id 用户id
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author Alex McAvoy
     * @date 2023/5/5 21:36
     **/
    Map<String, Object> getUserInfoByUserId(Integer id);
}
