package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.model.vo.AssignRoleVo;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.enums.BusinessType;
import com.auth.system.service.SysUserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户-角色controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/19 15:58
 **/
@Api(tags = "用户-角色管理接口")
@RestController
@RequestMapping("/admin/system/sysUserRole")
public class SysUserRoleController {
    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 根据用户id获取用户所属的角色id
     *
     * @param userId 用户id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/19 16:00
     **/
    @PreAuthorize("hasAuthority('bnt.sysUser.assignRole')")
    @ApiOperation("根据用户id获取用户所属的角色id")
    @GetMapping("/toAssign/{userId}")
    public Result toAssign(@PathVariable Integer userId) {
        try {
            List<Integer> userRoleIds = sysUserRoleService.getRoleIdsByUserId(userId);
            // 查询成功
            return Result.success(userRoleIds);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 为用户分配角色
     *
     * @param assignRoleVo 用户-角色分配视图对象
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/19 16:17
     **/
    @Log(title = "用户管理", businessType = BusinessType.ASSIGN)
    @PreAuthorize("hasAuthority('bnt.sysUser.assignRole')")
    @ApiOperation("为用户分配角色")
    @PostMapping("/doAssign")
    public Result doAssign(@RequestBody AssignRoleVo assignRoleVo) {
        try {
            sysUserRoleService.doAssign(assignRoleVo);
            // 分配成功
            return Result.success();
        } catch (Exception e) {
            // 分配失败
            return Result.fail(e.getMessage());
        }
    }

}
