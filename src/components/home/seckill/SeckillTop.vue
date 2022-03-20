<template>
  <div class="seckill-header">
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row>
          <el-col :span="5">
            <div class="logo">
              <img src="@/assets/logo.png" />
            </div>
          </el-col>
          <el-col :span="10" :push="5">
            <div class="nav">
              <el-input type="text" placeholder="搜索" :wq="keyword" v-model="searchKey">
                <el-button slot="append" icon="el-icon-search" @click="searchGoods"></el-button>
              </el-input>
            </div>
          </el-col>
          <el-col :span="3" :push="6">
              <el-button class="mycart" @click="toCart">
                <i class="el-icon-shopping-cart-2" style="font-size: 18px"></i>&nbsp;
                <div style="display: inline-block; font-size: 12px; position:relative; top:-2px">我的购物车</div>
              </el-button></el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  props: ['keyword'],
  data () {
    return {
      searchKey: this.keyword
    }
  },
  mounted () {

  },
  methods: {
    searchGoods () {
      this.$emit('search', this.searchKey)
    },
    toCart () {
      this.$router.push('/cart')
    }
  },
  computed: {
    wq: function () {
      return this.searchKey
    }
  },
  watch: {
    keyword (newV, oldV) { // watch监听props里status的变化，然后执行操作
      this.searchKey = newV
    }
  }
}
</script>
<style scoped>
.seckill-header{
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
.mycart{
  color: #e1251b !important;
  /*box-shadow: 0 1px 2px #a9a9a9;*/
}
.mycart:hover{
  border: 1px solid #e1251b;
  background: transparent;
}
</style>
