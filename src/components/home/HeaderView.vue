<template>
<el-container>
  <el-row class="top-header" type="flex" justify="center">
    <el-row class="top-nav">
      <el-col :span="20" :offset="2">
        <el-breadcrumb separator="|" class="my-breadcrumb">
          <el-breadcrumb-item>
            <router-link to="/login" class="a-link">登录</router-link>&nbsp;
            <router-link to="/signin" class="a-link">注册</router-link>
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
    <el-row>
      <el-col :span="20"></el-col>
    </el-row>
  </el-row>
</el-container>
</template>

<script>
export default {
  name: 'HeaderView'
}
</script>

<style scoped>
.top-header{
  width: 100%;
  color: #a9a9a9;
  font-size: 14px;
  margin: 0;
  padding: 0;
  background-color: #dddddd;
}
.top-nav{
  width: 100%;
  height: 30px;
  overflow: hidden;
  display: flex;
  align-items: center;
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
/deep/ .el-breadcrumb__item:last-child .el-breadcrumb__inner,
.el-breadcrumb__item:last-child .el-breadcrumb__inner a,
.el-breadcrumb__item:last-child .el-breadcrumb__inner a:hover,
.el-breadcrumb__item:last-child .el-breadcrumb__inner:hover{
  cursor: pointer;
}
</style>
