package com.auth.system.common.result;

import lombok.Getter;

/**
 * 统一结果返回代码枚举类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 17:30
 **/
@Getter
public enum ResultCodeEnum {
    // 请求成功
    SUCCESS(200, "成功"),
    // 请求失败
    FAIL(201, "失败"),
    // 数据异常
    DATA_ERROR(300, "数据异常"),
    // 服务异常
    SERVICE_ERROR(500, "服务异常"),
    // 账号不存在
    ACCOUNT_ERROR(210, "用户不存在"),
    // 密码错误
    PASSWORD_ERROR(211, "密码错误"),
    // 无权限
    PERMISSION(212, "无权限"),
    // 账号已停用
    ACCOUNT_STOP(213, "账号已停用"),
    // 角色名重复
    ROLE_REPEAT(220,"角色名重复"),
    // 用户名重复
    USER_REPEAT(230,"用户名重复"),
    // 禁止删除root用户
    ROOT_NO_DELETE(231,"禁止删除root用户"),
    // 存在子结点，无法删除
    NODE_ERROR(240, "存在子结点，无法删除"),

    // 非法请求
    ILLEGAL_REQUEST(305, "非法请求"),
    // 重复提交
    REPEAT_SUBMIT(306, "重复提交"),
    // 参数校验异常
    ARGUMENT_VALID_ERROR(310, "参数校验异常"),
    // 未登录
    LOGIN_AUTH(308, "未登录");

    private Integer code;
    private String message;

    private ResultCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
