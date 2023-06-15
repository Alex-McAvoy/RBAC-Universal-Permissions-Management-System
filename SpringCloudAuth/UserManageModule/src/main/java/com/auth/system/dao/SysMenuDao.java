package com.auth.system.dao;

import com.auth.system.model.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 菜单dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:36
 **/
@Repository
public interface SysMenuDao extends BaseMapper<SysMenu> {
    /** 根据用户id获取菜单权限数据
     * @param userId 用户id
     * @return java.util.List<com.auth.model.entity.SysMenu>
     * @author Alex McAvoy
     * @date 2023/2/26 17:35
     **/
    List<SysMenu> findListByUserId(@Param("userId") Integer userId);
}
