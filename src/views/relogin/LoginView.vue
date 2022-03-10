<template>
  <div id="login">
    <!--  头部信息 title区分是登录页面还是注册页面  -->
      <LogisterHeader :title="title"></LogisterHeader>
    <!--  中间主内容  -->
      <div class="my-main">
        <el-row type="flex" justify="center">
          <el-col :span="10">
              <h1 style="text-align: center">登 录</h1>
              <el-form :model="validateForm" ref="validateForm" class="my-form" onsubmit="return false;">
                <div class="error-msg" v-if="hasError">{{errmsg}}</div>
                <el-form-item prop="phone" :rules="[
                  {required:true,message:'手机号不能为空'},
                ]">
                <el-input class="my-input" type="text"
                          v-model="validateForm.phone"
                          prefix-icon="el-icon-user-solid"
                          placeholder="请输入手机号"
                          autocomplete="off" clearable></el-input>
                </el-form-item>
                <el-form-item prop="password" :rules="[
                  {required:true,message:'密码不能为空'},
                ]">
                  <el-input class="my-input" type="password"
                            v-model="validateForm.password"
                            prefix-icon="el-icon-lock"
                            placeholder="请输入密码"
                            autocomplete="off" show-password></el-input>
                </el-form-item>
                <div class="additional">
                  <el-checkbox v-model="rememberpsw">记住密码</el-checkbox>
                  <el-link type="danger" style="float: right;" :underline="false">忘记密码?</el-link>
                </div>
                <el-form-item class="my-btn-div">
                  <el-button class="my-btn" @click="submitForm('validateForm')">登 录</el-button>
                </el-form-item>
                <div class="additional">
                    <el-link type="info" style="float: left; font-size: 12px" :underline="false">其他登录</el-link>
                    <router-link class="rbtn" type="info" to="/signup" style="float: right;" :underline="false">前往注册</router-link>
                </div>
              </el-form>
          </el-col>
        </el-row>
      </div>
    <!--  底部版权信息  -->
      <CopyRight></CopyRight>
  </div>
</template>

<script>
// 头脚页面引入
import LogisterHeader from '@/components/home/relogin/ReloginHeader'
import CopyRight from '@/components/home/topfooter/CopyRight'
export default {
  name: 'LoginView',
  data () {
    return {
      validateForm: {
        phone: '',
        password: ''
      },
      rememberpsw: false,
      title: '登录',
      hasError: false,
      errmsg: '该账号不存在，请前往注册'
    }
  },
  methods: {
    submitForm (formData) {
      this.hasError = false
      this.$refs[formData].validate((valid) => {
        if (valid) {
          // axios
          this.$router.push('/index')
        } else {
          this.$message.error('请完整填写登录信息')
          return false
        }
      })
    }
  },
  components: {
    LogisterHeader,
    CopyRight
  }
}
</script>
<style scoped>
  .my-main{
    width: 100%;
    margin: 30px;
  }
  .my-form{
    margin: 33px 50px;
    position: relative;
  }
  .my-input{
    font-size: 21px;
    height: 50px;
    line-height: 50px;
  }
  .additional{
    height: 30px;
    line-height: 30px;
    font-size: 14px;
    overflow: hidden;
  }
  /*错误提示*/
  .error-msg{
    width: 100%;
    font-size:14px;
    color: #e1251b;
    text-align: center;
    position: absolute;
    top: -10%;
    /*top: -25px*/
  }
  /deep/ .el-input__inner{
    height: 50px;
    font-size: 16px;
    padding-left: 50px;
  }
  /deep/ .el-input__inner:focus{
     border: 1px solid #666;
   }
  /deep/ .el-input__icon {
    width: 40px;
    line-height: 56px;
  }
  /deep/ .el-link--inner{
    font-size: 14px;
  }
  /deep/ .el-link--inner:hover{
    color: #e1251b;
  }
  .rbtn{
    font-size: 14px;
  }
  .rbtn:hover{
    color: #e1251b;
  }
  /deep/ .el-checkbox__input.is-checked+.el-checkbox__label {
    color: #e1251b;
  }
.my-btn-div{
  margin-bottom: 10px;
}
  .my-btn{
    height: 50px;
    font-size: 16px;
  }
  .my-btn {
    background: #e1251b;
    border: 1px solid #DCDFE6;
    color: #606266;
    width: 100%;
  }
</style>
