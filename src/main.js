import Vue from 'vue'
import './plugins/axios'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App'

Vue.config.productionTip = false
Vue.use(ElementUI, {
  size: 'medium'
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
