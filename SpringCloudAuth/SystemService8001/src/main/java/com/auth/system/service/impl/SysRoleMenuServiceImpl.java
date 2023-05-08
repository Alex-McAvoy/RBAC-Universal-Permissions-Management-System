package com.auth.system.service.impl;

import com.auth.system.model.entity.SysMenu;
import com.auth.system.model.entity.SysRoleMenu;
import com.auth.system.model.vo.AssignMenuVo;
import com.auth.system.dao.SysMenuDao;
import com.auth.system.dao.SysRoleMenuDao;
import com.auth.system.service.SysRoleMenuService;
import com.auth.system.utils.MenuHelper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色-菜单service实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/21 20:52
 **/
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuDao, SysRoleMenu> implements SysRoleMenuService {
    @Autowired
    SysMenuDao sysMenuDao;

    @Override
    public List<SysMenu> getMenuByRoleId(Integer roleId) {
        // 获取状态可用（status为1）的菜单结点的权限列表
        QueryWrapper<SysMenu> menuWrapper = new QueryWrapper<>();
        menuWrapper.eq("status", 1);
        List<SysMenu> menuList = sysMenuDao.selectList(menuWrapper);

        // 根据角色id获取当前角色对菜单结点的权限列表
        QueryWrapper<SysRoleMenu> roleMenuWrapper = new QueryWrapper<>();
        roleMenuWrapper.eq("role_id", roleId);
        List<SysRoleMenu> roleMenus = baseMapper.selectList(roleMenuWrapper);

        // 获取该角色已分配菜单结点的所有权限id
        List<Integer> roleMenuIds = new ArrayList<>();
        for (SysRoleMenu roleMenu : roleMenus) {
            roleMenuIds.add(roleMenu.getMenuId());
        }

        // 遍历状态可用的菜单权限列表
        for (SysMenu sysMenu : menuList) {
            if (roleMenuIds.contains(sysMenu.getId())) {
                //设置该权限已被分配
                sysMenu.setSelect(true);
            } else {
                sysMenu.setSelect(false);
            }
        }

        // 将权限列表转换为权限树并返回
        return MenuHelper.buildTree(menuList);
    }

    @Override
    public void doAssign(AssignMenuVo assignMenuVo) {
        // 删除已分配的菜单权限
        QueryWrapper<SysRoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", assignMenuVo.getRoleId());
        baseMapper.delete(wrapper);

        // 遍历所有已选择的菜单权限id
        for (Integer menuId : assignMenuVo.getMenuIdList()) {
            if (menuId != null) {
                // 创建SysRoleMenu对象
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenu.setRoleId(assignMenuVo.getRoleId());
                // 添加新权限
                baseMapper.insert(sysRoleMenu);
            }
        }
    }
}
