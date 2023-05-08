/*
 * @Description: 操作日志管理api
 * @Author: Alex_McAvoy
 * @Date: 2023-03-04 18:04:20
 */
import request from '@/utils/request'

const api_name = '/admin/system/sysOperLog'

export default {
  /**
   * @description: 根据操作日志id查询
   * @param {*} id 操作日志id
   * @return {*}
   */
  getOperLogById(id) {
    return request({
      url: `${api_name}/get/${id}`,
      method: 'get'
    })
  },
  /**
   * @description: 操作日志分页查询
   * @param {*} page 当前页
   * @param {*} limit 每页记录数
   * @param {*} searchObj 操作日志查询视图对象
   * @return {*}
   */
  getPageList(page, limit, searchObj) {
    return request({
      url: `${api_name}/${page}/${limit}`,
      method: 'get',
      params: searchObj
    })
  }
}
