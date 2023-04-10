package com.auth.system.log.dao;

import com.auth.system.model.entity.SysOperLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * 操作日志dao
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:36
 **/
@Repository
public interface SysOperLogDao extends BaseMapper<SysOperLog> {
}
