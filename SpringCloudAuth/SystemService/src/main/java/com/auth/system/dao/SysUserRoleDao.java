package com.auth.system.dao;

import com.auth.system.model.entity.SysUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * 用户-角色dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/19 15:46
 **/
@Repository
public interface SysUserRoleDao extends BaseMapper<SysUserRole> {
}
