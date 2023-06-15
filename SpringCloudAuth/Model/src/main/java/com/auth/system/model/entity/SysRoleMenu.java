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
 * 角色-菜单实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 11:57
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "角色-菜单")
@TableName("sys_role_menu")
public class SysRoleMenu extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "角色id")
	@TableField("role_id")
	private Integer roleId;

	@ApiModelProperty(value = "菜单id")
	@TableField("menu_id")
	private Integer menuId;

}

