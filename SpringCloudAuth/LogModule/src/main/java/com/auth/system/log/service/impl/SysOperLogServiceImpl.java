package com.auth.system.log.service.impl;

import com.auth.system.log.dao.SysOperLogDao;
import com.auth.system.log.service.SysOperLogService;
import com.auth.system.model.entity.SysOperLog;
import com.auth.system.model.vo.SysOperLogQueryVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * 操作日志service实现类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/2 15:36
 **/
@Service
public class SysOperLogServiceImpl extends ServiceImpl<SysOperLogDao, SysOperLog> implements SysOperLogService {
    @Override
    public void saveSysOperLog(SysOperLog sysOperLog) {
        baseMapper.insert(sysOperLog);
    }

    @Override
    public IPage<SysOperLog> selectPage(Page<SysOperLog> pageParam, SysOperLogQueryVo sysOperLogQueryVo) {
        // 获取查询条件值
        String keyword = sysOperLogQueryVo.getKeyword();
        String createTimeBegin = sysOperLogQueryVo.getCreateTimeBegin();
        String createTimeEnd = sysOperLogQueryVo.getCreateTimeEnd();
        // 构造条件
        QueryWrapper<SysOperLog> wrapper = new QueryWrapper<>();
        if (keyword != null && !"".equals(keyword)) {
            wrapper.like("title", keyword)
                    .or().like("oper_name", keyword)
                    .or().like("request_method", keyword.toUpperCase())
                    .or().like("oper_ip", keyword);
        }
        if (createTimeBegin != null && !"".equals(createTimeBegin)) {
            wrapper.ge("create_time", createTimeBegin);
        }
        if (createTimeEnd != null && !"".equals(createTimeEnd)) {
            wrapper.le("create_time", createTimeEnd);
        }

        // 查询并返回
        return baseMapper.selectPage(pageParam, wrapper);
    }
}
