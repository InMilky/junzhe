import Vue from 'vue'
import './plugins/axios'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App'

// main.js中引入axios
// import axios from 'axios'
// 把axios挂载到vue的原型中，在vue中每个组件都可以使用axios发送请求
// Vue.prototype.$axios = axios
// axios.defaults.baseURL = '/server'

Vue.config.productionTip = false
// 设置默认尺寸
Vue.use(ElementUI, {
  size: 'medium'
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
