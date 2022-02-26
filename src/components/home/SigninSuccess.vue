<template>
  <div class="signin-success">
    <div class="my-card" id="signin_success" style="text-align: center;margin: 60px auto">
    <p class="success_msg">注册成功</p>
    <p class="success_msg">欢迎你加入橘栀商城</p>
    <button id="toIndex" @click="toLogin" class="my-index-btn">前往登录</button>
  </div>
  </div>
</template>

<script>
export default {
  data () {
    return {}
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
</style>
