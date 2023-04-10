<template>
  <div class="app-container">
    <div style="padding: 20px 20px 0 20px;">
      授权角色：{{ $route.query.roleName }}
    </div>
    <el-tree
      ref="tree"
      style="margin: 20px 0"
      :data="sysMenuList"
      node-key="id"
      show-checkbox
      default-expand-all
      :props="defaultProps"
    />
    <div style="padding: 20px 20px;">
      <el-button :loading="loading" type="primary" icon="el-icon-check" size="mini" @click="updateMenuAuth">保存</el-button>
      <el-button size="mini" icon="el-icon-refresh-right" @click="$router.push('/system/sysRole')">返回</el-button>
    </div>
  </div>
</template>
<script>
import sysRoleMenuApi from '@/api/system/SysRoleMenu.js'

export default {
  data() {
    return {
      loading: false, // 用来标识是否正在保存请求中的标识, 防止重复提交
      sysMenuList: [], // 菜单列表
      defaultProps: {
        children: 'children',
        label: 'name'
      }
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },
  methods: {
    // 发送ajax请求，获取菜单列表
    fetchData() {
      const roleId = this.$route.query.id
      sysRoleMenuApi.getMenuByUserId(roleId).then(result => {
        const sysMenuList = result.data
        this.sysMenuList = sysMenuList
        const checkedIds = this.getCheckedIds(sysMenuList)
        this.$refs.tree.setCheckedKeys(checkedIds)
      })
    },
    // 获取当前角色已选定的权限列表
    getCheckedIds(auths, initArr = []) {
      return auths.reduce((pre, item) => {
        if (item.select && item.children.length === 0) {
          pre.push(item.id)
        } else if (item.children) {
          this.getCheckedIds(item.children, initArr)
        }
        return pre
      }, initArr)
    },
    // 更新权限列表
    updateMenuAuth() {
      // 获取到当前子节点及父节点
      const allCheckedNodes = this.$refs.tree.getCheckedNodes(false, true)
      const idList = allCheckedNodes.map(node => node.id)
      const assignMenuVo = {
        roleId: this.$route.query.id,
        menuIdList: idList
      }
      this.loading = true
      sysRoleMenuApi.assignMenu(assignMenuVo).then(result => {
        this.loading = false
        this.$message.success(result.$message || '分配权限成功')
        this.$router.push('/system/sysRole')
      })
    }
  }
}
</script>
