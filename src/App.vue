<template>
  <div id="app">
    <TopNav :isLogin="isLogin" :username="username"  @logout="logout"
            v-if="!relogin"></TopNav>
<!--  缓存激活的组件状态  -->
    <transition>
      <keep-alive>
        <router-view />
      </keep-alive>
    </transition>
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
      isLogin: false,
      username: '',
      relogin: false
    }
  },
  mounted () {
    this.getUserInfo()
    const url = window.location.href
    const path = url.split('www.jz.com')[1] || url.split('localhost')[1]
    if (path.startsWith('/login') || path.startsWith('/signup') || path.startsWith('/admin')) {
      this.relogin = true
    } else {
      this.relogin = false
    }
  },
  watch: { // 监测路由变化
    $route (to, from) {
      const url = to.path
      const path = url.split('/')[1]
      this.getUserInfo()
      if (path === 'login' || path === 'signup' || path.startsWith('/admin')) {
        this.relogin = true
      } else {
        this.relogin = false
      }
    }
  },
  methods: {
    updateUser (val) {
      val = this.username
    },
    getUserInfo () {
      if (localStorage.jwt_token) {
        this.$axios.get('/user/getuser').then(res => {
          if (res.status === 200) {
            this.username = res.username
            this.isLogin = true
          } else {
            localStorage.removeItem('jwt_token')
            this.username = ''
            this.isLogin = false
          }
        })
      } else {
        this.username = ''
        this.isLogin = false
      }
    },
    logout (path) {
      localStorage.removeItem('jwt_token')
      this.username = ''
      this.isLogin = false
      this.$alert('你已退出登陆或者登录已失效，请前往登录！', '提示', {
        confirmButtonText: '确定',
        confirmButtonClass: 'confirmbtn',
        callback: action => {
          this.$router.push({
            path: '/login',
            query: {
              redirectURL: this.$route.path
            }
          })
        }
      })
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
.cancelbtn{
  width: 78px;
  color: #e1251b!important;
  border: 1px solid #e1251b!important;
}
.cancelbtn:hover{
  background: #e1251b!important;
  color: #FFF!important;
}
.confirmbtn{
  width: 80px;
  background: #e1251b!important;
  border: 1px solid #e1251b!important;
}
</style>
