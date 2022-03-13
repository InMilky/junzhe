<template>
  <div class="TopNav">
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <router-link class="index-icon" v-if="$route.path!=='/index'" to="/index">
          <i class="el-icon-s-home" style="font-size: 16px"></i>&nbsp;返回首页</router-link>
        <el-breadcrumb separator="|" class="my-breadcrumb">
          <el-breadcrumb-item v-if="!isLogin">
            <router-link to="/login" class="a-link">登录</router-link>&nbsp;
            <router-link to="/signup" class="a-link">注册</router-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item v-else>
            <span class="a-link">欢迎{{ username }}</span>&nbsp;
            <el-link class="r-link" @click="logout" :underline="false">退出登录</el-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <router-link to="/order" class="r-link" v-if="$route.path!=='/order'" >我的订单</router-link>
            <router-link to="/cart" class="r-link" v-else >我的购物车</router-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <el-link href="javascript:void(0)" :underline="false" class="r-link" @click.native="userCenter">个人中心</el-link>
          </el-breadcrumb-item>
          <el-breadcrumb-item>
            <el-link href="javascript:void(0)" :underline="false" class="r-link">关注网站</el-link>
          </el-breadcrumb-item>
        </el-breadcrumb>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  props: ['isLogin', 'username'],
  data () {
    return {
    }
  },
  created () {
    this.$axios.get('/user/getuser').then(res => {
      if (res.status === 200) {
        this.$parent.username = res.username
        this.$parent.isLogin = true
      } else {
        this.$parent.username = ''
        this.$parent.isLogin = false
      }
    })
  },
  methods: {
    logout () {
      this.$emit('logout')
    },
    userCenter () {
      this.$message.error('click')
    }
  }
}
</script>

<style scoped>
.TopNav{
  width: 100%;
}
.top-nav{
  width: 100%;
  height: 30px;
  overflow: hidden;
  display: flex;
  align-items: center;
  background-color: #e6e6e6;
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
/deep/ .el-breadcrumb__inner a:hover,
/deep/ .el-breadcrumb__inner.is-link:hover {
  color: #e1251b;
}
/deep/ .el-link.el-link--default {
  position: relative;
  top: -1px;
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
.index-icon{
  color: #606266;
  font-size: 12px;
  cursor: pointer;
}
.index-icon:hover{
  color: #e1251b;
}
</style>
