<template>
  <div class="cart-header">
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row type="flex" justify="space-between">
          <el-col :span="6">
            <div class="logo">
              <img src="@/assets/logo.png" />
              <div class="page-title">我的{{title}}</div>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="nav">
              <el-input type="text" placeholder="搜索" v-model="searchKey">
                <el-button slot="append" icon="el-icon-search" @click="searchGoods"></el-button>
              </el-input>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  props: ['title'],
  data () {
    return {
      searchKey: ''
    }
  },
  methods: {
    searchGoods () {
      this.$emit('search', this.searchKey)
    }
  }
}
</script>

<style scoped>
.cart-header{
  width: 100%;
  height: 100px;
  margin: 0;
  padding: 0;
}
.headerarea{
  width: 100%;
  height: 100%;
  background: white;
  color: #333333;
}
.logo{
  height: 100%;
  display: flex;
}
.logo>img{
  max-width: 50%;
  display: block;
  height: auto;
  margin: auto 0;
}
.page-title{
  margin: auto;
  font-size: 18px;
  position: relative;
  top: 10px;
  left: 10px;
}
.nav{
  height: 100%;
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
/deep/ .el-input__prefix, /deep/ .el-input__suffix {
  color: #e1251b;
  top: 2px;
  font-size: 20px;
}
/deep/ .el-input__suffix, /deep/ .el-tree.is-dragging .el-tree-node__content * {
  pointer-events: auto;
}
/deep/ .el-input-group__append, /deep/ .el-input-group__prepend {
  background-color: #e1251b;
  color: #FFFFFF;
  border: 1px solid #e1251b;
  border-radius: 0;
  font-size: 24px;
}

</style>
