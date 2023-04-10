package com.auth.system.dao;

import com.auth.system.model.entity.SysRoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * 角色-菜单dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/21 20:50
 **/
@Repository
public interface SysRoleMenuDao extends BaseMapper<SysRoleMenu> {
}
