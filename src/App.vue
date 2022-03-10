<template>
  <div id="app">
    <TopNav :isLogin="isLogin" :username="username"  @logout="logout"
            v-if="!relogin"></TopNav>
    <router-view/>
    <FooterView v-if="!relogin"></FooterView>
  </div>
</template>
<script>

import TopNav from '@/components/home/topfooter/TopNav'
import FooterView from '@/components/home/topfooter/FooterView'
export default {
  name: 'App',
  data () {
    return {
      isLogin: true,
      username: '小橘子',
      relogin: false
    }
  },
  mounted () {
    const url = window.location.href
    const path = url.split('#')[1].split('/')[1]
    if (path === 'login' || path === 'signup') {
      this.relogin = true
    } else {
      this.relogin = false
    }
  },
  watch: { // 监测路由变化
    $route (to, from) {
      const url = to.path
      const path = url.split('/')[1]
      if (path === 'login' || path === 'signup') {
        this.relogin = true
      } else {
        this.relogin = false
      }
    }
  },
  methods: {
    logout () {
      this.username = ''
      this.isLogin = false
    }
  },
  components: {
    TopNav,
    FooterView
  }
}
</script>
<style>
body {
  display: block;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
#app{
  width: 100%;
  min-height: 100%;
  overflow: hidden;
  font-size: 16px;
  margin: 0;
  padding: 0;
}
</style>
