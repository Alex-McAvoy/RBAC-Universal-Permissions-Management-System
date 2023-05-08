/*
 * @Description: 用户容器
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */
import { login, logout, getInfo } from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'
import { resetRouter } from '@/router'

// 默认用户状态
const getDefaultState = () => {
  return {
    userId: '', // 用户id
    token: getToken(), // token
    username: '', // 用户名
    avatar: '', // 头像
    buttons: [], // 按钮
    menus: '' // 菜单
  }
}
const state = getDefaultState()

const mutations = {
  // 重置状态
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  // 设置用户id
  SET_USER_ID: (state, userId) => {
    state.userId = userId
  },
  // 设置token
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  // 设置用户名
  SET_USERNAME: (state, username) => {
    state.username = username
  },
  // 设置头像
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  // 设置按钮
  SET_BUTTONS: (state, buttons) => {
    state.buttons = buttons
  },
  // 设置菜单
  SET_MENUS: (state, menus) => {
    state.menus = menus
  }
}

const actions = {
  // 用户登录
  login({ commit }, userInfo) {
    const { username, password } = userInfo
    return new Promise((resolve, reject) => {
      login({ username: username.trim(), password: password }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.token)
        setToken(data.token)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 获取用户信息
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getInfo(state.token).then(response => {
        const { data } = response

        if (!data) {
          return reject('验证失败，请重新登录')
        }

        commit('SET_USER_ID', data.userId)
        commit('SET_USERNAME', data.username)
        commit('SET_AVATAR', data.avatar)
        commit('SET_BUTTONS', data.buttons)
        commit('SET_MENUS', data.routers)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 用户登出
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        // 必须先移除token
        removeToken()
        resetRouter()
        commit('RESET_STATE')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 移除token
  resetToken({ commit }) {
    return new Promise(resolve => {
      // 必须先移除token
      removeToken()
      commit('RESET_STATE')
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

