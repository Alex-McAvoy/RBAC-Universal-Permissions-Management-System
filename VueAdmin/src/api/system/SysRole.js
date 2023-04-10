/*
 * @Description: 角色管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:52:36
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysRole'

export default {
  /**
   * @description: 添加角色
   * @param {*} role 角色
   * @return {*}
   */
  saveRole(role) {
    return request({
      url: `${api_name}/save`,
      method: 'post',
      data: role
    })
  },
  /**
   * @description: 根据角色id删除角色
   * @param {*} id 角色id
   * @return {*}
   */
  deleteRoleById(id) {
    return request({
      url: `${api_name}/delete/${id}`,
      method: 'delete'
    })
  },
  /**
   * @description: 批量删除角色
   * @param {*} idList 角色id列表
   * @return {*}
   */
  batchDelete(idList) {
    return request({
      url: `${api_name}/batchDelete`,
      method: `delete`,
      data: idList
    })
  },
  /**
   * @description: 根据角色id查询
   * @param {*} id 角色id
   * @return {*}
   */
  getRoleById(id) {
    return request({
      url: `${api_name}/get/${id}`,
      method: 'get'
    })
  },
  /**
   * @description: 修改角色
   * @param {*} role 角色
   * @return {*}
   */
  updateRole(role) {
    return request({
      url: `${api_name}/update`,
      method: 'put',
      data: role
    })
  },
  /**
   * @description: 角色分页查询
   * @param {*} page 当前页
   * @param {*} limit 每页记录数
   * @param {*} searchObj 角色查询视图对象
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
   * @description: 获取所有角色
   * @return {*}
   */
  findAllRole() {
    return request({
      url: `${api_name}/findAll`,
      method: 'get'
    })
  }
}
