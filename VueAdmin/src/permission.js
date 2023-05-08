/*
 * @Description: 用户权限过滤
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */
import router from './router'
import store from './store'
import { getToken } from '@/utils/auth'
import { Message } from 'element-ui'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import getPageTitle from '@/utils/get-page-title'
import Layout from '@/layout'
import ParentView from '@/components/ParentView'

// 获取组件的方法
const _import = require('./router/_import_' + process.env.NODE_ENV)
// 水平进度条配置
NProgress.configure({ showSpinner: false })
// 无重定向白名单
const whiteList = ['/login']

router.beforeEach(async(to, from, next) => {
  NProgress.start()
  // 标签页标题设置
  document.title = getPageTitle(to.meta.title)
  // 确定用户是否已登录
  const hasToken = getToken()

  if (hasToken) {
    if (to.path === '/login') {
      // 如果已登录，重定向到主页
      next({ path: '/' })
      NProgress.done()
    } else {
      const hasGetUserInfo = store.getters.name
      if (hasGetUserInfo) {
        next()
      } else {
        try {
          // 获取用户信息
          await store.dispatch('user/getInfo')
          if (store.getters.menus.length < 1) {
            global.antRouter = []
            next()
          }
          // 1.过滤路由
          const menus = filterAsyncRouter(store.getters.menus)
          // 2.动态添加路由
          router.addRoutes(menus)
          const lastRou = [{ path: '*', redirect: '/404', hidden: true }]
          router.addRoutes(lastRou)
          // 3.将路由数据传递给全局变量，做侧边栏菜单渲染工作
          global.antRouter = menus
          next({
            ...to,
            replace: true
          })
        } catch (error) {
          // 删除token并转到登录页重新登录
          await store.dispatch('user/resetToken')
          Message.error(error || 'Has Error')
          next(`/login?redirect=${to.path}`)
          NProgress.done()
        }
      }
    }
  } else { /* 无token */
    if (whiteList.indexOf(to.path) !== -1) {
      // 跳转到白名单页
      next()
    } else {
      // 没有访问权限的页面重定向到登录页
      next(`/login?redirect=${to.path}`)
      NProgress.done()
    }
  }
})

// 进度条
router.afterEach(() => {
  NProgress.done()
})

/**
 * @description: 遍历后台传来的路由，转换为组件对象
 * @param {*} asyncRouterMap 路由
 * @return {*}
 */
function filterAsyncRouter(asyncRouterMap) {
  const accessedRouters = asyncRouterMap.filter(route => {
    if (route.component) {
      if (route.component === 'Layout') {
        route.component = Layout
      } else if (route.component === 'ParentView') {
        route.component = ParentView
      } else {
        try {
          // 导入组件
          route.component = _import(route.component)
        } catch (error) {
          console.log(error)
          // 导入组件
          route.component = _import('dashboard/index')
        }
      }
    }
    if (route.children && route.children.length > 0) {
      route.children = filterAsyncRouter(route.children)
    } else {
      delete route.children
    }
    return true
  })
  return accessedRouters
}
