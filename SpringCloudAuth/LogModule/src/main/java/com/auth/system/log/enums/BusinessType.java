package com.auth.system.log.enums;

/**
 * 业务操作类型枚举类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/3/2 15:04
 **/
public enum  BusinessType {
    // 其它
    OTHER,
    // 新增
    INSERT,
    // 删除
    DELETE,
    // 修改
    UPDATE,
    // 授权
    ASSIGN,
    // 导出
    EXPORT,
    // 导入
    IMPORT,
    // 强退
    FORCE,
    // 更新状态
    STATUS,
    // 清空数据
    CLEAN
}
