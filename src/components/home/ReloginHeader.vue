<template>
  <div class="container">
  <el-row type="flex" justify="space-around" class="my-col">
    <el-col :span="8" class="my-top">
      <el-link href="/index" class="logo" :underline="false"></el-link>
      <span class="logo_title" :name="title">欢迎{{ title }}</span>
    </el-col>
    <el-col :span="10" class="my-top my-top-right">
      <div class="exist_account" v-if="isRegister" >
        已有帐号？<router-link to="/login" class="my-link">请登录 ></router-link>
      </div>
    </el-col>
  </el-row>
  </div>
</template>

<script>
export default {
  name: 'LogisterHeader',
  props: ['title'],
  data () {
    return {
      isRegister: false
    }
  },
  created () {
    if (this.$parent.title === '注册') {
      this.isRegister = true
    } else {
      this.isRegister = false
    }
  }
}
</script>

<style scoped>
.container{
  width: 100%;
  height: 100px;
  background: url(../../assets/img/headbg.jpg) repeat-x left bottom;
}
.my-col{
  overflow: hidden;
}
.my-top{
  height: 80px;
  line-height: 100px;
}
.my-top-right{
  text-align: right;
}
.logo{
  height: 100%;
  width: 180px;
   background: url("../../assets/img/full_logo.png") no-repeat;
   background-size: contain;
  margin: 0 auto;
 }
.logo_title{
  margin-left: 20px;
  font-size: 22px;
  letter-spacing: 3px;
}
.exist_account{
  color: #a9a9a9;
}
.my-link{
  color: #e1251b;
  position: relative;
  bottom: 1px;
  text-decoration: none;
}
.my-link:hover{
  color: #e1251b;
  cursor: pointer;
  padding-bottom: 2px;
  text-decoration: underline;
}
</style>
