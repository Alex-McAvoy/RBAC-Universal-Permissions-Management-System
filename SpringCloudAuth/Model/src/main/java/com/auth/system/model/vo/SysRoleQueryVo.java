//
//
package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 角色查询视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:35
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "角色查询视图对象")
public class SysRoleQueryVo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "角色")
	private String roleName;
}

