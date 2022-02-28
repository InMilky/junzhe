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
    redirect: '/index'
  },
  {
    path: '/index',
    name: 'index',
    component: IndexView
  },
  {
    path: '/login',
    name: 'login',
    meta: { title: '欢迎登录' },
    component: () => import('@/views/relogin/LoginView')
  },
  {
    path: '/signin',
    name: 'signin',
    alwaysShow: true,
    redirect: '/signin/person1',
    component: () => import('@/views/relogin/SigninView'),
    children: [
      {
        path: 'person1',
        name: 'getotp',
        meta: { title: '欢迎注册' },
        component: () => import('@/components/home/GetOtp')
      }, {
        path: 'person2',
        name: 'register',
        meta: { title: '欢迎注册' },
        component: () => import('@/components/home/RegisterMain')
      }, {
        path: 'person/signin_success',
        name: 'signin_success',
        meta: { title: '欢迎注册' },
        component: () => import('@/components/home/SigninSuccess')
      }
    ]
  },
  {
    path: '/cart',
    name: 'cart',
    meta: { title: '购物车' },
    component: () => import('@/views/home/cart/CartView')
  },
  {
    path: '/order',
    name: 'order',
    meta: { title: '个人订单' },
    component: () => import('@/views/home/order/OrderView')
  },
  {
    path: '/seckill',
    name: 'seckill',
    meta: { title: '商品秒杀' },
    component: () => import('@/views/home/seckill/IndexView')
  },
  {
    path: '/goodslist',
    name: 'goodslist',
    component: () => import('@/views/home/goods/GoodsView')
  },
  {
    path: '/admin',
    name: 'admin',
    alwaysShow: true,
    meta: { title: '首页' },
    component: () => import('@/views/admin/IndexView'),
    children: [
      {
        path: 'goods',
        name: 'goods',
        meta: { title: '商品管理' },
        redirect: '/admin/goods/lists',
        component: () => import('@/views/admin/goods/IndexView'),
        children: [
          {
            path: '/admin/goods/lists',
            name: 'goodslist',
            meta: { title: '全部商品', activeMenu: '/admin/goods' },
            component: () => import('@/views/admin/goods/ListView')
          }, {
            path: '/admin/goods/add',
            name: 'addgoods',
            meta: { title: '添加商品' },
            component: () => import('@/views/admin/goods/AddgoodsView')
          }, {
            path: '/admin/goods/edit',
            name: 'editgoods',
            meta: { title: '更新商品' },
            component: () => import('@/views/admin/goods/EditgoodsView')
          }, {
            path: '/admin/goods/category',
            name: 'goods_category',
            meta: { title: '类型管理' },
            component: () => import('@/views/admin/goods/CategoryView')
          }
        ]
      },
      {
        path: '/admin/seckill',
        name: 'seckill',
        meta: { title: '秒杀管理' },
        redirect: '/admin/seckill/event',
        component: () => import('@/views/admin/seckill/IndexView'),
        children: [
          {
            path: '/admin/seckill/event',
            name: 'seckill_event',
            meta: { title: '秒杀活动管理' },
            component: () => import('@/views/admin/seckill/EventView')
          }, {
            path: '/admin/seckill/goods',
            name: 'seckill_goods',
            meta: { title: '秒杀商品管理' },
            component: () => import('@/views/admin/seckill/GoodsView')
          }
        ]
      },
      {
        path: '/admin/order',
        name: 'order',
        meta: { title: '订单管理' },
        redirect: '/admin/order/list',
        component: () => import('@/views/admin/order/IndexView'),
        children: [
          {
            path: '/admin/order/list',
            name: 'order_list',
            meta: { title: '全部订单' },
            component: () => import('@/views/admin/order/ListView')
          }, {
            path: '/admin/order/deliver',
            name: 'order_deliver',
            meta: { title: '订单发货' },
            component: () => import('@/views/admin/order/DeliverView')
          }, {
            path: '/admin/order/aftersales',
            name: 'order_aftersales',
            // meta: { title: '订单售后' },
            component: () => import('@/views/admin/order/AftersalesView')
          }
        ]
      },
      {
        path: '/admin/user',
        name: 'user',
        meta: { title: '用户管理' },
        component: () => import('@/views/admin/user/IndexView')
      }
    ]
  }
  // {
  //   path: '*',
  //   redirect: '/error_request/404',
  //   component: () => import('@/error/ErrorPage404'),
  //   hidden: true
  // }
]

const router = new VueRouter({
  routes
})

// 每个页面的title改变
router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  } else {
    document.title = 'JZ.COM'
  }
  next()
})

export default router
