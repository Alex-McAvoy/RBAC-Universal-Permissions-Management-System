/*
 * @Description: 校验工具
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */

import sysUserApi from '@/api/system/SysUser.js'

/**
 * @description: 检查是否为外链
 * @param {string} path url
 * @returns {Boolean}
 */
export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

/**
 * @description: 异步验证用户名
 * @param {string} username 用户名
 * @returns {Boolean}
 */
export async function validateUsername(username) {
  let flag = false
  await sysUserApi.getUserByUsername(username)
    .then(response => {
      flag = response.data
    })
  return flag
}

/**
 * @description: 验证字符串是否为空
 * @param {string} str 字符串
 * @returns {Boolean}
 */
export function validateNotNull(str) {
  return str !== ''
}

/**
 * @description: 验证手机号
 * @param {string} phone 手机号
 * @returns {Boolean}
 */
export function validatePhone(phone) {
  const re = /^1((34[0-8])|(8\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\d{1}))\d{7}$/
  return re.test(phone)
}

/**
 * @description: 验证密码
 * @param {string} phone 密码
 * @returns {Boolean}
 */
export function validatePassword(password) {
  // 包含字母、数字，长度至少为 8 位，最多 16 位
  const re = /^(?=.*[a-zA-Z])(?=.*\d)[^]{8,16}$/
  return re.test(password)
}

