/*
 * @Description: 菜单管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-02-20 22:27:36
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysMenu'

export default {
  /**
   * @description: 新增菜单结点
   * @param {*} sysMenu 菜单结点
   * @return {*}
   */
  saveMenu(sysMenu) {
    return request({
      url: `${api_name}/save`,
      method: 'post',
      data: sysMenu
    })
  },
  /**
   * @description: 根据id删除菜单结点
   * @param {*} id 菜单结点id
   * @return {*}
   */
  deleteMenuById(id) {
    return request({
      url: `${api_name}/delete/${id}`,
      method: 'delete'
    })
  },
  /**
   * @description: 修改菜单结点
   * @param {*} sysMenu 菜单结点
   * @return {*}
   */
  updateMenu(sysMenu) {
    return request({
      url: `${api_name}/update`,
      method: 'put',
      data: sysMenu
    })
  },
  /**
   * @description: 获取整个菜单
   * @return {*}
   */
  findNodes() {
    return request({
      url: `${api_name}/findNodes`,
      method: 'get'
    })
  },
  /**
   * @description: 菜单状态更新
   * @param {*} id 菜单节点id
   * @param {*} status 状态
   * @return {*}
   */
  updateStatus(id, status) {
    return request({
      url: `${api_name}/updateStatus/${id}/${status}`,
      method: 'put'
    })
  }
}
