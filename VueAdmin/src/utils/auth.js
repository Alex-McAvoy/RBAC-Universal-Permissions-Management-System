/*
 * @Description: 从cookie中取、放、删token
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */
import Cookies from 'js-cookie'

const TokenKey = 'vue_admin_template_token'

/**
 * @description: 从cookie中取token
 * @return {*}
 */
export function getToken() {
  return Cookies.get(TokenKey)
}

/**
 * @description: 向cookie中设置token
 * @param {*} token token
 * @return {*}
 */
export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

/**
 * @description: 从cookie中移除token
 * @return {*}
 */
export function removeToken() {
  return Cookies.remove(TokenKey)
}
