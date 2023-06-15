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

import java.util.List;

/**
 * 用户实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:01
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "用户")
@TableName("sys_user")
public class SysUser extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "用户名")
	@TableField("username")
	private String username;

	@ApiModelProperty(value = "密码")
	@TableField("password")
	private String password;

	@ApiModelProperty(value = "姓名")
	@TableField("name")
	private String name;

	@ApiModelProperty(value = "手机")
	@TableField("phone")
	private String phone;

	@ApiModelProperty(value = "头像地址")
	@TableField("head_url")
	private String headUrl;

	@ApiModelProperty(value = "状态（1：正常 0：停用）")
	@TableField("status")
	private Integer status;

	@ApiModelProperty(value = "角色列表")
	@TableField(exist = false)
	private List<SysRole> roleList;

}

