<template>
  <div class="app-container">

    <!-- 工具条 -->
    <div class="tools-div">
      <el-button
        type="success"
        icon="el-icon-plus"
        size="mini"
        :disabled="$hasBP('bnt.sysMenu.add') === false"
        @click="showSaveDialog()"
      >添 加</el-button>
    </div>

    <!-- 表格 -->
    <el-table
      :data="sysMenuList"
      class="table"
      row-key="id"
      border
      :default-expand-all="false"
      :tree-props="{ children: 'children' }"
    >
      <el-table-column prop="name" label="菜单名称" width="160" align="center" />
      <el-table-column label="图标" align="center">
        <template slot-scope="scope">
          <i :class="scope.row.icon" />
        </template>
      </el-table-column>
      <el-table-column prop="perms" label="权限标识" width="160" align="center" />
      <el-table-column prop="path" label="路由地址" width="120" align="center" />
      <el-table-column prop="component" label="组件路径" width="160" align="center" />
      <el-table-column prop="sortValue" label="排序" width="60" align="center" />
      <el-table-column label="状态" width="80" align="center">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.status === 1"
            :disabled="$hasBP('bnt.sysMenu.update') === false"
            @change="switchStatus(scope.row)"
          />
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间" width="160" align="center" />
      <el-table-column label="操作" width="180" align="center" fixed="right">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.type !== 2"
            type="success"
            icon="el-icon-plus"
            size="mini"
            title="添加下级节点"
            :disabled="$hasBP('bnt.sysMenu.add') === false"
            @click="showSaveDialog(scope.row)"
          />
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            title="修改"
            :disabled="$hasBP('bnt.sysMenu.update') === false"
            @click="showUpdateDialog(scope.row)"
          />
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            title="删除"
            :disabled="($hasBP('bnt.sysMenu.delete') === false || scope.row.children.length > 0)"
            @click="deleteMenuById(scope.row.id)"
          />
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加/修改模态框 -->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="40%">
      <el-form ref="dataForm" :model="menuForm" label-width="150px" size="small" style="padding-right: 40px;">
        <el-form-item v-if="menuForm.id === ''" label="上级部门">
          <el-input v-model="menuForm.parentName" :disabled="true" />
        </el-form-item>
        <el-form-item label="菜单类型" prop="type">
          <el-radio-group v-model="menuForm.type" :disabled="typeDisabled">
            <el-radio :label="0" :disabled="type0Disabled">目录</el-radio>
            <el-radio :label="1" :disabled="type1Disabled">菜单</el-radio>
            <el-radio :label="2" :disabled="type2Disabled">按钮</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="菜单名称" prop="name">
          <el-input v-model="menuForm.name" placeholder="请输入菜单名称" />
        </el-form-item>
        <el-form-item v-if="menuForm.type !== 2" label="图标" prop="icon">
          <el-select v-model="menuForm.icon" clearable>
            <el-option v-for="item in iconList" :key="item.class" :label="item.class" :value="item.class">
              <span style="float: left;">
                <i :class="item.class" />
              </span>
              <span style="padding-left: 6px;">{{ item.class }}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="menuForm.sortValue" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="路由地址" prop="path">
          <span slot="label">
            路由地址
            <el-tooltip content="访问的路由地址，无需带 / 前缀，如：`sysUser`" placement="top">
              <i class="el-icon-question" />
            </el-tooltip>
          </span>
          <el-input v-model="menuForm.path" placeholder="请输入路由地址" />
        </el-form-item>
        <el-form-item v-if="menuForm.type !== 0" label="组件路径" prop="component">
          <span slot="label">
            组件路径
            <el-tooltip content="访问的组件路径，如：`system/user/index`，默认在`views`目录下" placement="top">
              <i class="el-icon-question" />
            </el-tooltip>
          </span>
          <el-input v-model="menuForm.component" placeholder="请输入组件路径" />
        </el-form-item>
        <el-form-item v-if="menuForm.type === 2" label="权限字符">
          <el-input v-model="menuForm.perms" placeholder="请输入权限标识" maxlength="100" />
          <span slot="label">
            权限字符
            <el-tooltip content="控制器中定义的权限字符，如：@PreAuthorize(hasAuthority('bnt.sysRole.list'))" placement="top">
              <i class="el-icon-question" />
            </el-tooltip>
          </span>
        </el-form-item>
        <el-form-item label="状态" prop="type">
          <el-radio-group v-model="menuForm.status">
            <el-radio :label="1">正常</el-radio>
            <el-radio :label="0">停用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button
          size="small"
          type="primary"
          icon="el-icon-check"
          @click="saveOrUpdateMenu()"
        >确 定</el-button>
        <el-button
          size="small"
          icon="el-icon-refresh-right"
          @click="dialogVisible = false"
        >取 消</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import sysMenuApi from '@/api/system/SysMenu.js'
import icons from '@/icons/el-icons.js'

const menuDefaultForm = { // 添加菜单结点表单初始值
  id: '',
  parentId: '',
  name: '',
  type: 0,
  path: '',
  component: '',
  perms: '',
  icon: '',
  sortValue: 1,
  status: 1
}

export default {
  // 定义数据
  data() {
    return {
      sysMenuList: [], // 菜单列表
      dialogTitle: '', // 弹出层模态框标题
      typeDisabled: true, // 菜单项类型是否可更改
      type0Disabled: false, // 菜单项类型是否可为目录
      type1Disabled: false, // 菜单项类型是否可为菜单
      type2Disabled: false, // 菜单项类型是否可为按钮
      dialogVisible: false, // 弹出层模态框是否显示
      menuForm: menuDefaultForm, // 添加菜单结点表单
      iconList: icons // 图标列表
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
    // 设置添加模态框默认图标
    this.menuForm.icon = this.iconList[0].class
  },
  methods: {
    // 发送ajax请求，获取菜单列表
    fetchData() {
      sysMenuApi.findNodes().then(response => {
        this.sysMenuList = response.data
      })
    },
    // 弹出添加表单模态框
    showSaveDialog(row) {
      this.dialogTitle = '添加下级节点'
      this.typeDisabled = false
      this.dialogVisible = true
      this.menuForm = Object.assign({}, menuDefaultForm)
      this.menuForm.id = ''

      if (row) {
        this.menuForm.parentId = row.id
        this.menuForm.parentName = row.name
        if (row.type === 0) {
          this.menuForm.type = 1
          this.typeDisabled = false
          this.type0Disabled = false
          this.type1Disabled = false
          this.type2Disabled = true
        } else if (row.type === 1) {
          this.menuForm.type = 2
          this.typeDisabled = true
        }
      } else {
        this.dialogTitle = '添加目录节点'
        this.menuForm.type = 0
        this.menuForm.component = 'Layout'
        this.menuForm.parentId = 0
        this.typeDisabled = true
      }
    },
    // 弹出修改菜单结点模态框并数据回显
    showUpdateDialog(row) {
      this.dialogTitle = '修改菜单'
      this.dialogVisible = true
      this.menuForm = Object.assign({}, row)
      this.typeDisabled = true
    },
    // 添加或更新菜单结点
    saveOrUpdateMenu() {
      if (this.menuForm.type === 0 && this.menuForm.parentId !== 0) {
        this.menuForm.component = 'ParentView'
      }

      if (!this.menuForm.id) {
        this.saveMenu()
      } else {
        this.updateMenu()
      }
    },
    // 添加菜单结点
    saveMenu() {
      sysMenuApi.saveMenu(this.menuForm).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 更新菜单结点
    updateMenu() {
      sysMenuApi.updateMenu(this.menuForm).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData()
      })
    },
    // 更新菜单结点状态
    switchStatus(row) {
      row.status = row.status === 1 ? 0 : 1
      sysMenuApi.updateStatus(row.id, row.status).then(response => {
        if (response.code) {
          this.$message.success(response.message || '操作成功')
          this.fetchData()
        }
      })
    },
    // 删除菜单结点
    deleteMenuById(id) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return sysMenuApi.deleteMenuById(id)
      }).then((response) => {
        this.fetchData()
        this.$message({
          type: 'success',
          message: response.message
        })
      }).catch(() => {
        this.$message.info('取消删除')
      })
    }
  }
}
</script>

<style scoped>
.tools-div {
  margin-top: 10px;
  padding: 10px;
  border: 1px solid #EBEEF5;
  border-radius: 3px;
}
.table{
  width: 100%;
  margin-bottom: 20px;
  margin-top: 10px;
}
</style>
