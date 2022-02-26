<template>
  <el-aside>
    <el-menu default-active="2" class="el-menu-vertical-demo" router>
      <el-menu-item index="/admin">
        <i class="el-icon-s-home"></i>
        <span slot="title">首页</span>
      </el-menu-item>
      <el-submenu index="/admin/goods">
        <template slot="title">
          <i class="el-icon-s-goods"></i>商品管理
        </template>
        <el-menu-item index="/admin/goods/lists"><i class="el-icon-menu"></i>全部商品</el-menu-item>
        <el-menu-item index="/admin/goods/add"><i class="el-icon-present"></i>添加商品</el-menu-item>
        <el-menu-item index="/admin/goods/edit"><i class="el-icon-edit"></i>更新商品</el-menu-item>
        <el-menu-item index="/admin/goods/category"><i class="el-icon-present"></i>类型管理</el-menu-item>
      </el-submenu>
      <el-submenu index="/admin/seckill">
        <template slot="title">
<!--  el-icon-s-marketing   el-icon-present   el-icon-coin   el-icon-s-shop -->
          <i class="el-icon-sell"></i>秒杀管理
        </template>
        <el-menu-item index="/admin/seckill/event"><i class="el-icon-present"></i>秒杀活动管理</el-menu-item>
        <el-menu-item index="/admin/seckill/goods"><i class="el-icon-takeaway-box"></i>秒杀商品管理</el-menu-item>
      </el-submenu>
      <el-submenu index="/admin/order">
        <template slot="title">
          <i class="el-icon-s-order"></i>订单管理
        </template>
        <el-menu-item index="/admin/order/list"><i class="el-icon-s-data"></i>全部订单</el-menu-item>
        <el-menu-item index="/admin/order/deliver"><i class="el-icon-folder-checked"></i>订单发货</el-menu-item>
        <el-menu-item index="/admin/order/aftersales"><i class="el-icon-postcard"></i>订单售后</el-menu-item>
      </el-submenu>
      <el-menu-item index="/admin/user">
        <i class="el-icon-s-tools"></i>
        <span slot="title">用户管理</span>
      </el-menu-item>
    </el-menu>
  </el-aside>
</template>

<script>
export default {
  name: 'navMenu'
}
</script>

<style scoped>
/deep/ .el-menu {
  border-right: solid 1px #e6e6e6;
  background-color: transparent;
  color: #d4d4d4;
}
</style>
