/*
 * @Description: 用户管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 20:11:35
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysUser'

export default {

  /**
   * @description: 根据用户id获取用户信息（基本信息）
   * @param {*} id 用户id
   * @return {*}
   */
  getUserInfoByUserId(id) {
    return request({
      url: `${api_name}/getUserInfo/${id}`,
      method: 'get'
    })
  },
  /**
   * @description: 根据用户id获取用户
   * @param {*} id 用户id
   * @return {*}
   */
  getUserById(id) {
    return request({
      url: `${api_name}/get/${id}`,
      method: 'get'
    })
  },
  /**
   * @description: 根据用户名判断用户是否存在
   * @param {*} username 用户名
   * @return {*}
   */
  getUserByUsername(username) {
    return request({
      url: `${api_name}/getUser/${username}`,
      method: 'get'
    })
  },
  /**
   * @description: 根据用户id修改密码
   * @param {*} passwordList 用户密码列表，第0个元素为用户id，第一个为用户原密码，第二个为用户新密码
   * @return {*}
   */
  updatePassword(passwordList) {
    return request({
      url: `${api_name}/updatePassword`,
      method: 'put',
      data: passwordList
    })
  },
  /**
   * @description: 根据用户id重置密码
   * @param {*} id 用户id
   * @return {*}
   */
  resetPassword(id) {
    return request({
      url: `${api_name}/resetPassword/${id}`,
      method: 'post'
    })
  },
  /**
   * @description: 用户分页查询
   * @param {*} page 当前页
   * @param {*} limit 每页记录数
   * @param {*} searchObj 用户查询视图对象
   * @return {*}
   */
  getPageList(page, limit, searchObj) {
    return request({
      url: `${api_name}/${page}/${limit}`,
      method: 'get',
      params: searchObj
    })
  },
  /**
   * @description: 添加用户
   * @param {*} user 用户
   * @return {*}
   */
  saveUser(user) {
    return request({
      url: `${api_name}/save`,
      method: 'post',
      data: user
    })
  },
  /**
   * @description: 修改用户
   * @param {*} user 用户
   * @return {*}
   */
  updateUser(user) {
    return request({
      url: `${api_name}/update`,
      method: 'put',
      data: user
    })
  },
  /**
   * @description: 用户状态更新
   * @param {*} id 用户id
   * @param {*} status 状态
   * @return {*}
   */
  updateStatus(id, status) {
    return request({
      url: `${api_name}/updateStatus/${id}/${status}`,
      method: 'put'
    })
  },
  /**
   * @description: 根据用户id删除用户
   * @param {*} id 用户id
   * @return {*}
   */
  deleteUserById(id) {
    return request({
      url: `${api_name}/delete/${id}`,
      method: 'delete'
    })
  },
  /**
   * @description: 批量删除用户
   * @param {*} idList 用户id列表
   * @return {*}
   */
  batchDelete(idList) {
    return request({
      url: `${api_name}/batchDelete`,
      method: `delete`,
      data: idList
    })
  }
}
