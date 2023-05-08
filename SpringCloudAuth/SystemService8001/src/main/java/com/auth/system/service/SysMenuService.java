package com.auth.system.service;

import com.auth.system.model.entity.SysMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 菜单service
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:37
 **/
public interface SysMenuService extends IService<SysMenu> {
    /**
     * 获取整个树形菜单
     *
     * @return java.util.List<com.auth.model.entity.SysMenu>
     * @author Alex McAvoy
     * @date 2023/2/20 15:42
     **/
    List<SysMenu> findNodes();

    /** 根据菜单结点id逻辑删除
     * @param id  菜单结点id
     * @return int
     * @author Alex McAvoy
     * @date 2023/2/27 22:59
     **/
    int removeMenuById(Integer id);

    /**
     * 菜单结点状态更新
     *
     * @param id     菜单结点id
     * @param status 状态，1正常，0停用
     * @author Alex McAvoy
     * @date 2023/2/21 17:26
     **/
    void updateStatus(Integer id, Integer status);

    /**
     * 根据用户id获取用户菜单权限列表
     *
     * @param userId 用户id
     * @return java.util.List<com.auth.model.entity.SysMenu>
     * @author Alex McAvoy
     * @date 2023/2/26 14:55
     **/
    List<SysMenu> getUserMenuList(Integer userId);

    /**
     * 根据用户id获取用户按钮权限列表
     *
     * @param userId 用户id
     * @return java.util.List<java.lang.String>
     * @author Alex McAvoy
     * @date 2023/2/26 17:26
     **/
    List<String> getUserButtonList(Integer userId);
}
