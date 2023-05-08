<template>
  <el-row class="login-container">
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" auto-complete="on" label-position="left">

      <div class="title-container">
        <h3 class="title">Login</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="请输入用户名"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="请输入密码"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPassword">
          <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
        </span>
      </el-form-item>

      <el-row>
        <el-col :span="16">
          <el-form-item prop="verifyCodeInput">
            <span class="svg-container">
              <svg-icon icon-class="example" />
            </span>
            <el-input v-model="loginForm.verifyCodeInput" placeholder="请输入验证码" />
          </el-form-item>
        </el-col>

        <el-col :span="8">
          <div class="verifyCodeImageBox">
            <div @click="refreshVerifyCode">
              <s-identify :verify-code="verifyCode" />
            </div>
          </div>
        </el-col>
      </el-row>

      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handleLogin">Login</el-button>

    </el-form>
  </el-row>
</template>

<script>
import { validateNotNull } from '@/utils/validate'
import SIdentify from '@/components/VerifyCode/index.vue'

export default {
  name: 'Login',
  components: {
    SIdentify
  },
  data() {
    // 用户名校验规则
    const usernameValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        // 用户名验证失败，重新生成验证码
        this.verifyCode = ''
        this.makeVerifyCode(this.verifyCodes, 4)
        history.pushState(null, null, document.URL)

        callback(new Error('请输入用户名'))
      } else {
        callback()
      }
    }
    // 密码校验规则
    const passwordValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        // 密码验证失败，重新生成验证码
        this.verifyCode = ''
        this.makeVerifyCode(this.verifyCodes, 4)
        history.pushState(null, null, document.URL)

        callback(new Error('请输入密码'))
      } else {
        callback()
      }
    }
    // 输入的验证码校验规则
    const verifyCodeInputValidator = (rule, value, callback) => {
      if (!validateNotNull(value)) {
        callback(new Error('请输入验证码'))
      } else if (value !== this.verifyCode) {
        callback(new Error('验证码错误'))
      } else {
        callback()
      }
    }
    return {
      /** ---------- 数据加载 ---------- **/
      loading: false, // 是否显示登录加载图标
      redirect: undefined,
      /** ---------- 显示密码 ---------- **/
      passwordType: 'password',
      /** ---------- 登录 ---------- **/
      loginForm: {
        username: 'root',
        password: '123456',
        // 输入的验证码
        verifyCodeInput: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: usernameValidator }],
        password: [{ required: true, trigger: 'blur', validator: passwordValidator }],
        verifyCodeInput: [{ required: true, trigger: 'blur', validator: verifyCodeInputValidator }]
      },
      /** ---------- 验证码 ---------- **/
      // 验证码字符集
      verifyCodes: '1234567890abcdefghijklmnopqrstuvwxyz',
      // 生成的验证码
      verifyCode: ''
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  mounted() {
    this.loginForm.verifyCode = ''
    this.makeVerifyCode(this.verifyCodes, 4)
    history.pushState(null, null, document.URL)
  },
  methods: {
    /** ---------- 显示密码 ---------- **/
    showPassword() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
      this.$nextTick(() => {
        this.$refs.password.focus()
      })
    },
    /** ---------- 登录 ---------- **/
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        // 对表单进行验证
        if (valid) {
          this.loading = true
          // 发送登录请求
          this.$store.dispatch('user/login', this.loginForm).then(() => {
            // 登录成功
            this.$router.push({ path: this.redirect || '/' })
            this.loading = false
          }).catch(() => {
            // 登录失败，重新生成验证码
            this.verifyCode = ''
            this.makeVerifyCode(this.verifyCodes, 4)
            history.pushState(null, null, document.URL)

            this.loading = false
          })
        } else {
          // 表单验证失败，重新生成验证码
          this.verifyCode = ''
          this.makeVerifyCode(this.verifyCodes, 4)
          history.pushState(null, null, document.URL)

          return false
        }
      })
    },
    /** ---------- 验证码 ---------- **/
    // 生成随机数
    randomNum(min, max) {
      return Math.floor(Math.random() * (max - min) + min)
    },
    // 切换验证码
    refreshVerifyCode() {
      this.verifyCode = ''
      this.makeVerifyCode(this.verifyCodes, 4)
    },
    // 生成验证码
    makeVerifyCode(o, l) {
      for (let i = 0; i < l; i++) {
        this.verifyCode += this.verifyCodes[
          this.randomNum(0, this.verifyCodes.length)]
      }
    }
  }
}
</script>

<style lang="scss">
$bg:#283443;
$light_gray:#fff;
$cursor: #fff;

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

.login-container {
  .el-input {
    display: inline-block;
    height: 47px;
    width: 85%;

    input {
      background: transparent;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 15px;
      color: $light_gray;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px $bg inset !important;
        -webkit-text-fill-color: $cursor !important;
      }
    }
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    color: #454545;
  }
}
</style>

<style lang="scss" scoped>
$bg:#2d3a4b;
$dark_gray:#889aa4;
$light_gray:#eee;

.login-container {
  min-height: 100%;
  width: 100%;
  background-color: $bg;
  overflow: hidden;

  .login-form {
    position: relative;
    width: 520px;
    max-width: 100%;
    padding: 160px 35px 0;
    margin: 0 auto;
    overflow: hidden;
  }

  .verifyCodeImageBox {
      float: left;
      padding-left: 10px;
      justify-content: space-between;
  }
  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .title-container {
    position: relative;

    .title {
      font-size: 26px;
      color: $light_gray;
      margin: 0px auto 40px auto;
      text-align: center;
      font-weight: bold;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }
}
</style>
