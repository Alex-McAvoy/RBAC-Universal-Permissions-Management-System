package com.auth.system.dao;

import com.auth.system.model.entity.SysUser;
import com.auth.system.model.vo.SysUserQueryVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 用户dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/18 14:20
 **/
@Repository
public interface SysUserDao extends BaseMapper<SysUser> {
    /**
     * 条件分页查询
     *
     * @param pageParam      分页参数信息
     * @param sysUserQueryVo 用户查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.model.entity.SysUser>
     * @author Alex McAvoy
     * @date 2023/2/20 13:38
     **/
    IPage<SysUser> selectPage(Page<SysUser> pageParam, @Param("vo") SysUserQueryVo sysUserQueryVo);
}
