package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.log.service.SysOperLogService;
import com.auth.system.model.entity.SysOperLog;
import com.auth.system.model.vo.SysOperLogQueryVo;
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
 * 操作日志controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/4 17:51
 **/
@Api(tags = "操作日志管理接口")
@RestController
@RequestMapping("/admin/system/sysOperLog")
public class SysOperLogController {
    @Autowired
    private SysOperLogService sysOperLogService;

    /**
     * 根据操作日志id查询
     *
     * @param id 操作日志id
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/3/4 17:54
     **/
    @ApiOperation(value = "根据操作日志id查询")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable("id") Integer id) {
        try {
            SysOperLog sysLoginLog = sysOperLogService.getById(id);
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
     * 操作日志分页查询
     *
     * @param page              当前页
     * @param limit             每页记录数
     * @param sysOperLogQueryVo 操作日志查询视图对象
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/3/4 17:54
     **/
    @ApiOperation(value = "操作日志分页查询")
    @GetMapping("/{page}/{limit}")
    public Result index(@PathVariable("page") Integer page,
                        @PathVariable("limit") Integer limit,
                        SysOperLogQueryVo sysOperLogQueryVo) {
        try {
            Page<SysOperLog> pageParam = new Page<>(page, limit);
            IPage<SysOperLog> pageModel = sysOperLogService.selectPage(pageParam, sysOperLogQueryVo);
            // 查询成功
            return Result.success(pageModel);
        } catch (Exception e) {
            e.printStackTrace();
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

}
