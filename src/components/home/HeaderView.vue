<template>
  <div class="top-header">
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <el-breadcrumb separator="|" class="my-breadcrumb">
          <el-breadcrumb-item v-if="!isLogin">
            <router-link to="/login" class="a-link">登录</router-link>&nbsp;
            <router-link to="/signin" class="a-link">注册</router-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item v-else>
          <span class="a-link">欢迎{{ username }}</span>&nbsp;
          <router-link to="/signout" class="r-link">退出登录</router-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <router-link to="/order" class="r-link">我的订单</router-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <el-link href="javascript:void(0)" :underline="false" class="r-link">个人中心</el-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <el-link href="javascript:void(0)" :underline="false" class="r-link">关注网站</el-link>
          </el-breadcrumb-item>
        </el-breadcrumb>
      </el-col>
    </el-row>
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row type="flex">
          <el-col :span="3">
            <div class="logo">
            <img src="../../assets/logo.png">
          </div></el-col>
          <el-col :span="16" :push="1">
            <div class="nav">
              <el-row class="search-div">
                <el-col :span="18">
                  <el-input type="text" placeholder="搜索"
                            v-model="search">
                    <el-button slot="append" icon="el-icon-search"></el-button>
                  </el-input>
                </el-col>
                <el-col :span="4" :push="1">
                  <el-button class="mycart">
                  <i class="el-icon-shopping-cart-2" style="font-size: 18px"></i>&nbsp;
                    <div style="display: inline-block; font-size: 12px; position:relative; top:-2px">我的购物车</div>
                </el-button></el-col>
              </el-row>
              <el-row class="nav-menu">
                <el-menu mode="horizontal" style="color: #333333">
                  <el-menu-item index="/miaosha" class="menu-active">秒杀</el-menu-item>
                  <el-menu-item v-for="(item,index) in navmenu" :key="index" index="/">{{item.title}}</el-menu-item>
                </el-menu>
              </el-row>
            </div>
          </el-col>
          <el-col :span="3" :push="1"><div class="QR-code">
            <img src="../../assets/img/index/erweima.png">
          </div></el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'HeaderView',
  data () {
    return {
      isLogin: true,
      username: 'Milky',
      search: '',
      navmenu: [{ title: '优惠券', url: '/' },
        { title: '品牌闪购', url: '/' },
        { title: '美妆护肤', url: '/' },
        { title: '服装饰品', url: '/' },
        { title: '家居家具', url: '/' },
        { title: '图书文具', url: '/' }]
    }
  }
}
</script>

<style scoped>
.top-header{
  width: 100%;
  height: 150px;
  color: #a9a9a9;
  font-size: 14px;
  margin: 0;
  padding: 0;
}
.top-nav{
  width: 100%;
  height: 30px;
  overflow: hidden;
  display: flex;
  align-items: center;
  background-color: #dddddd;
}
.my-breadcrumb{
  float: right;
}
.a-link,.r-link{
  font-weight: normal;
  color: #606266;
  font-size: 12px;
}
.a-link{
  color: #e1251b;
}
.r-link:hover{
  color: #e1251b;
}
/deep/ .el-link.el-link--default:hover {
  color: #e1251b;
}
/deep/ .el-breadcrumb__item:last-child .el-breadcrumb__inner,
.el-breadcrumb__item:last-child .el-breadcrumb__inner a{
  cursor: pointer;
}
.el-breadcrumb__item:last-child .el-breadcrumb__inner a:hover,
.el-breadcrumb__item:last-child .el-breadcrumb__inner:hover{
  cursor: pointer;
  color: #e1251b;
}

.headerarea{
  width: 100%;
  height: 120px;
  background: white;
  color: #333333;
  box-shadow: 0 1px 2px #dddddd;
}
.logo,.QR-code{
  height: 100%;
  display: flex;
}
.nav{
  height: 100%;
}
.logo>img{
  max-width: 100%;
  display: block;
  height: auto;
  margin: auto;
}
.QR-code{
  width: 76px;
  height: 76px;
  box-shadow: 0 0 10px #ddd;
  display: flex;
  float: right;
}
.QR-code img{
  width: 70px;
  height: 70px;
  margin: auto;
  display: block;
}
/deep/ .el-col{
  margin: auto 0;
}
/deep/ .el-input--medium .el-input__inner {
  height: 40px;
  line-height: 40px;
}
/deep/ .el-input__inner {
  border-radius: 0;
  border: 2px solid #e1251b;
  height: 40px;
  line-height: 40px;
}
/deep/ .el-input__inner:hover,
/deep/ .el-input__inner:focus {
  border: 2px solid #e1251b;
}
/deep/ .el-input__suffix {
  right: 10px;
}
/deep/ .el-input__prefix, .el-input__suffix {
   color: #e1251b;
   top: 2px;
   font-size: 20px;
 }
/deep/.el-input__suffix, .el-tree.is-dragging .el-tree-node__content * {
   pointer-events: auto;
 }
/deep/ .el-input-group__append, .el-input-group__prepend {
  background-color: #e1251b;
  color: #FFFFFF;
  border: 1px solid #e1251b;
  border-radius: 0;
  font-size: 24px;
  }
/deep/ .el-menu.el-menu--horizontal {
  border-bottom: none;
}
/deep/ .el-menu--horizontal>.el-menu-item {
  float: left;
  height: 30px;
  line-height: 30px;
  border-bottom: none;
  color: #333333;
  font-size: 16px;
}
/deep/ .el-menu--horizontal>.el-menu-item:hover {
  color: #e1251b;
  pointer-events: none;
}
.search-div{
  padding: 12px 0 0;
}
.mycart{
color: #e1251b !important;
/*box-shadow: 0 1px 2px #a9a9a9;*/
}
.mycart:hover{
  border: 1px solid #e1251b;
  background: transparent;
}
.nav-menu{
  margin-top: 20px;
  color: #333;
}
.el-menu--horizontal>.menu-active{
  color: red;
  font-weight: bold;
  pointer-events: auto;
}
.el-menu--horizontal>.menu-active:hover{
  color: #e1251b !important;
}
</style>
