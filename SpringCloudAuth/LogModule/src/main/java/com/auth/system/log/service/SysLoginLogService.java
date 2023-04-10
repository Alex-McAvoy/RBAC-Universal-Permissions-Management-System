package com.auth.system.log.service;

import com.auth.system.model.entity.SysLoginLog;
import com.auth.system.model.vo.SysLoginLogQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 登录日志Service接口
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/4 16:11
 **/
public interface SysLoginLogService extends IService<SysLoginLog> {
    /**
     * 记录登录信息
     *
     * @param username  用户名
     * @param status    状态
     * @param ipAddress ip地址
     * @param message   信息
     * @author Alex McAvoy
     * @date 2023/3/4 16:13
     **/
    public void recordLoginLog(String username, Integer status, String ipAddress, String message);

    /**
     * 登录日志分页查询
     *
     * @param pageParam          分页参数信息
     * @param sysLoginLogQueryVo 登录日志查询视图对象
     * @return com.baomidou.mybatisplus.core.metadata.IPage<com.auth.system.model.entity.SysLoginLog>
     * @author Alex McAvoy
     * @date 2023/3/4 17:01
     **/
    IPage<SysLoginLog> selectPage(Page<SysLoginLog> pageParam, SysLoginLogQueryVo sysLoginLogQueryVo);
}
