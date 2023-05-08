<template>
  <div class="dashboard-container">
    <el-row>
      <el-col :span="24">
        <div class="dashboard-title">RBAC 通用权限管理系统</div>
      </el-col>
    </el-row>

    <!-- 用户信息 -->
    <el-card>
      <el-descriptions class="margin-top" title="用户信息" :column="2" border>
        <template slot="extra">
          <el-button type="primary" size="small" @click="showUpdateInfoDialog(userId)">修改信息</el-button>
        </template>
        <template slot="extra">
          <el-button type="danger" size="small" @click="showUpdatePasswordDialog(userId)">修改密码</el-button>
        </template>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user" />
            用户名
          </template>
          {{ userInfo.username }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-location-outline" />
            姓名
          </template>
          {{ userInfo.name }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-mobile-phone" />
            手机号
          </template>
          {{ userInfo.phone }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-tickets" />
            角色
          </template>
          <div v-if="userInfo.roleNames.length == 1">
            <el-tag size="small">{{ userInfo.roleNames[0] }}</el-tag>
          </div>
          <div v-else-if="userInfo.roleNames.length != 0">
            <el-tag v-for="(item,index) in userInfo.roleNames" :key="index" size="small" style="margin: 0 5px 0 5px">
              {{ item }}
            </el-tag>
          </div>
          <div v-else>
            <el-tag size="small">无</el-tag>
          </div>
        </el-descriptions-item>
      </el-descriptions>
    </el-card>

    <!-- 修改用户信息模态框 -->
    <el-dialog title="修改信息" :visible.sync="updateInfoDialogVisible" width="40%">
      <el-form ref="updateInfoForm" :rules="updateInfoFormRule" :model="updateInfoForm" label-width="100px" size="small" style="padding-right: 40px;">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="updateInfoForm.username" :disabled="true" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="updateInfoForm.name" :disabled="updateInfoForm.id == 1 || updateInfoForm.id == 2" />
        </el-form-item>
        <el-form-item label="手机" prop="phone">
          <el-input v-model="updateInfoForm.phone" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" icon="el-icon-refresh-right" @click="updateInfoDialogVisible = false">取
          消</el-button>
        <el-button type="primary" size="small" icon="el-icon-check" @click="updateUser()">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 修改用户密码模态框 -->
    <el-dialog title="修改密码" :visible.sync="updatePasswordDialogVisible" width="40%">
      <el-form ref="updatePasswordForm" :rules="updatePasswordFormRule" :model="updatePasswordForm" label-width="100px" size="small" style="padding-right: 40px;">
        <el-form-item label="原密码" prop="oldPassword">
          <el-input v-model="updatePasswordForm.oldPassword" />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="updatePasswordForm.newPassword" />
        </el-form-item>
        <el-form-item label="确认密码" prop="newPasswordAgain">
          <el-input v-model="updatePasswordForm.newPasswordAgain" />
        </el-form-item>
      </el-form>
      <div class="tips">
        tips: 密码中必须包含字母、数字，长度至少为 8 位，最多 16 位
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" icon="el-icon-refresh-right" @click="updatePasswordDialogVisible = false">取
          消</el-button>
        <el-button type="primary" size="small" icon="el-icon-check" @click="updateUserPasswordById(userId)">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import sysUserApi from '@/api/system/SysUser.js'
import { validateNotNull, validatePhone, validatePassword } from '@/utils/validate'

export default {
  name: 'Dashboard',
  data() {
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
    // 原密码校验规则
    const oldPasswordValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入原密码'))
      } else {
        callback()
      }
    }
    // 新密码校验规则
    const newPasswordValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入新密码'))
      } else if (!validatePassword(value)) {
        callback(new Error('您的密码复杂度太低'))
      } else {
        callback()
      }
    }
    // 再次输入的新密码校验规则
    const newPasswordAgainValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入新密码'))
      } else if (value !== this.updatePasswordForm.newPassword) {
        callback(new Error('两次密码不一致'))
      } else {
        callback()
      }
    }
    return {
      /** ---------- 数据加载 ---------- **/
      loading: true, // 是否显示加载图标
      userId: '', // 当前用户id
      userInfo: { // 用户信息
        username: '', // 用户名
        name: '', // 姓名
        phone: '', // 电话
        roleNames: [] // 角色
      },
      /** ---------- 修改用户信息 ---------- **/
      updateInfoDialogVisible: false, // 修改用户信息模态框是否显示
      updateInfoForm: { // 修改用户信息表单
        id: '',
        username: '',
        name: '',
        phone: ''
      },
      updateInfoFormRule: { // 修改用户信息表单校验规则
        name: [{ required: true, trigger: ['blur', 'change'], validator: nameValidator }],
        phone: [{ required: true, trigger: ['blur', 'change'], validator: phoneValidator }]
      },
      /** ---------- 修改用户密码 ---------- **/
      updatePasswordDialogVisible: false, // 修改用户密码模态框是否显示
      updatePasswordForm: { // 修改用户密码表单初始值
        id: '',
        oldPassword: '', // 原密码
        newPassword: '', // 新密码
        newPasswordAgain: '' // 再次输入新密码
      },
      updatePasswordFormRule: { // 修改用户密码表单校验规则
        oldPassword: [{ required: true, trigger: ['blur', 'change'], validator: oldPasswordValidator }],
        newPassword: [{ required: true, trigger: ['blur', 'change'], validator: newPasswordValidator }],
        newPasswordAgain: [{ required: true, trigger: ['blur', 'change'], validator: newPasswordAgainValidator }]
      }
    }
  },
  // 生命周期函数，内存准备完毕，页面尚未渲染
  created() {
    // 当前用户id
    const userId = this.$store.state.user.userId
    // 根据id获取当前用户信息
    this.fetchData(userId)
  },
  methods: {
    /** ---------- 数据加载 ---------- **/
    // 发送ajax请求，获取用户信息
    fetchData(userId) {
      this.loading = true
      this.userId = userId
      sysUserApi.getUserInfoByUserId(userId).then(response => {
        this.userInfo.username = response.data.username
        this.userInfo.name = response.data.name
        this.userInfo.phone = response.data.phone
        this.userInfo.roleNames = response.data.roleNames
      })
      this.loading = false
    },
    /** ---------- 修改用户信息 ---------- **/
    // 弹出修改用户信息模态框并数据回显
    showUpdateInfoDialog(userId) {
      this.updateInfoDialogVisible = true
      sysUserApi.getUserById(userId).then(response => {
        this.updateInfoForm = response.data
      })
    },
    // 修改用户信息
    updateUser() {
      this.$refs.updateInfoForm.validate(valid => {
        // 对表单进行验证
        if (valid) {
          sysUserApi.updateUser(this.updateInfoForm).then(response => {
            this.$message.success(response.message || '操作成功')
            this.updateInfoDialogVisible = false
            this.fetchData(this.userId)
          })
        } else {
          return false
        }
      })
    },
    /** ---------- 修改用户密码 ---------- **/
    // 弹出修改用户密码模态框
    showUpdatePasswordDialog(userId) {
      this.updatePasswordDialogVisible = true
      this.updatePasswordForm.id = userId
    },
    // 修改用户密码
    updateUserPasswordById(userId) {
      this.$refs.updatePasswordForm.validate(valid => {
        // 对表单进行验证
        if (valid) {
          const passwordList = [userId, this.updatePasswordForm.oldPassword, this.updatePasswordForm.newPassword]
          sysUserApi.updatePassword(passwordList).then(response => {
            this.$message.success(response.message || '操作成功')
            this.updatePasswordDialogVisible = false
            this.fetchData(this.userId)
          })
        } else {
          return false
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped>
.tips {
  font-size: 14px;
  color: #000000;
  text-align: center;
  margin-top: 40px;
}
.dashboard {
  &-container {
    margin: 30px;
  }

  &-title {
    font-size: 30px;
    line-height: 46px;
    text-align: center;
    margin-bottom: 40px;
  }
}
</style>
