package com.auth.system.log.service.impl;

import com.auth.system.log.dao.SysLoginLogDao;
import com.auth.system.log.service.SysLoginLogService;
import com.auth.system.model.entity.SysLoginLog;
import com.auth.system.model.vo.SysLoginLogQueryVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 登录日志Service接口实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/4 16:14
 **/
@Service
public class SysLoginLogServiceImpl extends ServiceImpl<SysLoginLogDao, SysLoginLog> implements SysLoginLogService {
    @Override
    public void recordLoginLog(String username, Integer status, String ipAddress, String message) {
        SysLoginLog sysLoginLog = new SysLoginLog();
        sysLoginLog.setUsername(username);
        sysLoginLog.setStatus(status);
        sysLoginLog.setIpAddress(ipAddress);
        sysLoginLog.setMsg(message);

        baseMapper.insert(sysLoginLog);
    }

    @Override
    public IPage<SysLoginLog> selectPage(Page<SysLoginLog> pageParam, SysLoginLogQueryVo sysLoginLogQueryVo) {

        // 获取查询条件值
        String keyword = sysLoginLogQueryVo.getKeyword();
        String createTimeBegin = sysLoginLogQueryVo.getCreateTimeBegin();
        String createTimeEnd = sysLoginLogQueryVo.getCreateTimeEnd();

        // 构造条件
        QueryWrapper<SysLoginLog> wrapper = new QueryWrapper<>();

        if (keyword != null && !"".equals(keyword)) {
            wrapper.like("username", keyword)
                    .or().like("ipaddr", keyword)
                    .or().like("msg", keyword);
        }
        if (createTimeBegin != null && !"".equals(createTimeBegin)) {
            wrapper.ge("create_time", createTimeBegin);
        }
        if (createTimeEnd != null && !"".equals(createTimeEnd)) {
            wrapper.le("create_time", createTimeEnd);
        }

        return baseMapper.selectPage(pageParam, wrapper);
    }
}
