package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.common.result.ResultCodeEnum;
import com.auth.system.common.utils.MD5;
import com.auth.system.model.entity.SysUser;
import com.auth.system.model.vo.SysUserQueryVo;
import com.auth.system.log.annotation.Log;
import com.auth.system.log.enums.BusinessType;
import com.auth.system.service.SysUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 用户controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/18 16:30
 **/
@Api(tags = "用户管理接口")
@RestController
@RequestMapping("/admin/system/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 添加用户
     *
     * @param sysUser 用户
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:33
     **/
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PreAuthorize("hasAuthority('bnt.sysUser.add')")
    @ApiOperation("添加用户")
    @PostMapping("/save")
    public Result saveRole(@RequestBody SysUser sysUser) {
        // 对密码进行MD5加密
        String encrypt = MD5.encrypt(sysUser.getPassword());
        sysUser.setPassword(encrypt);

        try {
            boolean isSuccess = sysUserService.save(sysUser);
            if (isSuccess) {
                // 添加成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (DuplicateKeyException e) {
            // 用户名重复
            return Result.build(null, ResultCodeEnum.USER_REPEAT);
        } catch (Exception e) {
            // 添加失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据用户id逻辑删除
     *
     * @param id 用户id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:35
     **/
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysUser.delete')")
    @ApiOperation("根据用户id逻辑删除")
    @DeleteMapping("/delete/{id}")
    public Result deleteRole(@PathVariable("id") Integer id) {
        // 禁止删除root用户
        if (id == 1) {
            return Result.build(null, ResultCodeEnum.ROOT_NO_DELETE);
        }
        try {
            boolean isSuccess = sysUserService.removeById(id);
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
     * @date 2023/2/18 20:36
     **/
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysUser.delete')")
    @ApiOperation("批量删除")
    @DeleteMapping("/batchDelete")
    public Result batchDelete(@RequestBody List<Integer> ids) {
        // 禁止删除root用户
        for (Integer id : ids) {
            if (id == 1) {
                return Result.build(null, ResultCodeEnum.ROOT_NO_DELETE);
            }
        }

        try {
            boolean isSuccess = sysUserService.removeByIds(ids);
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
     * 修改用户
     *
     * @param sysUser 用户
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:36
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysUser.update')")
    @ApiOperation("修改用户")
    @PutMapping("/update")
    public Result updateRole(@RequestBody SysUser sysUser) {
        try {
            boolean isSuccess = sysUserService.updateById(sysUser);
            if (isSuccess) {
                // 修改成功
                return Result.success();
            } else {
                // 数据异常
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
        } catch (DuplicateKeyException e) {
            // 用户名重复
            return Result.build(null, ResultCodeEnum.USER_REPEAT);
        } catch (Exception e) {
            // 修改失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据用户id查询
     *
     * @param id 用户id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:37
     **/
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation("根据用户id查询")
    @GetMapping("/get/{id}")
    public Result getRoleById(@PathVariable("id") Integer id) {
        try {
            SysUser sysUser = sysUserService.getById(id);
            // 数据异常
            if (sysUser == null) {
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
            // 查询成功
            return Result.success(sysUser);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 查询所有用户
     *
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:32
     **/
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation("查询所有用户")
    @GetMapping("/findAll")
    public Result findAllRole() {
        try {
            List<SysUser> list = sysUserService.list();
            // 查询成功
            return Result.success(list);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 用户分页查询
     *
     * @param page           当前页
     * @param limit          每页记录数
     * @param sysUserQueryVo 用户查询视图对象
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:29
     **/
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation("用户分页查询")
    @GetMapping("/{page}/{limit}")
    public Result findPageQueryRole(@PathVariable("page") Integer page,
                                    @PathVariable("limit") Integer limit,
                                    SysUserQueryVo sysUserQueryVo) {
        try {
            Page<SysUser> pageParam = new Page<>(page, limit);
            IPage<SysUser> pageModel = sysUserService.selectPage(pageParam, sysUserQueryVo);
            // 查询成功
            return Result.success(pageModel);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 用户状态更新
     *
     * @param id     用户id
     * @param status 状态，1正常，0停用
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 21:58
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysUser.update')")
    @ApiOperation(value = "用户状态更新，1正常，0停用")
    @PutMapping("/updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable Integer id, @PathVariable Integer status) {
        try {
            sysUserService.updateStatus(id, status);
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

