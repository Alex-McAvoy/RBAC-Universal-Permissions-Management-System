package com.auth.system.model.entity;

import com.auth.system.model.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 系统访问记录实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 11:35
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "系统访问记录")
@TableName("sys_login_log")
public class SysLoginLog extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "用户账号")
	@TableField("username")
	private String username;

	@ApiModelProperty(value = "登录IP地址")
	@TableField("ipaddr")
	private String ipAddress;

	@ApiModelProperty(value = "登录状态（0成功 1失败）")
	@TableField("status")
	private Integer status;

	@ApiModelProperty(value = "提示信息")
	@TableField("msg")
	private String msg;

}