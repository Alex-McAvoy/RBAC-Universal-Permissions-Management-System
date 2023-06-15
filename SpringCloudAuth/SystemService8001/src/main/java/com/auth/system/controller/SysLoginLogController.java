package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.log.service.SysLoginLogService;
import com.auth.system.model.entity.SysLoginLog;
import com.auth.system.model.vo.SysLoginLogQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录日志controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/4 16:53
 **/
@Api(tags = "登录日志管理接口")
@RestController
@RequestMapping("/admin/system/sysLoginLog")
public class SysLoginLogController {
    @Autowired
    private SysLoginLogService sysLoginLogService;

    /** 根据登录日志id查询
     * @param id 登录日志id
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/3/4 17:00
     **/
    @ApiOperation(value = "根据登录日志id查询")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable("id") Integer id) {
        try {
            SysLoginLog sysLoginLog = sysLoginLogService.getById(id);
            // 数据异常
            if (sysLoginLog == null) {
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
            // 查询成功
            return Result.success(sysLoginLog);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 登录日志分页查询
     *
     * @param page               当前页
     * @param limit              每页记录数
     * @param sysLoginLogQueryVo 登录日志查询视图对象
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/3/4 16:58
     **/
    @ApiOperation(value = "登录日志分页查询")
    @GetMapping("/{page}/{limit}")
    public Result index(@PathVariable("page") Integer page,
                        @PathVariable("limit") Integer limit,
                        SysLoginLogQueryVo sysLoginLogQueryVo) {
        try {
            Page<SysLoginLog> pageParam = new Page<>(page, limit);
            IPage<SysLoginLog> pageModel = sysLoginLogService.selectPage(pageParam, sysLoginLogQueryVo);
            // 查询成功
            return Result.success(pageModel);
        } catch (Exception e) {
            e.printStackTrace();
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }


}
