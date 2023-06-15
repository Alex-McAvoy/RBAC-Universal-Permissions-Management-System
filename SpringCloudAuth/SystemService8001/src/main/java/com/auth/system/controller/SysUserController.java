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
import java.util.Map;


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
     * 根据用户id获取用户信息（基本信息）
     *
     * @param id 用户id
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/5/5 21:34
     **/
    @ApiOperation("根据用户id获取用户信息（基本信息）")
    @GetMapping("/getUserInfo/{id}")
    public Result getUserInfoByUserId(@PathVariable("id") Integer id) {
        try {
            // 根据用户id获取用户信息（基本信息）
            Map<String, Object> result = sysUserService.getUserInfoByUserId(id);
            // 数据异常
            if (result == null) {
                return Result.build(null, ResultCodeEnum.DATA_ERROR);
            }
            // 查询成功
            return Result.success(result);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 根据用户id获取用户
     *
     * @param id 用户id
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:37
     **/
    @ApiOperation("根据用户id获取用户")
    @GetMapping("/get/{id}")
    public Result getUserById(@PathVariable("id") Integer id) {
        try {
            SysUser sysUser = sysUserService.getById(id);
//            MD5
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
     * 根据用户名判断用户是否存在
     *
     * @param username 用户名
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/5/6 16:38
     **/
    @ApiOperation("根据用户名判断用户是否存在")
    @GetMapping("/getUser/{username}")
    public Result getUserByUsername(@PathVariable("username") String username) {
        try {
            SysUser sysUser = sysUserService.getUserByUsername(username);
            // 用户名不存在
            if (sysUser == null) {
                return Result.success(false);
            }
            // 用户名存在
            return Result.success(true);
        } catch (Exception e) {
            // 查询失败
            return Result.fail(e.getMessage());
        }
    }

    /**
     * 修改用户密码
     *
     * @param passwordList 用户密码列表，第0个元素为用户id，第一个为用户原密码，第二个为用户新密码
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/5/6 23:08
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @ApiOperation("根据用户id修改用户密码")
    @PutMapping("/updatePassword")
    public Result updatePasswordByUserId(@RequestBody List<String> passwordList) {
        // 从传过来的数据中获取用户id和新老密码
        Integer userId = Integer.parseInt(passwordList.get(0));
        String oldPassword = passwordList.get(1);
        String newPassword = passwordList.get(2);

        // 根据用户id从数据库获取用户密码
        SysUser sysUser = sysUserService.getById(userId);
        String password = sysUser.getPassword();
        // 将传过来的用户旧密码进行MD5加密
        String encryptOldPassword = MD5.encrypt(oldPassword);
        // 比对从数据库获取的用户密码和传过来的用户旧密码
        if (password.equals(encryptOldPassword)) {
            // 比对成功，对新密码进行MD5加密，并将新密码存入数据库
            String encryptNewPassword = MD5.encrypt(newPassword);
            sysUser.setPassword(encryptNewPassword);

            try {
                boolean isSuccess = sysUserService.updateById(sysUser);
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
        } else {
            // 密码错误
            return Result.build(null, ResultCodeEnum.PASSWORD_ERROR);
        }
    }

    /**
     * 重置用户密码为123456
     *
     * @param userId 用户id
     * @return com.auth.system.common.result.Result
     * @author Alex McAvoy
     * @date 2023/5/6 23:14
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @ApiOperation("重置用户密码")
    @PostMapping("/resetPassword/{id}")
    public Result resetPassword(@PathVariable("id") Integer userId) {
        SysUser sysUser = sysUserService.getById(userId);
        String password = "123456";
        String encryptPassword = MD5.encrypt(password);
        sysUser.setPassword(encryptPassword);
        try {
            boolean isSuccess = sysUserService.updateById(sysUser);
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
     * 查询所有用户
     *
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/18 20:32
     **/
    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation("查询所有用户")
    @GetMapping("/findAll")
    public Result findAllUser() {
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
    public Result findPageQueryUser(@PathVariable("page") Integer page,
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
    public Result saveUser(@RequestBody SysUser sysUser) {
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
    public Result deleteUser(@PathVariable("id") Integer id) {
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
    @ApiOperation("修改用户")
    @PutMapping("/update")
    public Result updateUser(@RequestBody SysUser sysUser) {
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

