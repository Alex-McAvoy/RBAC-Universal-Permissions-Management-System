/*
 * @Description: 角色-菜单管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-02-21 21:35:24
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysRoleMenu'

export default {
  /**
   * @description: 根据角色id查询角色已分配菜单权限
   * @param {*} roleId 角色id
   * @return {*}
   */
  getMenuByUserId(roleId) {
    return request({
      url: `${api_name}/toAssign/${roleId}`,
      method: 'get'
    })
  },
  /**
   * @description: 为角色分配菜单权限
   * @param {*} assignMenuVo 菜单权限分配视图对象
   * @return {*}
   */
  assignMenu(assignMenuVo) {
    return request({
      url: `${api_name}/doAssign`,
      method: 'post',
      data: assignMenuVo
    })
  }
}
