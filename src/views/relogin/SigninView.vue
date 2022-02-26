<template>
  <div id="signin" class="signin">
<!--  头部信息 title区分是登录页面还是注册页面  -->
    <LogisterHeader :title="title"></LogisterHeader>
<!--  中间主内容  -->
    <div class="my-main">
      <el-row type="flex" justify="center">
        <el-col :span="10">
        <!--  进度条  -->
          <el-steps :active="active" finish-status="success" align-center>
            <el-step title="验证手机号"></el-step>
            <el-step title="填写账号信息"></el-step>
            <el-step title="注册成功"></el-step>
          </el-steps>
          <!--  不同进度的 组件切换  -->
<!--          <component :is="viewName" :phone="telphone" @savePhone="savePhone" @nextView="nextView"></component>-->
          <router-view :phone="telphone" @savePhone="savePhone" @sendPhone="sendPhone" @nextView="nextView"></router-view>
        </el-col>
      </el-row>
    </div>
<!--  底部版权信息  -->
    <CopyRight></CopyRight>
  </div>
</template>

<script>
import LogisterHeader from '@/components/home/ReloginHeader'
import CopyRight from '@/components/home/CopyRight'

export default {
  name: 'RegisterView',
  data () {
    return {
      telphone: '',
      active: 0,
      // views: ['Getotp', 'Signin', '', 'SigninSuccess'],
      // viewName: 'Getotp',
      title: '注册'
    }
  },
  methods: {
    savePhone (value) {
      this.telphone = value
      this.$message.success(this.telphone)
    },
    sendPhone (value) {
      value = this.telphone
      // return value
    },
    //  进度条 和 当前组件 关联
    nextView (index) {
      this.active = index
    }
  },
  components: {
    LogisterHeader,
    CopyRight
  }
}
</script>

<style scoped>
.signin{
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.my-main{
  margin: 51px;
  flex: 1;
}

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
