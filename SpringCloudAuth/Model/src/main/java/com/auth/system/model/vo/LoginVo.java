package com.auth.system.model.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户登录视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:11
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户登录视图对象")
public class LoginVo {
    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;
}
