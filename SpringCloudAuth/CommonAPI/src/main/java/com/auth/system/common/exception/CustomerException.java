package com.auth.system.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 自定义异常封装类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/15 14:33
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class CustomerException extends RuntimeException{
    private Integer code;
    private String message;
}
