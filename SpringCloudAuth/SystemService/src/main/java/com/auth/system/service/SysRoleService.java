package com.auth.system.service;

import com.auth.system.model.entity.SysRole;
import com.auth.system.model.vo.SysRoleQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 角色service接口
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 14:22
 **/
public interface SysRoleService extends IService<SysRole> {
    /**
     * 角色分页查询
     *
     * @param pageParam      分页参数信息
     * @param sysRoleQueryVo 角色查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.model.entity.SysRole>
     * @author Alex McAvoy
     * @date 2023/2/14 19:39
     **/
    IPage<SysRole> selectPage(Page<SysRole> pageParam, SysRoleQueryVo sysRoleQueryVo);

    /**
     * 根据用户id获取用户角色代码列表
     *
     * @param userId 用户id
     * @return java.util.List<java.lang.String>
     * @author Alex McAvoy
     * @date 2023/2/27 16:39
     **/
    List<String> getRoleCodeListByUserId(Integer userId);
}
