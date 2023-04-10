package com.auth.system.log.service;

import com.auth.system.model.entity.SysOperLog;
import com.auth.system.model.vo.SysOperLogQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 操作日志service
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/2 15:33
 **/
public interface SysOperLogService extends IService<SysOperLog> {
    /**
     * 保存操作日志
     *
     * @param sysOperLog 操作日志
     * @author Alex McAvoy
     * @date 2023/3/2 15:38
     **/
    public void saveSysOperLog(SysOperLog sysOperLog);

    /**
     * 操作日志分页查询
     *
     * @param pageParam         分页参数信息
     * @param sysOperLogQueryVo 操作日志查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.system.model.entity.SysOperLog>
     * @author Alex McAvoy
     * @date 2023/3/4 17:56
     **/
    IPage<SysOperLog> selectPage(Page<SysOperLog> pageParam, SysOperLogQueryVo sysOperLogQueryVo);
}
