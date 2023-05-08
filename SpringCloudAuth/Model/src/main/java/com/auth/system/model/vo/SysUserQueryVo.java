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
 * 用户查询视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:38
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户查询视图对象")
public class SysUserQueryVo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "关键字: 用户名、密码、手机号")
	private String keyword;

	@ApiModelProperty(value = "根据创建时间查询，时间点前的")
	private String createTimeBegin;

	@ApiModelProperty(value = "根据创建时间查询，时间点后的")
	private String createTimeEnd;

	@ApiModelProperty(value = "角色id")
	private Integer roleId;
}

