package com.auth.system.model.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 角色-用户分配视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:09
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "用户-角色分配视图对象")
public class AssignRoleVo {

    @ApiModelProperty(value = "用户id")
    private Integer userId;

    @ApiModelProperty(value = "角色id列表")
    private List<Integer> roleIdList;

}
