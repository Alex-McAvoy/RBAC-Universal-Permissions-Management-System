package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 路由显示信息视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:15
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "前端路由显示信息视图对象")
public class MetaVo {
    @ApiModelProperty(value = "路由在侧边栏和面包屑中展示的名字")
    private String title;

    @ApiModelProperty(value = "路由的图标，对应路径src/assets/icons/svg")
    private String icon;
}

