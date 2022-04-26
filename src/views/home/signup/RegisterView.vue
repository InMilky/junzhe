<template>
  <div id="signin" class="signin">
<!--  头部信息 title区分是登录页面还是注册页面  -->
    <LogisterHeader :title="title"></LogisterHeader>
<!--  中间主内容  --> <!--  不同进度的 组件切换  -->
<!--          <component :is="viewName" :phone="telphone" @savePhone="savePhone" @nextView="nextView"></component>-->
    <router-view :phone="telphone" @savePhone="savePhone" @sendPhone="sendPhone"></router-view>
<!--  底部版权信息  -->
    <CopyRight></CopyRight>
  </div>
</template>

<script>
import LogisterHeader from '@/components/home/relogin/ReloginHeader'
import CopyRight from '@/components/home/topfooter/CopyRight'

export default {
  name: 'RegisterView',
  data () {
    return {
      telphone: '',
      title: '注册'
    }
  },
  methods: {
    savePhone (value) {
      this.telphone = value
    },
    sendPhone (value) {
      value = this.telphone
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
}
</style>
