import Vue from 'vue'
import VueRouter from 'vue-router'
import IndexView from '../views/home/IndexView.vue'

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
    component: () => import('../views/relogin/LoginView')
  },
  {
    path: '/signin',
    name: 'signin',
    alwaysShow: true,
    redirect: '/signin/person1',
    component: () => import('../views/relogin/SigninView'),
    children: [
      {
        path: 'person1',
        name: 'getotp',
        component: () => import('../components/home/GetOtp')
      }, {
        path: 'person2',
        name: 'register',
        component: () => import('../components/home/RegisterMain')
      }, {
        path: 'person/signin_success',
        name: 'signin_success',
        component: () => import('../components/home/SigninSuccess')
      }
    ]
  },
  {
    path: '/cart',
    name: 'cart',
    component: () => import('../views/home/cart/CartView')
  },
  {
    path: '/order',
    name: 'order',
    component: () => import('../views/home/order/OrderView')
  },
  {
    path: '/seckill',
    name: 'seckill',
    component: () => import('../views/home/seckill/IndexView')
  },
  {
    path: '/goodslist',
    name: 'goodslist',
    component: () => import('../views/home/goods/GoodsView')
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/admin',
    name: 'admin',
    alwaysShow: true,
    meta: { title: '首页', role: ['admin'] },
    component: () => import('../views/admin/IndexView'),
    children: [
      {
        path: 'goods',
        name: 'goods',
        meta: { title: '商品管理' },
        component: () => import('../views/admin/goods/IndexView'),
        children: [
          {
            path: '/admin/goods/lists',
            name: 'goodslist',
            meta: { title: '全部商品', icon: 'el-icon-present ', activeMenu: '/admin/goods' },
            component: () => import('../views/admin/goods/ListView')
          }, {
            path: '/admin/goods/add',
            name: 'addgoods',
            meta: { title: '添加商品' },
            component: () => import('../views/admin/goods/AddgoodsView')
          }, {
            path: '/admin/goods/edit',
            name: 'editgoods',
            meta: { title: '更新商品' },
            component: () => import('../views/admin/goods/EditgoodsView')
          }, {
            path: '/admin/goods/category',
            name: 'goods_category',
            meta: { title: '类型管理' },
            component: () => import('../views/admin/goods/CategoryView')
          }
        ]
      },
      {
        path: '/admin/seckill',
        name: 'seckill',
        meta: { title: '秒杀管理' },
        component: () => import('../views/admin/seckill/IndexView'),
        children: [
          {
            path: '/admin/seckill/event',
            name: 'seckill_event',
            meta: { title: '秒杀活动管理' },
            component: () => import('../views/admin/seckill/EventView')
          }, {
            path: '/admin/seckill/goods',
            name: 'seckill_goods',
            meta: { title: '秒杀商品管理' },
            component: () => import('../views/admin/seckill/GoodsView')
          }
        ]
      },
      {
        path: '/admin/order',
        name: 'order',
        meta: { title: '订单管理' },
        component: () => import('../views/admin/order/IndexView'),
        children: [
          {
            path: '/admin/order/list',
            name: 'order_list',
            meta: { title: '全部订单' },
            component: () => import('../views/admin/order/ListView')
          }, {
            path: '/admin/order/deliver',
            name: 'order_deliver',
            meta: { title: '订单发货' },
            component: () => import('../views/admin/order/DeliverView')
          }, {
            path: '/admin/order/aftersales',
            name: 'order_aftersales',
            meta: { title: '订单售后' },
            component: () => import('../views/admin/order/AftersalesView')
          }
        ]
      },
      {
        path: '/admin/user',
        name: 'user',
        meta: { title: '用户管理' },
        component: () => import('../views/admin/user/IndexView')
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

export default router
