package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import io.swagger.annotations.ApiModelProperty;
import lombok.NoArgsConstructor;

/**
 * 登录日志查询视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:27
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "登录日志查询视图对象")
public class SysLoginLogQueryVo {

	@ApiModelProperty(value = "关键字: 用户名、IP、提示信息")
	private String keyword;

	@ApiModelProperty(value = "根据创建时间查询，时间点前的")
	private String createTimeBegin;

	@ApiModelProperty(value = "根据创建时间查询，时间点后的")
	private String createTimeEnd;

}

