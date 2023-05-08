/*
 * @Description: 开发环境导入组件，vue-loader最低版本为v13.0.0
 * @Author: Alex_McAvoy
 * @Date: 2023-02-26 20:52:24
 */

module.exports = file => require('@/views/' + file + '.vue').default
