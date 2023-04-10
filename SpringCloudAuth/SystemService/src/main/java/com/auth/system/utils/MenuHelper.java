package com.auth.system.utils;

import com.auth.system.model.entity.SysMenu;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单项树形结构生成工具类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/20 16:09
 **/
public class MenuHelper {
    /**
     * 构建树形结构
     *
     * @param sysMenuList 菜单项列表
     * @return java.util.List<com.auth.model.entity.SysMenu>
     * @author Alex McAvoy
     * @date 2023/2/20 16:10
     **/
    public static List<SysMenu> buildTree(List<SysMenu> sysMenuList) {
        // 最终的树形结构
        List<SysMenu> trees = new ArrayList<>();
        // 遍历菜单集合
        for (SysMenu sysMenu : sysMenuList) {
            // 找到递归入口
            if (sysMenu.getParentId().equals(0)) {
                trees.add(findChildren(sysMenu, sysMenuList));
            }
        }
        return trees;
    }

    /**
     * 递归查询子结点
     *
     * @param currentNode 当前结点
     * @param treeNodes   菜单项列表
     * @return com.auth.model.entity.SysMenu
     * @author Alex McAvoy
     * @date 2023/2/20 16:14
     **/
    private static SysMenu findChildren(SysMenu currentNode, List<SysMenu> treeNodes) {
        // 当前结点的孩子结点初始化
        currentNode.setChildren(new ArrayList<>());
        // 当前结点的id
        Integer currentNodeId = currentNode.getId();
        // 遍历菜单项列表
        for (SysMenu node : treeNodes) {
            // 被枚举结点的父结点id
            Integer parentId = node.getParentId();
            // 被枚举结点父id与当前节点id相同，继续递归
            if (currentNodeId.equals(parentId)) {
                currentNode.getChildren().add(findChildren(node, treeNodes));
            }
        }
        return currentNode;
    }
}
