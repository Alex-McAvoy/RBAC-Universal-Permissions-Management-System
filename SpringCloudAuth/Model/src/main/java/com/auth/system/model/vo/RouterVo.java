package com.auth.system.model.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 路由配置信息视图对象
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/14 12:19
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "前端路由配置信息视图对象")
public class RouterVo {

    @ApiModelProperty(value = "路由地址")
    private String path;

    @ApiModelProperty(value = "是否在侧边栏隐藏路由")
    private boolean hidden;

    @ApiModelProperty(value = "组件地址")
    private String component;

    @ApiModelProperty(value = "当路由下的children声明大于1时，自动为嵌套")
    private Boolean alwaysShow;

    @ApiModelProperty(value = "其他元素")
    private MetaVo meta;

    @ApiModelProperty(value = "子路由")
    private List<RouterVo> children;

}
