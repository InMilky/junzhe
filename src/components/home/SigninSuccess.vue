<template>
  <div class="my-main">
    <el-row type="flex" justify="center">
      <el-col :span="10">
        <!--  进度条  -->
        <el-steps :active="active" finish-status="success" align-center>
          <el-step title="验证手机号"></el-step>
          <el-step title="填写账号信息"></el-step>
          <el-step title="注册成功"></el-step>
        </el-steps>
        <div class="signin-success">
          <div class="my-card" id="signin_success" style="text-align: center;margin: 60px auto">
            <p class="success_msg">注册成功</p>
            <p class="success_msg">欢迎你加入橘栀商城</p>
            <button id="toIndex" @click="toLogin" class="my-index-btn">前往登录</button>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return { active: 3 }
  },
  methods: {
    toLogin () {
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
@import "../../assets/css/signin.css";
/deep/ .el-step__icon {
  width: 22px;
  height: 22px;
  font-size: 12px;
}
/deep/ .el-step__head.is-process {
  color: #333;
  border-color: #333;
}
/deep/ .el-step__title.is-process {
  font-weight: 510;
}
/deep/ .el-step__title {
  font-size: 12px;
  line-height: 36px;
}
/deep/ .el-step__icon-inner.is-status {
  transform: translateY(0);
}
</style>
