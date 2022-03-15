<template>
  <div class="admin-index">
    <el-row>
      <el-col>
        <div style="width: 100%;height: 80px;background-color: #e6e6e6">欢迎来到橘栀后台</div>
      </el-col>
    </el-row>
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
  data () {
    return {

    }
  },
  mounted () {

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
  min-height: 720px;
  margin: 0;
  padding: 0;
}
/deep/ .el-header, .el-footer {
    color: #333;
    text-align: center;
    line-height: 60px;
  }

/deep/ .el-aside {
    background-color: rgb(84, 92, 100);
    color: #d4d4d4;
    line-height: 200px;
  }

/deep/ .el-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;
    line-height: 160px;
  }

/deep/  .el-container {
    width: 100%;
    /*height: 100%;*/
    margin: 0;
    padding: 0;
  }

/deep/  .el-container:nth-child(5) .el-aside,
/deep/ .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

/deep/ .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }

</style>
