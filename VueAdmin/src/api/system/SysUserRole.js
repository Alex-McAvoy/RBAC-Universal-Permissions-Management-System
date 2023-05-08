/*
 * @Description: 角色-用户管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-02-19 16:59:16
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysUserRole'

export default {
  /**
   * @description: 根据用户id查询用户已分配角色
   * @param {*} userId 用户id
   * @return {*}
   */
  getRolesByUserId(userId) {
    return request({
      url: `${api_name}/toAssign/${userId}`,
      method: 'get'
    })
  },
  /**
   * @description: 为用户分配角色
   * @param {*} assignRoleVo 角色分配视图对象
   * @return {*}
   */
  assignRoles(assignRoleVo) {
    return request({
      url: `${api_name}/doAssign`,
      method: 'post',
      data: assignRoleVo
    })
  }
}
