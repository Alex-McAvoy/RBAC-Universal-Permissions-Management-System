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
 * 操作日志实体类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 11:45
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "操作日志")
@TableName("sys_oper_log")
public class SysOperLog extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "模块标题")
	@TableField("title")
	private String title;

	@ApiModelProperty(value = "业务类型")
	@TableField("business_type")
	private String businessType;

	@ApiModelProperty(value = "方法名称")
	@TableField("method")
	private String method;

	@ApiModelProperty(value = "请求方式")
	@TableField("request_method")
	private String requestMethod;

	@ApiModelProperty(value = "操作类别")
	@TableField("operator_type")
	private String operatorType;

	@ApiModelProperty(value = "操作人员")
	@TableField("oper_name")
	private String operName;

	@ApiModelProperty(value = "请求URL")
	@TableField("oper_url")
	private String operUrl;

	@ApiModelProperty(value = "主机地址")
	@TableField("oper_ip")
	private String operIp;

	@ApiModelProperty(value = "请求参数")
	@TableField("oper_param")
	private String operParam;

	@ApiModelProperty(value = "返回参数")
	@TableField("json_result")
	private String jsonResult;

	@ApiModelProperty(value = "操作状态（0正常 1异常）")
	@TableField("status")
	private Integer status;

	@ApiModelProperty(value = "错误消息")
	@TableField("error_msg")
	private String errorMsg;
}