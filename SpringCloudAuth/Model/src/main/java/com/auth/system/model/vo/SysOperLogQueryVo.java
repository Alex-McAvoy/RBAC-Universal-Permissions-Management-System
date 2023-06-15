package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 操作日志查询视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:23
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "操作日志查询视图对象")
public class SysOperLogQueryVo {

	@ApiModelProperty(value = "关键字: 模块标题、操作人员、请求方式")
	private String keyword;

	@ApiModelProperty(value = "根据创建时间查询，时间点前的")
	private String createTimeBegin;

	@ApiModelProperty(value = "根据创建时间查询，时间点后的")
	private String createTimeEnd;

}

