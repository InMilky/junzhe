<template>
  <div class="copyright">
      <div class="my-row">
        <el-breadcrumb separator="|" class="my-breadcrumb">
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">关于我们</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">联系我们</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">服务大厅</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">合作招商</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">商家帮助</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">法律声明</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">友情链接</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">橘栀社区</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">隐私政策</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">意见征集</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">廉正举报</el-link></el-breadcrumb-item>
          <el-breadcrumb-item><el-link href="javascript:void(0)" :underline="false">English Site</el-link></el-breadcrumb-item>
        </el-breadcrumb>
      </div>
      <p class="copyright-txt">Copyright © 2020-2021 SOUTH CHINA NORMAL UNIVERSITY | MILKY NUMBER20210405</p>
  </div>
</template>

<script>
export default {
  name: 'CopyRight'
}
</script>

<style scoped>
.copyright{
  text-align: center;
  font-size: 12px;
  border-top: 1px solid #d4d4d4;
  padding-top: 10px;
  margin-bottom: 21px;
}
.my-row{
  display: flex;
  margin: 8px auto;
}
.my-breadcrumb{
  width: auto;
  height: 100%;
  text-align: center;
  margin: auto;
}
.copyright-txt{
  color: #666;
}
/deep/ .el-link.el-link--default {
  color: #303133;

}
/deep/ .el-breadcrumb__inner a, .el-breadcrumb__inner.is-link {
    font-weight: 500;
   font-size: 14px;
 }
</style>
