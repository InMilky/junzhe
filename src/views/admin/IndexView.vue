<template>
  <div class="admin-index">
    <el-container>
      <!--  左侧导航  -->
        <NavMenu class="nav-menu">Aside</NavMenu>
        <!--  右边 显示 左边的导航内容  -->
        <el-container>
          <!--  头部 面包屑 导航条  -->
          <el-header> <BreadcrumbHeader /> </el-header>
          <!--  主体   -->
          <el-main>
            <router-view />
          </el-main>
          <!--  底部版权信息  -->
          <el-footer>Footer</el-footer>
        </el-container>
    </el-container>
  </div>
</template>

<script>
import NavMenu from '@/components/admin/NavMenu'
import BreadcrumbHeader from '@/components/admin/BreadcrumbHeader'
export default {
  name: 'IndexView',
  data () {
    return {

    }
  },
  methods: {

  },
  components: {
    NavMenu,
    BreadcrumbHeader
  }
}
</script>
<style scoped>
.admin-index {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
  .el-header, .el-footer {
    color: #333;
    text-align: center;
    line-height: 60px;
  }

  .el-aside {
    background-color: rgb(84, 92, 100);
    color: #d4d4d4;
    line-height: 200px;
  }

  .el-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;
    line-height: 160px;
  }

  .el-container {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }

</style>
