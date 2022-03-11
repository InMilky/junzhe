<template>
  <div class="error_page">
    <el-row type="flex" justify="center">
      <el-col :span="20">
        <div class="logo">
          <img src="../../../assets/logo.png">
        </div></el-col>
    </el-row>
    <el-empty description="抱歉，网页无法访问……">
      <el-button type="button" @click="toIndex">返回首页</el-button>
    </el-empty>
  </div>
</template>
<script>
export default {
  methods: {
    toIndex () {
      return this.$router.push({ name: 'index' })
    }
  }
}
</script>
<style scoped>
.error_page{
  width: 100%;
  height: 100%;
  margin-bottom: 50px;
}
.logo{
  height: 72px;
  margin: 20px 0;
}
.logo>img{
  max-height: 100%;
  width: auto;
  display: block;
}
/deep/ .el-button {
  color: #e1251b!important;
  border-color: #e1251b;
  background-color: rgba(225,37,27,.3);
}
/deep/ .el-button:focus, .el-button:hover {
  color: #FFFFFF!important;
  background-color: rgba(225,37,27,1);
}
</style>
