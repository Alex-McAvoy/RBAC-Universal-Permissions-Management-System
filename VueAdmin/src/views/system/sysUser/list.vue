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
      v-loading="listLoading"
      :data="list"
      stripe
      border
      class="table"
      @selection-change="handleUpdateDialogSelectionChange"
    >
      <el-table-column type="selection" :selectable="checkSelect" />
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
            type="warning"
            icon="el-icon-baseball"
            size="mini"
            title="分配角色"
            :disabled="$hasBP('bnt.sysUser.assignRole') === false || scope.row.id == 1"
            @click="showAssignRoleDialog(scope.row)"
          />
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            title="删除"
            :disabled="$hasBP('bnt.sysUser.delete') === false || scope.row.id == 1"
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

    <!-- 添加/修改模态框 -->
    <el-dialog :title="addOrUpdateDialogTitle" :visible.sync="addOrUpdateDialogVisible" width="40%">
      <el-form ref="dataForm" :model="sysUser" label-width="100px" size="small" style="padding-right: 40px;">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="sysUser.username" :disabled="sysUser.id == 1" />
        </el-form-item>
        <el-form-item v-if="!sysUser.id" label="密码" prop="password">
          <el-input v-model="sysUser.password" type="password" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="sysUser.name" :disabled="sysUser.id == 1" />
        </el-form-item>
        <el-form-item label="手机" prop="phone">
          <el-input v-model="sysUser.phone" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" icon="el-icon-refresh-right" @click="addOrUpdateDialogVisible = false">取
          消</el-button>
        <el-button type="primary" size="small" icon="el-icon-check" @click="saveOrUpdateUser()">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 分配角色模态框 -->
    <el-dialog title="分配角色" :visible.sync="assignRoleDialogVisible">
      <el-form label-width="80px">
        <el-form-item label="用户名">
          <el-input disabled :value="sysUser.username" />
        </el-form-item>

        <el-form-item label="角色列表">
          <el-checkbox
            v-model="checkAll"
            :indeterminate="isIndeterminate"
            @change="handleAssignRoleDialogCheckAllChange"
          >全选</el-checkbox>
          <el-checkbox-group v-model="userRoleIds" @change="handleAssignRoleDialogCheckedChange">
            <el-checkbox v-for="role in allRoles" :key="role.id" :label="role.id">{{ role.roleName
            }}</el-checkbox>
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

const defaultForm = {
  id: '',
  username: '',
  password: '',
  name: '',
  phone: '',
  status: 1
}
export default {
  data() {
    return {
      listLoading: true, // 是否显示加载图标
      list: null, // 数据列表
      total: 0, // 总记录数
      page: 1, // 当前页
      limit: 10, // 每页记录数
      searchObj: {}, // 条件查询封装对象
      createTimes: [], // 按创建时间查询时的时间封装对象
      multipleSelection: [], // 批量删除选中的记录列表
      addOrUpdateDialogTitle: '', // 添加/修改模态框标题
      addOrUpdateDialogVisible: false, // 添加/修改模态框是否显示
      sysUser: defaultForm, // 添加用户表单初始值
      assignRoleDialogVisible: false, // 分配用户模态框是否显示
      allRoles: [], // 所有角色列表
      userRoleIds: [], // 用户角色id列表
      checkAll: false, // 是否全选
      isIndeterminate: false // 是否是不确定的
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },
  methods: {
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
          this.listLoading = false
        }
        )
    },
    // 重置查询表单
    resetData() {
      this.searchObj = {}
      this.createTimes = []
      this.fetchData()
    },
    // 根据id删除用户
    deleteUserById(id) {
      if (id === 1) {
        this.$message.error('无法删除root用户')
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
          this.$message.success(response.message || '删除成功')
        }).catch(() => {
          this.$message.info('取消删除')
        })
      }
    },
    // 弹出添加模态框
    showAddDialog() {
      this.addOrUpdateDialogTitle = '添加用户'
      this.addOrUpdateDialogVisible = true
      this.sysUser = {}
    },
    // 添加或更新用户
    saveOrUpdateUser() {
      if (!this.sysUser.id) {
        this.saveUser()
      } else {
        this.updateUser()
      }
    },
    // 添加用户
    saveUser() {
      sysUserApi.saveUser(this.sysUser).then(response => {
        this.$message.success('操作成功')
        this.addOrUpdateDialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 弹出修改用户模态框并数据回显
    showUpdateDialog(id) {
      this.addOrUpdateDialogTitle = '修改用户'
      this.addOrUpdateDialogVisible = true
      sysUserApi.getUserById(id).then(response => {
        this.sysUser = response.data
      })
    },
    // 修改用户
    updateUser() {
      sysUserApi.updateUser(this.sysUser).then(response => {
        this.$message.success(response.message || '操作成功')
        this.addOrUpdateDialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 检查root行是否可选中
    checkSelect(row, index) {
      if (row.id === 1) {
        return false
      }
      return true
    },
    // 多选框发生变化的时获取选中的ids
    handleUpdateDialogSelectionChange(selection) {
      this.multipleSelection = selection
    },
    // 批量删除
    batchDelete() {
      if (this.multipleSelection.length === 0) {
        this.$message.warning('请选择要删除的记录！')
        return
      }

      // 禁止删除root
      let flag = false
      this.multipleSelection.forEach(item => {
        if (item.id === 1) {
          this.$message.error('无法删除root用户')
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
        this.multipleSelection.forEach(item => {
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
    },
    // 更新用户状态
    switchStatus(row) {
      row.status = row.status === 1 ? 0 : 1
      sysUserApi.updateStatus(row.id, row.status).then(response => {
        if (response.code) {
          this.$message.success(response.message || '操作成功')
          this.fetchData()
        }
      })
    },
    // 展示分配角色
    showAssignRoleDialog(row) {
      this.sysUser = row
      this.assignRoleDialogVisible = true
      sysRoleApi.findAllRole().then(response => {
        this.allRoles = response.data
      })
      sysUserRoleApi.getRolesByUserId(row.id).then(response => {
        this.userRoleIds = response.data
        this.checkAll = this.userRoleIds.length === this.allRoles.length
        this.isIndeterminate = this.userRoleIds.length > 0 && this.userRoleIds.length < this.allRoles.length
      })
    },
    // 全选状态发生改变的监听，value为当前勾选状态
    handleAssignRoleDialogCheckAllChange(value) {
      // 如果当前全选, userRoleIds就是所有角色id的数组, 否则是空数组
      this.userRoleIds = value ? this.allRoles.map(item => item.id) : []
      // 如果当前不是全选也不全不选时, 指定为false
      this.isIndeterminate = false
    },
    // 角色列表选中项发生改变的监听
    handleAssignRoleDialogCheckedChange(value) {
      const { userRoleIds, allRoles } = this
      this.checkAll = userRoleIds.length === allRoles.length && allRoles.length > 0
      this.isIndeterminate = userRoleIds.length > 0 && userRoleIds.length < allRoles.length
    },
    // 分配角色
    assignRole() {
      const assignRoleVo = {
        userId: this.sysUser.id,
        roleIdList: this.userRoleIds
      }
      sysUserRoleApi.assignRoles(assignRoleVo).then(response => {
        this.$message.success(response.message || '分配角色成功')
        this.assignRoleDialogVisible = false
        this.fetchData(this.page)
      })
    }
  }
}
</script>

<style scoped>
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
