package com.auth.system.controller;

import com.alibaba.fastjson2.JSON;
import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.model.entity.SysRole;
import com.auth.system.model.vo.SysRoleQueryVo;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.enums.BusinessType;
import com.auth.system.service.SysRoleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 角色controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 16:30
 **/
@Api(tags = "角色管理接口")
@RestController
@RequestMapping("/admin/system/sysRole")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 添加角色
     *
     * @param sysRole 角色
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:13
     **/
    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PreAuthorize("hasAuthority('bnt.sysRole.add')")
    @ApiOperation("添加角色")
    @PostMapping("/save")
    public Result saveRole(@RequestBody SysRole sysRole) {
        try {
            boolean isSuccess = sysRoleService.save(sysRole);
            if (isSuccess) {
                // 添加成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (DuplicateKeyException e) {
            // 角色名重复
            return Result.build(null, ResultCodeEnum.ROLE_REPEAT);
        } catch (Exception e) {
            // 添加失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据角色id逻辑删除
     *
     * @param id 角色id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/14 19:35
     **/
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysRole.delete')")
    @ApiOperation("根据角色id逻辑删除")
    @DeleteMapping("/delete/{id}")
    public Result deleteRoleById(@PathVariable("id") Integer id) {
        try {
            boolean isSuccess = sysRoleService.removeById(id);
            if (isSuccess) {
                // 删除成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (Exception e) {
            // 删除失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 批量删除
     *
     * @param ids id集合
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:22
     **/
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysRole.delete')")
    @ApiOperation("批量删除")
    @DeleteMapping("/batchDelete")
    public Result batchDelete(@RequestBody List<Integer> ids) {
        try {
            boolean isSuccess = sysRoleService.removeByIds(ids);
            if (isSuccess) {
                // 删除成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (Exception e) {
            // 删除失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 修改角色
     *
     * @param sysRole 角色
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:15
     **/
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysRole.update')")
    @ApiOperation("修改角色")
    @PutMapping("/update")
    public Result updateRole(@RequestBody SysRole sysRole) {
        try {
            boolean isSuccess = sysRoleService.updateById(sysRole);
            if (isSuccess) {
                // 修改成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (DuplicateKeyException e) {
            // 角色名重复
            return Result.build(null, ResultCodeEnum.ROLE_REPEAT);
        } catch (Exception e) {
            // 修改失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据角色id查询
     *
     * @param id 角色id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/15 14:13
     **/
    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation("根据角色id查询")
    @GetMapping("/get/{id}")
    public Result getRoleById(@PathVariable("id") Integer id) {
        try {
            SysRole sysRole = sysRoleService.getById(id);
            // 数据异常
            if (sysRole == null) {
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
            // 查询成功
            return Result.success(sysRole);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 查询所有角色
     *
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/14 16:32
     **/
    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation("查询所有角色")
    @GetMapping("/findAll")
    public Result findAllRole() {
        try {
            List<SysRole> list = sysRoleService.list();
            // 查询成功
            return Result.success(list);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 角色分页查询
     *
     * @param page           当前页
     * @param limit          每页记录数
     * @param sysRoleQueryVo 角色查询视图对象
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/14 19:35
     **/
    @PreAuthorize("hasAuthority('bnt.sysRole.list')")
    @ApiOperation("角色分页查询")
    @GetMapping("/{page}/{limit}")
    public Result findPageQueryRole(@PathVariable Integer page,
                                    @PathVariable Integer limit,
                                    SysRoleQueryVo sysRoleQueryVo) {
        try {
            Page<SysRole> pageParam = new Page<>(page, limit);
            IPage<SysRole> pageModel = sysRoleService.selectPage(pageParam, sysRoleQueryVo);
            // 查询成功
            return Result.success(pageModel);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

}
