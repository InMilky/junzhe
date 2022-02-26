<template>
<div class="breadcrumb">
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item
      v-for="title in titlelist"
      :key="title.path"
      :to="title.path">{{ title.meta.title }}</el-breadcrumb-item>
  </el-breadcrumb>
</div>
</template>

<script>
export default {
  data () {
    return {
      titlelist: []
    }
  },
  watch: {
    // 监听路由变化 改变面包屑导航
    $route (to, from) {
      this.titlelist = to.matched
    }
  },
  methods: {

  },
  // 加载完成后 拿到当前页面信息
  mounted () {
    this.titlelist = this.$route.matched
  }
}
</script>

<style scoped>

</style>
