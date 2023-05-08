package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.model.entity.SysMenu;
import com.auth.system.common.exception.CustomerException;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.enums.BusinessType;
import com.auth.system.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 15:39
 **/
@Api(tags = "菜单管理接口")
@RestController
@RequestMapping("/admin/system/sysMenu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 新增菜单结点
     *
     * @param sysMenu 菜单结点
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/20 15:44
     **/
    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
    @PreAuthorize("hasAuthority('bnt.sysMenu.add')")
    @ApiOperation(value = "新增菜单结点")
    @PostMapping("/save")
    public Result saveMenu(@RequestBody SysMenu sysMenu) {
        try {
            boolean isSuccess = sysMenuService.save(sysMenu);
            if (isSuccess) {
                // 添加成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (Exception e) {
            // 添加失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据菜单结点id逻辑删除
     *
     * @param id 菜单结点id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/20 15:45
     **/
    @Log(title = "菜单管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysMenu.delete')")
    @ApiOperation(value = "根据菜单结点id逻辑删除")
    @DeleteMapping("/delete/{id}")
    public Result deleteMenuById(@PathVariable Integer id) {
        try {
            int isSuccess = sysMenuService.removeMenuById(id);
            if (isSuccess == 1) {
                // 删除成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (CustomerException e) {
            // 存在子结点，无法删除
            return Result.build(null, ResultCodeEnum.NODE_ERROR);
        } catch (Exception e) {
            // 删除失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 修改菜单结点
     *
     * @param sysMenu 菜单结点
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/20 15:46
     **/
    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysMenu.update')")
    @ApiOperation(value = "修改菜单结点")
    @PutMapping("/update")
    public Result updateMenu(@RequestBody SysMenu sysMenu) {
        try {
            boolean isSuccess = sysMenuService.updateById(sysMenu);
            if (isSuccess) {
                // 修改成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (Exception e) {
            // 修改失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据菜单结点id查询
     *
     * @param id 菜单结点id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/20 15:52
     **/
    @PreAuthorize("hasAuthority('bnt.sysMenu.list')")
    @ApiOperation(value = "根据菜单结点id查询")
    @GetMapping("/findNode/{id}")
    public Result findNode(@PathVariable Integer id) {
        try {
            SysMenu sysMenu = sysMenuService.getById(id);
            // 数据异常
            if (sysMenu == null) {
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
            // 查询成功
            return Result.success(sysMenu);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 获取整个菜单
     *
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/20 15:49
     **/
    @PreAuthorize("hasAuthority('bnt.sysMenu.list')")
    @ApiOperation(value = "获取整个菜单")
    @GetMapping("/findNodes")
    public Result findNodes() {
        try {
            List<SysMenu> list = sysMenuService.findNodes();
            // 查询成功
            return Result.success(list);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 菜单结点状态更新
     *
     * @param id     菜单结点id
     * @param status 状态，1正常，0停用
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/21 17:25
     **/
    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysMenu.update')")
    @ApiOperation(value = "菜单状态更新，1正常，0停用")
    @PutMapping("/updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable Integer id, @PathVariable Integer status) {
        try {
            sysMenuService.updateStatus(id, status);
            // 更新成功
            return Result.success();
        } catch (NullPointerException e) {
            // 数据异常
            return Result.build(null, ResultCodeEnum.DATA_ERROR);
        } catch (Exception e) {
            // 更新失败
            return Result.fail(e.getMessage());
        }
    }
}
