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

/**
 * 用户-角色实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:05
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "用户-角色")
@TableName("sys_user_role")
public class SysUserRole extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "角色id")
	@TableField("role_id")
	private Integer roleId;

	@ApiModelProperty(value = "用户id")
	@TableField("user_id")
	private Integer userId;
}

