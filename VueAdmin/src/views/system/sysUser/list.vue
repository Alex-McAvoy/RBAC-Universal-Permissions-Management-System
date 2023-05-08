<template>
  <div class="app-container">
    <!-- 搜索框 -->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row :gutter="30">
          <el-col :span="8">
            <el-form-item label="关 键 字">
              <el-input v-model="searchObj.keyword" placeholder="用户名/姓名/手机号码" style="width: 95%" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="创建时间">
              <el-date-picker
                v-model="createTimes"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                value-format="yyyy-MM-dd HH:mm:ss"
                style="margin-right: 10px;width: 100%;"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-button type="primary" icon="el-icon-search" size="mini" @click="fetchData()">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetData">重置</el-button>
          </el-col>
        </el-row>
      </el-form>
    </div>

    <!-- 工具条 -->
    <div class="tools-div">
      <el-button
        type="success"
        icon="el-icon-plus"
        size="mini"
        :disabled="$hasBP('bnt.sysUser.add') === false"
        @click="showAddDialog()"
      >添加</el-button>
      <el-button
        class="btn-add"
        size="mini"
        :disabled="$hasBP('bnt.sysUser.delete') === false"
        @click="batchDelete()"
      >批量删除</el-button>
    </div>

    <!-- 表格 -->
    <el-table
      v-loading="loading"
      :data="list"
      stripe
      border
      class="table"
      @selection-change="multiDeleteSelectionChange"
    >
      <el-table-column type="selection" :selectable="checkUserSelect" />
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名" width="180" align="center" />
      <el-table-column prop="name" label="姓名" width="110" align="center" />
      <el-table-column prop="phone" label="手机号" align="center" />
      <el-table-column label="状态" width="80" align="center">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.status === 1"
            :disabled="$hasBP('bnt.sysUser.update') === false || scope.row.id == 1 "
            @change="switchStatus(scope.row)"
          />
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间" align="center" />
      <el-table-column label="操作" align="center" fixed="right">
        <template slot-scope="scope">
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            title="修改"
            :disabled="$hasBP('bnt.sysUser.update') === false"
            @click="showUpdateDialog(scope.row.id)"
          />
          <el-button
            type="success"
            icon="el-icon-refresh"
            size="mini"
            title="重置密码"
            :disabled="$hasBP('bnt.sysUser.update') === false || scope.row.id === 1 || scope.row.id === 2"
            @click="resetPassword(scope.row.id)"
          />
          <el-button
            type="warning"
            icon="el-icon-baseball"
            size="mini"
            title="分配角色"
            :disabled="$hasBP('bnt.sysUser.assignRole') === false || scope.row.id === 1 || scope.row.id === 2"
            @click="showAssignRoleDialog(scope.row)"
          />
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            title="删除"
            :disabled="$hasBP('bnt.sysUser.delete') === false || scope.row.id === 1 || scope.row.id === 2"
            @click="deleteUserById(scope.row.id)"
          />
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-size="limit"
      class="pagination"
      layout="total, prev, pager, next, jumper"
      @current-change="fetchData"
    />

    <!-- 添加模态框 -->
    <el-dialog title="添加用户" :visible.sync="addDialogVisible" width="40%">
      <el-form ref="addUserForm" :rules="addUserFormRule" :model="addUserForm" label-width="100px" size="small" style="padding-right: 40px;">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="addUserForm.username" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="addUserForm.name" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" size="small" icon="el-icon-check" @click="saveUser()">确 定</el-button>
        <el-button size="small" icon="el-icon-refresh-right" @click="addDialogVisible = false">取
          消</el-button>
      </span>
      <div class="tips">
        tips: 用户名请设为学号，密码默认 123456
      </div>
    </el-dialog>

    <!-- 修改模态框 -->
    <el-dialog title="修改用户" :visible.sync="updateDialogVisible" width="40%">
      <el-form ref="updateUserForm" :rules="updateUserFormRule" :model="updateUserForm" label-width="100px" size="small" style="padding-right: 40px;">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="updateUserForm.username" :disabled="true" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="updateUserForm.name" :disabled="updateUserForm.id == 1 || updateUserForm.id == 2" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="updateUserForm.phone" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" size="small" icon="el-icon-check" @click="updateUser()">确 定</el-button>
        <el-button size="small" icon="el-icon-refresh-right" @click="updateDialogVisible = false">取
          消</el-button>
      </span>
      <div class="tips">
        tips: 密码中必须包含字母、数字，长度至少为 8 位，最多 16 位
      </div>
    </el-dialog>

    <!-- 分配角色模态框 -->
    <el-dialog title="分配角色" :visible.sync="assignRoleDialogVisible">
      <el-form label-width="80px">
        <el-form-item label="用户名">
          <el-input disabled :value="assignUser.username" />
        </el-form-item>

        <el-form-item label="角色列表">
          <el-checkbox
            v-model="checkAllRole"
            :indeterminate="isIndeterminate"
            @change="assignRoleSelectAll"
          >全选</el-checkbox>
          <el-checkbox-group v-model="userRoleIds" @change="assignRoleCheckedChange">
            <el-checkbox v-for="role in allRoles" :key="role.id" :label="role.id" :disabled="role.id === 1 || role.id === 2">
              {{ role.roleName }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button type="primary" size="small" @click="assignRole">保存</el-button>
        <el-button size="small" @click="assignRoleDialogVisible = false">取消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import sysUserApi from '@/api/system/SysUser.js'
import sysRoleApi from '@/api/system/SysRole.js'
import sysUserRoleApi from '@/api/system/SysUserRole.js'
import { validateNotNull, validateUsername, validatePhone } from '@/utils/validate'

export default {
  data() {
    // 用户名校验规则
    const usernameValidator = async(rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入用户名'))
      } else if (await validateUsername(value)) {
        callback(new Error('用户名重复'))
      } else {
        callback()
      }
    }
    // 姓名校验规则
    const nameValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入姓名'))
      } else {
        callback()
      }
    }
    // 手机号校验规则
    const phoneValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入手机号'))
      } else if (!validatePhone(value)) {
        callback(new Error('手机号格式错误'))
      } else {
        callback()
      }
    }
    return {
      /** ---------- 数据加载 ---------- **/
      loading: true, // 是否显示加载图标
      list: null, // 数据列表
      total: 0, // 总记录数
      page: 1, // 当前页
      limit: 10, // 每页记录数
      /** ---------- 数据查询 ---------- **/
      searchObj: {}, // 条件查询封装对象
      createTimes: [], // 按创建时间查询时的时间封装对象
      /** ---------- 添加用户 ---------- **/
      addDialogVisible: false, // 添加模态框是否显示
      addUserForm: { // 添加用户表单
        id: '',
        username: '',
        password: '',
        name: '',
        phone: '',
        headUrl: '',
        status: ''
      },
      addUserFormRule: { // 添加用户表单校验规则
        username: [{ required: true, trigger: ['blur', 'change'], validator: usernameValidator }],
        name: [{ required: true, trigger: ['blur', 'change'], validator: nameValidator }]
      },
      /** ---------- 修改用户信息 ---------- **/
      updateDialogVisible: false, // 修改模态框是否显示
      updateUserForm: { // 修改用户信息表单
        id: '',
        username: '',
        password: '',
        name: '',
        phone: '',
        headUrl: '',
        status: ''
      },
      updateUserFormRule: { // 修改用户信息表单表单校验规则
        name: [{ required: true, trigger: ['blur', 'change'], validator: usernameValidator }],
        phone: [{ required: true, trigger: ['blur', 'change'], validator: phoneValidator }]
      },
      /** ---------- 分配用户角色 ---------- **/
      assignRoleDialogVisible: false, // 分配角色模态框是否显示
      assignUser: '', // 要分配角色的用户id
      allRoles: [], // 所有角色列表
      userRoleIds: [], // 用户角色id列表
      checkAllRole: false, // 是否全选角色
      isIndeterminate: false, // 全选框是否是不确定的
      /** ---------- 删除用户 ---------- **/
      multiDeleteSelection: [] // 批量删除选中的记录列表
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },
  methods: {
    /** ---------- 数据加载 ---------- **/
    // 发送ajax请求，获取分页查询数据
    fetchData(page = 1) {
      this.page = page
      if (this.createTimes && this.createTimes.length === 2) {
        this.searchObj.createTimeBegin = this.createTimes[0]
        this.searchObj.createTimeEnd = this.createTimes[1]
      }
      sysUserApi.getPageList(this.page, this.limit, this.searchObj)
        .then(response => {
          this.list = response.data.records
          this.total = response.data.total
          this.loading = false
        })
    },
    // 重置查询表单
    resetData() {
      this.searchObj = {}
      this.createTimes = []
      this.fetchData()
    },
    /** ---------- 添加用户 ---------- **/
    // 弹出添加模态框
    showAddDialog() {
      this.addDialogVisible = true
      this.addUserForm = {
        id: '',
        username: '',
        password: '123456', // 添加用户默认初始密码为 123456
        name: '',
        headUrl: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', // 添加用户默认头像
        status: 1
      }
    },
    // 添加用户
    saveUser() {
      this.$refs.addUserForm.validate(valid => {
        // 对表单进行验证
        if (valid) {
          sysUserApi.saveUser(this.addUserForm).then(response => {
            this.$message.success('操作成功')
            this.addDialogVisible = false
            this.fetchData(this.page)
          })
        } else {
          return false
        }
      })
    },
    /** ---------- 修改用户信息 ---------- **/
    // 弹出修改用户模态框并数据回显
    showUpdateDialog(id) {
      this.updateDialogVisible = true
      sysUserApi.getUserById(id).then(response => {
        this.updateUserForm = response.data
      })
    },
    // 修改用户
    updateUser() {
      this.$refs.updateUserForm.validate(valid => {
        // 对表单进行验证
        if (valid) {
          sysUserApi.updateUser(this.updateUserForm).then(response => {
            this.$message.success('修改成功')
            this.updateDialogVisible = false
            this.fetchData(this.page)
          })
        } else {
          return false
        }
      })
    },
    // 更新用户状态
    switchStatus(row) {
      row.status = row.status === 1 ? 0 : 1
      sysUserApi.updateStatus(row.id, row.status).then(response => {
        if (response.code) {
          this.$message.success('更新成功')
          this.fetchData()
        }
      })
    },
    /** ---------- 重置密码 ---------- **/
    resetPassword(id) {
      this.$confirm('是否将密码重置为：123456?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return sysUserApi.resetPassword(id)
      }).then((response) => {
        this.fetchData(this.page)
        this.$message.success('重置成功')
      }).catch(() => {
        this.$message.info('取消重置')
      })
    },
    /** ---------- 分配用户角色 ---------- **/
    // 展示已分配角色
    showAssignRoleDialog(row) {
      this.assignUser = row
      this.assignRoleDialogVisible = true
      sysRoleApi.findAllRole().then(response => {
        this.allRoles = response.data
      })
      sysUserRoleApi.getRolesByUserId(row.id).then(response => {
        this.userRoleIds = response.data
        // 是否全选
        this.checkAllRole = this.userRoleIds.length === this.allRoles.length - 2
        // 是否是不确定的
        this.isIndeterminate = (this.userRoleIds.length < this.allRoles.length - 2) && (this.userRoleIds.length > 0)
      })
    },
    // 角色列表全选状态发生改变的监听，value为当前勾选状态
    assignRoleSelectAll(value) {
      // 如果当前全选, userRoleIds就是除root用户与管理员外所有角色id的数组, 否则是空数组
      const roleArray = JSON.parse(JSON.stringify(this.allRoles))
      roleArray.shift() // 移除root用户
      roleArray.shift() // 移除管理员用户
      this.userRoleIds = value ? roleArray.map(item => item.id) : []
      // 如果当前不是全选也不全不选时, 指定为false
      this.isIndeterminate = false
    },
    // 角色列表选中项发生改变的监听
    assignRoleCheckedChange(value) {
      const { userRoleIds, allRoles } = this
      // 是否全选
      this.checkAllRole = (userRoleIds.length === allRoles.length - 2) && (allRoles.length > 0)
      // 是否是不确定的
      this.isIndeterminate = (userRoleIds.length < allRoles.length - 2) && (userRoleIds.length > 0)
    },
    // 分配角色
    assignRole() {
      const assignRoleVo = {
        userId: this.assignUser.id,
        roleIdList: this.userRoleIds
      }
      sysUserRoleApi.assignRoles(assignRoleVo).then(response => {
        this.$message.success('分配角色成功')
        this.assignRoleDialogVisible = false
        this.fetchData(this.page)
      })
    },
    /** ---------- 删除用户 ---------- **/
    // 根据id删除用户
    deleteUserById(id) {
      if (id === 1) {
        this.$message.error('无法删除根用户')
      } else if (id === 2) {
        this.$message.error('无法删除管理员用户')
      } else {
        // 点击确定，远程调用ajax
        this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          return sysUserApi.deleteUserById(id)
        }).then((response) => {
          this.fetchData(this.page)
          this.$message.success('删除成功')
        }).catch(() => {
          this.$message.info('取消删除')
        })
      }
    },
    // 检查用户列表中的root和admin两行是否可选中
    checkUserSelect(row, index) {
      if (row.id === 1 || row.id === 2) {
        return false
      }
      return true
    },
    // 批量删除多选框发生变化的时获取选中的ids
    multiDeleteSelectionChange(selection) {
      this.multiDeleteSelection = selection
    },
    // 批量删除
    batchDelete() {
      if (this.multiDeleteSelection.length === 0) {
        this.$message.warning('请选择要删除的记录！')
        return
      }

      // 禁止删除根用户和管理员用户
      let flag = false
      this.multiDeleteSelection.forEach(item => {
        if (item.id === 1 || item.id === 2) {
          this.$message.error('无法删除根用户或管理员用户')
          flag = true
        }
      })
      if (flag) {
        return
      }

      // 点击确定，远程调用ajax
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        var idList = []
        // 遍历selection，将id取出放入id列表
        this.multiDeleteSelection.forEach(item => {
          idList.push(item.id)
        })
        return sysUserApi.batchDelete(idList)
      }).then((response) => {
        this.fetchData()
        this.$message.success(response.message)
      }).catch(error => {
        if (error === 'cancel') {
          this.$message.info('取消删除')
        }
      })
    }
  }
}
</script>

<style scoped>
.tips {
  font-size: 14px;
  color: #000000;
  text-align: center;
  margin-top: 40px;
}
.table {
  width: 100%;
  margin-top: 10px;
}

.pagination {
  padding: 30px 0;
  text-align: center;
}

.search-div {
  padding: 10px;
  border: 1px solid #EBEEF5;
  border-radius: 3px;
}

.tools-div {
  margin-top: 10px;
  padding: 10px;
  border: 1px solid #EBEEF5;
  border-radius: 3px;
}
</style>
