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
 * 系统菜单结点实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 11:45
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "系统菜单结点")
@TableName("sys_menu")
public class SysMenu extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "当前菜单结点所属上级")
	@TableField("parent_id")
	private Integer parentId;

	@ApiModelProperty(value = "名称")
	@TableField("name")
	private String name;

	@ApiModelProperty(value = "类型(0:目录,1:菜单,2:按钮)")
	@TableField("type")
	private Integer type;

	@ApiModelProperty(value = "路由地址")
	@TableField("path")
	private String path;

	@ApiModelProperty(value = "组件路径")
	@TableField("component")
	private String component;

	@ApiModelProperty(value = "权限标识")
	@TableField("perms")
	private String perms;

	@ApiModelProperty(value = "图标")
	@TableField("icon")
	private String icon;

	@ApiModelProperty(value = "排序")
	@TableField("sort_value")
	private Integer sortValue;

	@ApiModelProperty(value = "状态(0:禁止,1:正常)")
	@TableField("status")
	private Integer status;

	@ApiModelProperty(value = "下级列表")
	@TableField(exist = false)
	private List<SysMenu> children;

	@ApiModelProperty(value = "是否选中")
	@TableField(exist = false)
	private boolean isSelect;
}

