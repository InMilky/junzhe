import Vue from 'vue'
import router from './router'
import App from './App'
import axios from './plugins/axios'

// 把axios挂载到vue的原型中，在vue中每个组件都可以使用axios发送请求
Vue.prototype.$axios = axios
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
