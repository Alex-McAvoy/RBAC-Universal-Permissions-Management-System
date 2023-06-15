package com.auth.system.dao;

import com.auth.system.model.entity.SysRole;
import com.auth.system.model.vo.SysRoleQueryVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 角色dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 14:20
 **/
@Repository
public interface SysRoleDao extends BaseMapper<SysRole> {
    /** 条件分页查询
     * @param pageParam 分页参数信息
     * @param sysRoleQueryVo 角色查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.model.entity.SysRole>
     * @author Alex McAvoy
     * @date 2023/2/14 19:43
     **/
    public IPage<SysRole> selectPage(Page<SysRole> pageParam, @Param("vo") SysRoleQueryVo sysRoleQueryVo);
}
