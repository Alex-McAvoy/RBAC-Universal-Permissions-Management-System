<template>
  <div class="app-container">

    <!-- 搜索框 -->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row :gutter="30">
          <el-col :span="12">
            <el-form-item label="角色名称">
              <el-input v-model="searchObj.roleName" style="width: 100%" placeholder="角色名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-button type="primary" icon="el-icon-search" size="mini" @click="fetchData()">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetData()">重置</el-button>
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
        :disabled="$hasBP('bnt.sysRole.add') === false"
        @click="showSaveDialog()"
      >添 加</el-button>
      <el-button
        class="btn-add"
        size="mini"
        :disabled="$hasBP('bnt.sysRole.delete') === false"
        @click="batchDelete()"
      >批量删除</el-button>
    </div>

    <!-- 表格 -->
    <el-table v-loading="listLoading" :data="list" stripe border class="table" @selection-change="handleSelectionChange">
      <el-table-column type="selection" />
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="roleName" label="角色名称" align="center" />
      <el-table-column prop="roleCode" label="角色编码" align="center" />
      <el-table-column prop="createTime" label="创建时间" align="center" />
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            title="修改"
            :disabled="$hasBP('bnt.sysRole.update') === false"
            @click="showUpdateDialog(scope.row.id)"
          />
          <el-button
            type="warning"
            icon="el-icon-baseball"
            size="mini"
            title="分配权限"
            :disabled="$hasBP('bnt.sysRole.assignMenuAuth') === false"
            @click="showAssignMenuDialog(scope.row)"
          />
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            title="删除"
            :disabled="$hasBP('bnt.sysRole.delete') === false"
            @click="deleteRoleById(scope.row.id)"
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

    <!-- 弹出层模态框 -->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="40%">
      <el-form ref="dataForm" :model="sysRole" label-width="150px" size="small" style="padding-right: 40px;">
        <el-form-item label="角色名称">
          <el-input v-model="sysRole.roleName" />
        </el-form-item>
        <el-form-item label="角色编码">
          <el-input v-model="sysRole.roleCode" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" icon="el-icon-refresh-right" @click="dialogVisible = false">取 消</el-button>
        <el-button size="small" type="primary" icon="el-icon-check" @click="saveOrUpdateRole()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import sysRoleApi from '@/api/system/SysRole.js'

const defaultForm = {
  id: '',
  roleName: '',
  roleCode: ''
}

export default {
  data() {
    return {
      listLoading: true, // 是否显示加载图标
      list: [], // 角色列表
      total: 0, // 总记录数
      page: 1, // 当前页
      limit: 10, // 每页记录数
      searchObj: {}, // 条件查询封装对象
      multipleSelection: [], // 批量删除选中的记录列表
      sysRole: defaultForm, // 添加角色表单初始值
      dialogTitle: '', // 弹出层模态框标题
      dialogVisible: false // 弹出层模态框是否显示
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },
  methods: {
    // 发送ajax请求，获取分页查询数据
    fetchData(pageNum = 1) {
      this.page = pageNum
      sysRoleApi.getPageList(this.page, this.limit, this.searchObj)
        .then(result => {
          this.list = result.data.records
          this.total = result.data.total
          this.listLoading = false
        })
    },
    // 重置查询表单
    resetData() {
      this.searchObj = {}
      this.fetchData()
    },
    // 根据id删除角色
    deleteRoleById(id) {
      // 点击确定，远程调用ajax
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return sysRoleApi.deleteRoleById(id)
      }).then((response) => {
        this.fetchData(this.page)
        this.$message.success(response.message || '删除成功')
      }).catch(() => {
        this.$message.info('取消删除')
      })
    },
    // 弹出添加表单模态框
    showSaveDialog() {
      this.dialogTitle = '添加角色'
      this.dialogVisible = true
      this.sysRole = {}
    },
    // 添加或更新角色
    saveOrUpdateRole() {
      if (!this.sysRole.id) {
        this.saveRole()
      } else {
        this.updateRole()
      }
    },
    // 添加角色
    saveRole() {
      sysRoleApi.saveRole(this.sysRole).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 弹出修改角色模态框并数据回显
    showUpdateDialog(id) {
      this.dialogTitle = '修改角色'
      this.dialogVisible = true
      sysRoleApi.getRoleById(id).then(response => {
        this.sysRole = response.data
      })
    },
    // 修改角色
    updateRole() {
      sysRoleApi.updateRole(this.sysRole).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 多选框发生变化的时获取选中的ids
    handleSelectionChange(selection) {
      this.multipleSelection = selection
    },
    // 批量删除
    batchDelete() {
      if (this.multipleSelection.length === 0) {
        this.$message.warning('请选择要删除的记录！')
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
        return sysRoleApi.batchDelete(idList)
      }).then((response) => {
        this.fetchData()
        this.$message.success(response.message)
      }).catch(error => {
        if (error === 'cancel') {
          this.$message.info('取消删除')
        }
      })
    },
    // 转到分配菜单权限页
    showAssignMenuDialog(row) {
      this.$router.push('/system/assignMenuAuth?id=' + row.id + '&roleName=' + row.roleName)
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
