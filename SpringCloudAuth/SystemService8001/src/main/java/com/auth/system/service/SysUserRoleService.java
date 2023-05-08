package com.auth.system.service;

import com.auth.system.model.entity.SysUserRole;
import com.auth.system.model.vo.AssignRoleVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 用户-角色service
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/19 15:56
 **/
public interface SysUserRoleService extends IService<SysUserRole> {
    /**
     * 根据用户id获取该用户已分配的角色的id
     *
     * @param userId 用户id
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author Alex McAvoy
     * @date 2023/2/19 16:00
     **/
    List<Integer> getRoleIdsByUserId(Integer userId);

    /**
     * 为用户分配角色
     *
     * @param assignRoleVo 用户-角色分配视图对象
     * @author Alex McAvoy
     * @date 2023/2/19 16:18
     **/
    void doAssign(AssignRoleVo assignRoleVo);
}
