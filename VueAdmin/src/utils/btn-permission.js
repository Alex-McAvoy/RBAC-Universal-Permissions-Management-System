/*
 * @Description: 按钮权限判断
 * @Author: Alex_McAvoy
 * @Date: 2023-02-26 21:57:07
 */

import store from '@/store'

/**
 * @description: 判断当前用户是否有此按钮权限
 * @param {*} permission 按钮权限字符串
 * @return {*}
 */
export default function hasBtnPermission(permission) {
  // 得到当前用户的所有按钮权限
  const buttons = store.getters.buttons
  // 如果指定的功能权限在buttons中, 返回true ==> 这个按钮就会显示, 否则隐藏
  return buttons.indexOf(permission) !== -1
}
