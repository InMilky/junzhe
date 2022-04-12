import Vue from 'vue'
import VueRouter from 'vue-router'
import IndexView from '@/views/home/IndexView.vue'

Vue.use(VueRouter)

// 解决编程式路由往同一地址跳转时会报错的情况
const originalPush = VueRouter.prototype.push
const originalReplace = VueRouter.prototype.replace
// push
VueRouter.prototype.push = function push (location, onResolve, onReject) {
  if (onResolve || onReject) { return originalPush.call(this, location, onResolve, onReject) }
  return originalPush.call(this, location).catch(err => err)
}
// replace
VueRouter.prototype.replace = function push (location, onResolve, onReject) {
  if (onResolve || onReject) { return originalReplace.call(this, location, onResolve, onReject) }
  return originalReplace.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    redirect: {
      name: 'index'
    }
  },
  {
    path: '/error_request_404',
    name: 'error_request_404',
    meta: { title: 'Not Found', keepAlive: true },
    component: () => import('@/views/home/error/ErrorPage404')
  },
  {
    path: '/index',
    name: 'index',
    meta: { title: 'JZ.COM', keepAlive: true },
    component: IndexView
  },
  {
    path: '/login',
    name: 'login',
    meta: { title: '欢迎登录' },
    component: () => import('@/views/home/signin/LoginView')
  },
  {
    path: '/signup',
    name: 'signup',
    alwaysShow: true,
    redirect: {
      name: 'getotp'
    },
    component: () => import('@/views/home/signup/RegisterView'),
    children: [
      {
        path: 'person1',
        name: 'getotp',
        meta: { title: '欢迎注册' },
        component: () => import('@/components/home/relogin/GetOtp')
      }, {
        path: 'person2',
        name: 'register',
        meta: { title: '欢迎注册' },
        component: () => import('@/components/home/relogin/RegisterMain')
      }, {
        path: 'person/signup_success',
        name: 'signup_success',
        meta: { title: '欢迎注册' },
        hidden: true,
        component: () => import('@/components/home/relogin/RegisterSuccess')
      }
    ]
  },
  {
    path: '/cart',
    name: 'cart',
    meta: { title: '购物车', requireAuth: true },
    component: () => import('@/views/home/cart/CartView')
  },
  {
    path: '/payorder',
    name: 'payorder',
    meta: { title: '支付页面', requireAuth: true },
    component: () => import('@/views/home/cart/PayView')
  },
  {
    path: '/payorder',
    name: 'checkout',
    meta: { title: '支付页面', requireAuth: true },
    component: () => import('@/views/home/goods/CheckoutView')
  },
  {
    path: '/payorder/cashier',
    name: 'cashier',
    meta: { title: '结算页面', requireAuth: true },
    component: () => import('@/views/home/cart/PaySuccess')
  },
  {
    path: '/order',
    name: 'order',
    meta: { title: '个人订单', requireAuth: true },
    component: () => import('@/views/home/order/OrderView')
  },
  {
    path: '/seckill',
    name: 'seckill',
    meta: { title: '商品秒杀', keepAlive: true },
    component: () => import('@/views/home/seckill/IndexView')
  },
  {
    path: '/seckill/item/:ID',
    name: 'seckill_item',
    component: () => import('@/views/home/seckill/ItemView')
  },
  {
    path: '/item/item_list',
    name: 'list_item',
    meta: { title: '商品列表', keepAlive: true },
    component: () => import('@/views/home/goods/IndexView')
  },
  {
    path: '/item/:ID',
    name: 'goods_item',
    meta: { title: '商品列表', keepAlive: true },
    component: () => import('@/views/home/goods/ItemView')
  },
  {
    path: '/item_default/:ID',
    name: 'default_item',
    meta: { title: '商品页面', keepAlive: true },
    component: () => import('@/views/home/goods/DefaultItem')
  },
  {
    path: '*', // 非以上路由访问进入404页面
    redirect: '/error_request_404',
    name: 'Not Found',
    hidden: true
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

// 钩子函数
router.beforeEach((to, from, next) => {
  // 设置每个页面的title改变
  if (to.meta.title) {
    document.title = to.meta.title
  } else {
    document.title = 'JZ.COM'
  }
  // 需要进行登录路由拦截
  if (to.meta.requireAuth) {
    if (localStorage.getItem('jwt_token')) {
      next()
    } else {
      next({
        path: '/login',
        query: {
          redirectURL: to.fullPath
        }
      })
    }
  }
  next()
})
// 跳转后返回页面顶部
router.afterEach(() => {
  window.scrollTo(0, 0)
})
export default router
