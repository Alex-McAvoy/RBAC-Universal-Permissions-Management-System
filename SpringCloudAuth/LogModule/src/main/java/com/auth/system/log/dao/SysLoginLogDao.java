package com.auth.system.log.dao;

import com.auth.system.model.entity.SysLoginLog;
import com.auth.system.model.vo.SysLoginLogQueryVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 登录日志dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:36
 **/
@Repository
public interface SysLoginLogDao extends BaseMapper<SysLoginLog> {
}
