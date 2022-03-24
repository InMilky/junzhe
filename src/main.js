import Vue from 'vue'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import App from './App'

// main.js中引入axios
import axios from 'axios'
// 把axios挂载到vue的原型中，在vue中每个组件都可以使用axios发送请求
Vue.prototype.$axios = axios
axios.defaults.baseURL = '/server'
axios.interceptors.request.use(
  function (config) {
    NProgress.start() // 添加进度条
    if (localStorage.jwt_token) {
      config.headers.Authorization = localStorage.jwt_token
    }
    return config
  },
  function (error) {
    return Promise.reject(error)
  }
)
axios.interceptors.response.use(
  function (response) {
    NProgress.done()
    return response.data
  },
  function (error) {
    // if (error.response.status === 401) {
    //   localStorage.removeItem('jwt_token')
    // }
    NProgress.done()
    return Promise.reject(error.data.msg)
  }
)

Vue.config.productionTip = false
// 设置默认尺寸
Vue.use(ElementUI, {
  size: 'medium'
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
