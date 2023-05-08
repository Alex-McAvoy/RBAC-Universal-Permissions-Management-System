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
 * 角色实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 11:53
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "角色")
@TableName("sys_role")
public class SysRole extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "角色名")
	@TableField("role_name")
	private String roleName;

	@ApiModelProperty(value = "角色代码")
	@TableField("role_code")
	private String roleCode;

	@ApiModelProperty(value = "角色描述")
	@TableField("description")
	private String description;

}

