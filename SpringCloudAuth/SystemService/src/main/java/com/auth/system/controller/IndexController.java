package com.auth.system.controller;

import com.auth.system.common.result.Result;
import com.auth.system.common.utils.JwtHelper;
import com.auth.system.model.vo.LoginVo;
import com.auth.system.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 登录登出controller
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/15 17:21
 **/

@Api(tags = "用户登录登出接口")
@RestController
@RequestMapping("/admin/system/index")
public class IndexController {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 用户登录
     *
     * @param loginVo 用户登录视图对象
     * @return com.auth.common.result.Result
     * @author Alex McAvoy
     * @date 2023/2/24 22:11
     **/
    @ApiOperation("用户登录")
    @PostMapping("/login")
    public Result login(@RequestBody LoginVo loginVo) {
        return Result.success();
    }

    @ApiOperation("返回登录信息")
    @GetMapping("/info")
    public Result info(HttpServletRequest request) {
        // 从请求头中获取token
        String token = request.getHeader("token");
        // 从token中获取用户名
        String username = JwtHelper.getUsername(token);
        // 根据用户名获取用户信息（基本信息、菜单权限、按钮权限）
        Map<String, Object> result = sysUserService.getUserInfoByUsername(username);
        return Result.success(result);
    }

    @ApiOperation("登出")
    @PostMapping("/logout")
    public Result logout() {
        return Result.success();
    }
}
