const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  userId: state => state.user.userId,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.username,
  buttons: state => state.user.buttons,
  menus: state => state.user.menus
}
export default getters
