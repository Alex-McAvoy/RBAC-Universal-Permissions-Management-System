package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.model.entity.SysMenu;
import com.auth.system.model.vo.AssignMenuVo;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.enums.BusinessType;
import com.auth.system.service.SysRoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色-菜单controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/21 20:49
 **/
@Api(tags = "角色-菜单管理接口")
@RestController
@RequestMapping("/admin/system/sysRoleMenu")
public class SysRoleMenuController {
    @Autowired
    SysRoleMenuService sysRoleMenuService;

    /**
     * 根据角色id获取其相应的菜单列表
     *
     * @param roleId 角色id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/21 20:57
     **/
    @PreAuthorize("hasAuthority('bnt.sysRole.assignMenuAuth')")
    @ApiOperation(value = "根据角色id获取其相应的菜单列表")
    @GetMapping("/toAssign/{roleId}")
    public Result toAssign(@PathVariable Integer roleId) {
        try {
            List<SysMenu> list = sysRoleMenuService.getMenuByRoleId(roleId);
            // 查询成功
            return Result.success(list);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 为角色分配菜单权限
     *
     * @param assignMenuVo 角色-菜单分配视图对象
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/21 21:00
     **/
    @Log(title = "角色管理", businessType = BusinessType.ASSIGN)
    @PreAuthorize("hasAuthority('bnt.sysRole.assignMenuAuth')")
    @ApiOperation(value = "为角色分配权限")
    @PostMapping("/doAssign")
    public Result doAssign(@RequestBody AssignMenuVo assignMenuVo) {
        try {
            sysRoleMenuService.doAssign(assignMenuVo);
            // 分配成功
            return Result.success();
        } catch (Exception e) {
            // 分配失败
            return Result.fail(e.getMessage());
        }
    }

}
