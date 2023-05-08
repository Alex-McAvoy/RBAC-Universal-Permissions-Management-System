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
        this.sysMenuList = result.data
        const checkedIds = this.getCheckedIds(this.sysMenuList)
        this.$refs.tree.setCheckedKeys(checkedIds)

        // 对角色进行权限分配时，除系统管理员外，其他用户均不可进行系统管理权限分配
        const userId = this.$store.state.user.userId
        if (userId !== 1) {
          this.sysMenuList[0].disabled = true // 系统管理结点禁止勾选
          var oneChildren = this.sysMenuList[0].children // 获取系统管理的一级结点
          // 处理一级结点
          for (var i = 0; i < oneChildren.length; i++) {
            oneChildren[i].disabled = true // 一级结点禁止勾选
            // 处理二级结点
            var twoChildren = oneChildren[i].children // 系统管理的二级结点
            for (var j = 0; j < twoChildren.length; j++) {
              twoChildren[j].disabled = true // 二级结点禁止勾选
              // 处理三级结点
              var threeChildren = twoChildren[j].children // 系统管理的三级结点
              for (var k = 0; k < threeChildren.length; k++) {
                threeChildren[k].disabled = true // 三级结点禁止勾选
              }
            }
          }
        }
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
