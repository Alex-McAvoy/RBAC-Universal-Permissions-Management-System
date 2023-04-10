/*
 * @Description: 生产环境导入组件
 * @Author: Alex_McAvoy
 * @Date: 2023-02-26 20:52:04
 */
module.exports = file => () => import('@/views/' + file + '.vue')