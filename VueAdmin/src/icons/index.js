/*
 * @Description: icons组件配置入口
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */
import Vue from 'vue'
// svg 组件
import SvgIcon from '@/components/SvgIcon'

// 全局注册
Vue.component('svg-icon', SvgIcon)

const req = require.context('./svg', false, /\.svg$/)
const requireAll = requireContext => requireContext.keys().map(requireContext)
requireAll(req)
