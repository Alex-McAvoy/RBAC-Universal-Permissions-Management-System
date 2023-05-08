package com.auth.system.common.result;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 统一结果返回类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 17:30
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "统一结果返回类")
public class Result<T> {
    @ApiModelProperty(value = "状态码")
    private Integer code;

    @ApiModelProperty(value = "返回消息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private T data;

    /**
     * 设置状态码
     *
     * @param code 状态码
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:50
     **/
    public Result<T> code(Integer code) {
        this.setCode(code);
        return this;
    }

    /**
     * 设置返回消息
     *
     * @param msg 返回消息
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:50
     **/
    public Result<T> message(String msg) {
        this.setMessage(msg);
        return this;
    }

    /**
     * 设置返回数据
     *
     * @param data 数据
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/2/14 17:34
     **/
    private static <T> Result<T> build(T data) {
        Result<T> result = new Result<T>();
        if (data != null) {
            result.setData(data);
        }
        return result;
    }

    /**
     * 构造返回结果
     *
     * @param data    返回数据
     * @param code    状态码
     * @param message 返回消息
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:47
     **/
    public static <T> Result<T> build(T data, Integer code, String message) {
        Result<T> result = build(data);
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

    /**
     * 构造返回结果
     *
     * @param data           返回数据
     * @param resultCodeEnum 统一结果返回代码
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:48
     **/
    public static <T> Result<T> build(T data, ResultCodeEnum resultCodeEnum) {
        Result<T> result = build(data);
        result.setCode(resultCodeEnum.getCode());
        result.setMessage(resultCodeEnum.getMessage());
        return result;
    }

    /**
     * 操作成功
     *
     * @param data 返回数据
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/2/14 19:16
     **/
    public static <T> Result<T> success(T data) {
        Result<T> result = build(data);
        return build(data, ResultCodeEnum.SUCCESS);
    }

    /**
     * 操作成功
     *
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:50
     **/
    public static <T> Result<T> success() {
        return Result.success(null);
    }

    /**
     * 操作失败
     *
     * @param data 数据
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/2/14 19:18
     **/
    public static <T> Result<T> fail(T data) {
        Result<T> result = build(data);
        return build(data, ResultCodeEnum.FAIL);
    }

    /**
     * 操作失败
     *
     * @return com.auth.common.result.Result<T>
     * @author Alex McAvoy
     * @date 2023/3/2 17:49
     **/
    public static <T> Result<T> fail() {
        return Result.fail(null);

    }
}
