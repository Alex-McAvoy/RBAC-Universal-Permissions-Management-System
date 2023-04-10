package com.auth.system.service.impl;

import com.auth.system.model.entity.SysMenu;
import com.auth.system.model.entity.SysUser;
import com.auth.system.model.vo.RouterVo;
import com.auth.system.model.vo.SysUserQueryVo;
import com.auth.system.dao.SysUserDao;
import com.auth.system.service.SysMenuService;
import com.auth.system.service.SysRoleService;
import com.auth.system.service.SysUserService;
import com.auth.system.utils.MenuHelper;
import com.auth.system.utils.RouterHelper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 用户service实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/18 15:21
 **/
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUser> implements SysUserService {

    @Autowired
    SysMenuService sysMenuService;

    @Autowired
    SysRoleService sysRoleService;

    @Override
    public IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo sysUserQueryVo) {
        return baseMapper.selectPage(pageParam, sysUserQueryVo);
    }

    @Override
    public void updateStatus(Integer id, Integer status) {
        SysUser sysUser = baseMapper.selectById(id);
        sysUser.setStatus(status);
        baseMapper.updateById(sysUser);
    }

    @Override
    public SysUser getUserByUsername(String username) {
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        return baseMapper.selectOne(wrapper);
    }

    @Override
    public Map<String, Object> getUserInfoByUsername(String username) {
        // 根据用户名获取用户信息
        SysUser user = this.getUserByUsername(username);
        // 根据用户id获取用户角色代码列表
        List<String> sysRoleCodeList = sysRoleService.getRoleCodeListByUserId(user.getId());
        // 根据用户id获取用户菜单权限列表
        List<SysMenu> sysMenuList = sysMenuService.getUserMenuList(user.getId());
        // 用户菜单权限列表构建树形结构
        List<SysMenu> sysMenuTreeList = MenuHelper.buildTree(sysMenuList);
        // 树形用户菜单权限列表转为前端路由格式
        List<RouterVo> routerVoList = RouterHelper.buildRouters(sysMenuTreeList);
        // 根据用户id获取用户按钮权限值
        List<String> permsList = sysMenuService.getUserButtonList(user.getId());

        Map<String, Object> result = new HashMap<>();
        result.put("name", username);
        result.put("avatar", "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
        result.put("roles", sysRoleCodeList);
        result.put("routers", routerVoList);
        result.put("buttons", permsList);
        return result;
    }
}
