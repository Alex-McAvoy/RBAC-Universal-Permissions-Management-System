package com.auth.system.service.impl;

import com.auth.system.model.entity.SysUserRole;
import com.auth.system.model.vo.AssignRoleVo;
import com.auth.system.dao.SysUserRoleDao;
import com.auth.system.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户-角色service实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/19 15:56
 **/
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleDao, SysUserRole> implements SysUserRoleService {
    @Override
    public List<Integer> getRoleIdsByUserId(Integer userId) {
        QueryWrapper<SysUserRole> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", userId);
        // 已分配的角色
        List<SysUserRole> userRoleList = baseMapper.selectList(wrapper);
        // 已分配的角色的id
        List<Integer> userRoleIds = new ArrayList<>();
        for (SysUserRole userRole : userRoleList) {
            Integer roleId = userRole.getRoleId();
            userRoleIds.add(roleId);
        }
        return userRoleIds;
    }

    @Override
    public void doAssign(AssignRoleVo assignRoleVo) {
        // 根据用户id删除之前分配的角色
        QueryWrapper<SysUserRole> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", assignRoleVo.getUserId());
        baseMapper.delete(wrapper);
        // 获取所有角色id，添加角色用户关系
        List<Integer> roleIds = assignRoleVo.getRoleIdList();
        for (Integer roleId : roleIds) {
            SysUserRole userRole = new SysUserRole();
            userRole.setUserId(assignRoleVo.getUserId());
            userRole.setRoleId(roleId);
            baseMapper.insert(userRole);
        }
    }
}
