/*
 * @Description: 校验工具
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */

/**
 * @description: 检查是否为外链
 * @param {string} path url
 * @returns {Boolean}
 */
export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

/**
 * @description: 验证用户名
 * @param {string} str 用户名
 * @returns {Boolean}
 */
export function validUsername(str) {
  const valid_map = ['admin', 'root', 'tom', 'test', 'editor']
  return valid_map.indexOf(str.trim()) >= 0
}
