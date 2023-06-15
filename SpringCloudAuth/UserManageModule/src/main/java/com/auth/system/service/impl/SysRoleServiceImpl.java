package com.auth.system.service.impl;

import com.auth.system.model.entity.SysRole;
import com.auth.system.model.vo.SysRoleQueryVo;
import com.auth.system.dao.SysRoleDao;
import com.auth.system.service.SysRoleService;
import com.auth.system.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Service;
import org.springframework.cache.annotation.Cacheable;


import java.util.LinkedList;
import java.util.List;

/**
 * 角色service的实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 14:23
 **/
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleDao, SysRole> implements SysRoleService {
    @Autowired
    SysUserRoleService sysUserRoleService;

    @Override
    public IPage<SysRole> selectPage(Page<SysRole> pageParam, SysRoleQueryVo sysRoleQueryVo) {
        return baseMapper.selectPage(pageParam, sysRoleQueryVo);
    }

    @Override
    public List<String> getRoleCodeListByUserId(Integer userId) {
        List<Integer> roleIds = sysUserRoleService.getRoleIdsByUserId(userId);
        List<String> roleCodeList = new LinkedList<>();
        for (Integer roleId : roleIds) {
            SysRole role = baseMapper.selectById(roleId);
            roleCodeList.add(role.getRoleCode());
        }
        return roleCodeList;
    }

    @Override
    public List<String> getRoleNameListByUserId(Integer userId) {
        List<Integer> roleIds = sysUserRoleService.getRoleIdsByUserId(userId);
        List<String> roleNameList = new LinkedList<>();
        for (Integer roleId : roleIds) {
            SysRole role = baseMapper.selectById(roleId);
            roleNameList.add(role.getRoleName());
        }
        return roleNameList;
    }
}
