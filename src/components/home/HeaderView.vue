<template>
<el-container>
  <el-row class="top-header" type="flex" justify="center">
    <el-row :span="20"></el-row>
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
  background-color: #eee;
  color: #a9a9a9;
  font-size: 14px;
}
</style>
