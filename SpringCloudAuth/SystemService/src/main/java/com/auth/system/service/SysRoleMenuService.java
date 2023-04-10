package com.auth.system.service;

import com.auth.system.model.entity.SysMenu;
import com.auth.system.model.entity.SysRoleMenu;
import com.auth.system.model.vo.AssignMenuVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 角色-菜单service
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/21 20:51
 **/
public interface SysRoleMenuService extends IService<SysRoleMenu> {
    /** 根据角色id获取其相应的菜单列表
     * @param roleId 角色id
     * @return java.util.List<com.auth.model.entity.SysMenu>
     * @author Alex McAvoy
     * @date 2023/2/21 20:57
     **/
    List<SysMenu> getMenuByRoleId(Integer roleId);

    /** 为角色分配菜单权限
     * @param assignMenuVo 角色-菜单分配视图对象
     * @author Alex McAvoy
     * @date 2023/2/21 20:59
     **/
    void doAssign(AssignMenuVo assignMenuVo);
}
