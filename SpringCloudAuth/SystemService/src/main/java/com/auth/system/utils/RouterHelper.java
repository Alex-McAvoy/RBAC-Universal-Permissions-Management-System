package com.auth.system.utils;

import com.auth.system.model.entity.SysMenu;
import com.auth.system.model.vo.MetaVo;
import com.auth.system.model.vo.RouterVo;
import org.springframework.util.CollectionUtils;

import java.util.LinkedList;
import java.util.List;


/**
 * 根据树形菜单列表构建路由的工具类
 *
 * @author Alex McAvoy
 * @version 1.0
 * @date 2023/2/26 15:38
 **/
public class RouterHelper {

    /**
     * 根据树形菜单列表构建路由列表
     *
     * @param menus 树形菜单列表
     * @return java.util.List<com.auth.model.vo.RouterVo>
     * @author Alex McAvoy
     * @date 2023/2/26 20:20
     **/
    public static List<RouterVo> buildRouters(List<SysMenu> menus) {
        List<RouterVo> routers = new LinkedList<RouterVo>();
        for (SysMenu menu : menus) {
            RouterVo router = new RouterVo();
            router.setHidden(false);
            router.setAlwaysShow(false);
            router.setPath(getRouterPath(menu));
            router.setComponent(menu.getComponent());
            router.setMeta(new MetaVo(menu.getName(), menu.getIcon()));
            List<SysMenu> children = menu.getChildren();
            //如果当前是菜单，需将按钮对应的路由加载出来，如：“角色授权”按钮对应的路由在“系统管理”下面
            if (menu.getType() == 1) {
                List<SysMenu> hiddenMenuList = new LinkedList<>();
                for (SysMenu c : children) {
                    if (c.getComponent() != null) {
                        hiddenMenuList.add(c);
                    }
                }
                for (SysMenu hiddenMenu : hiddenMenuList) {
                    RouterVo hiddenRouter = new RouterVo();
                    hiddenRouter.setHidden(true);
                    hiddenRouter.setAlwaysShow(false);
                    hiddenRouter.setPath(getRouterPath(hiddenMenu));
                    hiddenRouter.setComponent(hiddenMenu.getComponent());
                    hiddenRouter.setMeta(new MetaVo(hiddenMenu.getName(), hiddenMenu.getIcon()));
                    routers.add(hiddenRouter);
                }
            } else {
                if (!CollectionUtils.isEmpty(children)) {
                    if (children.size() > 0) {
                        router.setAlwaysShow(true);
                    }
                    router.setChildren(buildRouters(children));
                }
            }
            routers.add(router);
        }
        return routers;
    }

    /**
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return java.lang.String
     * @author Alex McAvoy
     * @date 2023/2/26 20:20
     **/
    private static String getRouterPath(SysMenu menu) {
        String routerPath = "/" + menu.getPath();
        if (menu.getParentId() != 0) {
            routerPath = menu.getPath();
        }
        return routerPath;
    }
}
