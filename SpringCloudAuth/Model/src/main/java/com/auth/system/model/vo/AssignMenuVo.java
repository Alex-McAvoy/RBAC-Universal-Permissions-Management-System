package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 角色-菜单分配视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:05
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "角色-菜单分配视图对象")
public class AssignMenuVo {

    @ApiModelProperty(value = "角色id")
    private Integer roleId;

    @ApiModelProperty(value = "菜单id列表")
    private List<Integer> menuIdList;

}
