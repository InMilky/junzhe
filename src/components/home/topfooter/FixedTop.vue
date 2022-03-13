<template>
  <div class="fixed-header">
    <el-row class="fix-top" type="flex" justify="center">
      <el-col :span="20" style="height: 100%">
        <el-row type="flex" style="height: 100%">
          <el-col :span="3" style="height: 100%"><div class="logo">
            <img src="@/assets/logo.png">
          </div></el-col>
          <el-col :span="12" :push="1">
            <el-input type="text" placeholder="搜索" v-model="searchKey">
              <el-button slot="append" icon="el-icon-search" @click="searchGoods"></el-button>
            </el-input></el-col>
          <el-col :span="3" :push="2">
            <el-button class="mycart" @click="toCart">
              <i class="el-icon-shopping-cart-2" style="font-size: 18px"></i>&nbsp;
              <div style="display: inline-block; font-size: 12px; position:relative; top:-2px">我的购物车</div>
            </el-button>
          </el-col>
          <el-col :span="3" :push="2" style="margin-left: 10px">
            <el-button class="myorder" @click="toOrder">
              <i class="el-icon-s-finance" style="font-size: 18px"></i>&nbsp;
              <div style="display: inline-block; font-size: 12px; position:relative; top:-2px">我的订单</div>
            </el-button>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return {
      searchKey: ''
    }
  },
  methods: {
    searchGoods () {
      this.$emit('search', this.searchKey)
    },
    toCart () {
      this.$router.push('/cart')
    },
    toOrder () {
      this.$router.push('/order')
    }
  }
}
</script>

<style scoped>
.fixed-header{
  width: 100%;
  color: #a9a9a9;
  font-size: 14px;
  margin: 0;
  padding: 0;
}
/* 固定顶部搜索框 */
.fix-top{
  width: 100%;
  height: 56px;
  border-bottom: 2px solid #e1251b;
  background: white;
  color: #333333;
  z-index: 99;
  position: fixed;
  top: 0;
  left: 0;
}
.fix-top .logo{
  height: 100%;
  width: 100%;
}
.fix-top .logo>img{
  height: 80%;
  width: auto;
  display: block;
  margin-left: 0;
}
.logo{
  height: 100%;
  display: flex;
}
.logo>img{
  max-width: 90%;
  display: block;
  height: auto;
  margin: auto;
}
.mycart,.myorder{
  color: #e1251b !important;
  /*box-shadow: 0 1px 2px #a9a9a9;*/
}
.mycart:hover,.myorder:hover,
.mycart:active,.myorder:active{
  border: 1px solid #e1251b;
  background: transparent;
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
/deep/ .el-input__prefix, .el-input__suffix {
  color: #e1251b;
  top: 2px;
  font-size: 20px;
}
/deep/.el-input__suffix, .el-tree.is-dragging .el-tree-node__content * {
  pointer-events: auto;
}
/deep/ .el-input-group__append, .el-input-group__prepend {
  background-color: #e1251b;
  color: #FFFFFF;
  border: 1px solid #e1251b;
  border-radius: 0;
  font-size: 24px;
}
</style>
