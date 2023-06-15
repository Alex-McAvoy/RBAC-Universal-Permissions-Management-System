package com.auth.system.service.impl;

import com.auth.system.model.entity.SysMenu;
import com.auth.system.dao.SysMenuDao;
import com.auth.system.common.exception.CustomerException;
import com.auth.system.service.SysMenuService;
import com.auth.system.utils.MenuHelper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * 菜单service实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:38
 **/
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuDao, SysMenu> implements SysMenuService {
    @Override
    public List<SysMenu> findNodes() {
        // 获取所有菜单项列表
        List<SysMenu> sysMenuList = baseMapper.selectList(null);
        // 将所有菜单项列表转为树形格式并返回
        return MenuHelper.buildTree(sysMenuList);
    }

    @Override
    public int removeMenuById(Integer id) {
        // 查询当前菜单下是否有子菜单
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", id);
        Integer count = baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new CustomerException(240, "存在子结点，无法删除");
        }
        // 删除
        return baseMapper.deleteById(id);
    }

    @Override
    public void updateStatus(Integer id, Integer status) {
        SysMenu sysMenu = baseMapper.selectById(id);
        sysMenu.setStatus(status);
        baseMapper.updateById(sysMenu);
    }

    @Override
    public List<SysMenu> getUserMenuList(Integer userId) {
        List<SysMenu> sysMenuList = null;
        // 获取用户菜单权限列表，root超级管理员，userId为1，可操作所有内容
        if (userId == 1) {
            QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
            wrapper.eq("status", 1);
            wrapper.orderByAsc("id");
            return baseMapper.selectList(wrapper);
        } else {
            return baseMapper.findListByUserId(userId);
        }
    }

    @Override
    public List<String> getUserButtonList(Integer userId) {
        // 获取用户菜单权限列表
        List<SysMenu> sysMenuList = this.getUserMenuList(userId);
        // 根据用户菜单权限列表，获取相应的按钮权限
        List<String> permissionList = new ArrayList<>();
        for (SysMenu sysMenu : sysMenuList) {
            if (sysMenu.getType() == 2) {
                String perms = sysMenu.getPerms();
                permissionList.add(perms);
            }
        }
        return permissionList;
    }
}
