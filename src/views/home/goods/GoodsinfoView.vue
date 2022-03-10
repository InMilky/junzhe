<template>
  <div class="goods-view">
    <SeckillTop></SeckillTop>
    <div class="goods-info">
      <div class="nav-top">
        <el-row type="flex" justify="center" style="width: 100%">
          <el-col :span="20" style="display:flex;overflow: hidden;justify-content: space-between">
            <el-breadcrumb separator-class="el-icon-arrow-right" class="left-breadrum">
              <el-breadcrumb-item to="/">{{info[0].category}}</el-breadcrumb-item>
              <el-breadcrumb-item to="/">{{info[0].store}}</el-breadcrumb-item>
              <el-breadcrumb-item>{{info[0].title}}</el-breadcrumb-item>
            </el-breadcrumb>
            <div class="right-action">
              <el-link :underline="false"><i class="el-icon-service"></i>联系客服</el-link>
              <el-link :underline="false"><i class="el-icon-star-on"></i>关注本店</el-link>
            </div>
          </el-col></el-row>
      </div>
      <el-row type="flex" justify="center" style="width: 100%">
        <el-col :span="20">
          <div class="main-info">
          <el-row type="flex" style="width: 100%">
            <el-col :span="9" class="p-img">
              <div class="main-img"><img :src="info[0].imgurl" alt="main-img"/></div>
              <div class="bottom-img">
                <el-row type="flex" justify="space-between" align="center" style="width: 100%;height: 100%">
                  <el-col :span="3" class="rl-icon"><i class="el-icon-arrow-left"></i></el-col>
                  <el-col :span="5"><div class="b-img active"><img :src="info[0].imgurl" alt="main-img"/></div></el-col>
                  <el-col :span="5"><div class="b-img"><img :src="info[0].imgurl" alt="main-img"/></div></el-col>
                  <el-col :span="5"><div class="b-img"><img :src="info[0].imgurl" alt="main-img"/></div></el-col>
                  <el-col :span="3" class="rl-icon"><i class="el-icon-arrow-right"></i></el-col>
                </el-row>
              </div>
            </el-col>
            <el-col :span="14" :push="1" class="p-info">
              <div class="p-title">{{info[0].title}}</div>
              <div class="p-price">
                价格：<span style="color: #e1251b">￥</span>
                    <span class="mprice">{{info[0].miaosha_price}}</span>
                    <span class="oprice">￥{{info[0].price}}</span>
              </div>
              <div class="p-tip">服 务：支持极速审核、运费险、闪电退款，包邮免运费（限中国内地）</div>
              <div class="p-description">
                描述：<span>{{info[0].description}}</span>
              </div>
              <div class="p-sth">
                  <div class="p-sth-item"><p>月销量</p><p class="count">{{info[0].soldnum}}+</p></div>
                  <div class="p-sth-item"><p>累计评论</p><p class="count">51129</p></div>
                  <div class="p-sth-item"><p>库存量</p><p class="count">{{ info[0].amount }}</p></div>
              </div>
              <div class="addnum">
                数量：<el-input-number v-model="num" :min="1" :max="9999"></el-input-number>
              </div>
              <div class="btn-group">
                <button type="button" class="paybtn" @click="toOrder">立即购买</button>
                <button type="button" class="cartbtn" @click="toCart">
                  <i class="el-icon-shopping-cart-2" style="font-size: 20px;padding-right: 5px"></i>
                  加入购物车</button>
              </div>
            </el-col>
          </el-row>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import SeckillTop from '@/components/home/seckill/SeckillTop'

export default {
  data () {
    return {
      num: 1,
      info: [
        {
          ID: 1,
          title: '山河令开播一周年快乐四季花常在九洲事尽知',
          price: '51.29',
          category: '数码电器',
          store: '不重要的手表店家',
          miaosha_price: '16.40',
          amount: 100,
          soldnum: 51,
          imgurl: require('@/assets/img/seckill/seckill-item11.png'),
          description: '山河不足重重在遇知己知己既去何若玉碎你身上有光我抓来看看刀不砍在身上不知道疼啊岂不闻烈女怕缠郎有志者事竟成'
        }]
    }
  },
  methods: {

    searchGoods (key) {
      // alert(key)
      // axios请求
    },
    toOrder () {
      // const ID = this.info[0].ID.toString()
      // const buyNum = this.num.toString()
      // this.$router.push({ name: 'item', params: { ID: ID, buy_num: buyNum } })
      this.$router.push({ name: 'item' })
    },
    toCart () {
      const ID = this.info[0].ID.toString()
      const buyNum = this.num.toString()
      this.$router.push({ name: 'cart', params: { ID: ID, buy_num: buyNum } })
    }
  },
  components: {
    SeckillTop
  }
}
</script>

<style scoped>
.goods-info{
  width: 100%;
  margin: 10px 0 30px;
}
.nav-top {
  width: 100%;
  height: 36px;
  background-color: #e6e6e6;
  color: #606266;
  margin-bottom: 30px;
  display: flex;
}
.left-breadrum{
  font-size: 12px;
  margin: auto 0;
}
.right-action{
  margin: auto 0;
}
.right-action i{
  color: #e1251b;
  font-size: 16px;
  padding-right:2px
}
.right-action>.el-link{
  margin-left: 5px;
  font-size: 12px;
}
.right-action>.el-link:hover{
  color: #e1251b;
}
.main-info{
  width: 100%;
}
.p-img{
  height: 480px;
}
.main-img{
  width: 100%;
  height: 80%;
  background: #606266;
  overflow: hidden;
}
.main-img>img{
  width: 100%;
  height: auto;
  display: block;
}
.bottom-img{
  width: 100%;
  height: 16%;
  margin-top: 4%;
  color: #606266;
  text-align: center;
}
.b-img{
  width: 100%;
  height: 100%;
  background: #606266;
}
.b-img.active{
  border: 2px solid #e1251b;
}
.b-img>img{
  width: 100%;
  height: 100%;
  display: block;
}
.rl-icon{
  font-size: 60px;
  margin: auto 0;
  color: #999999;
}
.rl-icon:hover{
  color: #606266;
}
.p-info{
  height: 400px;
  color: #999999;
}
.p-title{
  width: 100%;
  font-size: 18px;
  line-height: 20px;
  padding: 10px 0;
  color: #606266;
}
.p-price{
  margin-top: 20px;
}
.mprice{
  font-size: 24px;
  color: #e1251b;
  font-weight: 700;
}
.oprice{
  padding-left: 20px;
  text-decoration: line-through;
  font-size: 16px;
  color: #999999;
}
.p-tip{
  font-size: 14px;
  font-weight: 300;
  margin: 10px 0;
}
.p-description{
  width: 100%;
  display: flex;
  justify-content: space-between;
  margin: 10px 0;
}
.p-description>span{
  flex: 1;
}
.p-sth{
  width: 100%;
  border-top: 1px solid #e6e6e6;
  border-bottom: 1px solid #e6e6e6;
  display: flex;
  padding: 6px 0;
  text-align: center;
  overflow: hidden;
  margin: 18px 0;
}
.p-sth-item{
  width: 33.3%;
  border-right:1px solid #e6e6e6;
}
.count{
  color: #e1251b;
  font-weight: 700;
}
.addnum{
  margin: 20px 0;
}
.btn-group{
  width: 100%;
  height: 56px;
  margin: 30px 0;
}
.paybtn{
  height: 80%;
  width: 180px;
  border: 2px solid #e1251b;
  font-size: 16px;
  background: rgba(225,37,27,.3);
  color: #e1251b;
  margin: auto 50px;
}
.cartbtn{
  width: 180px;
  height: 80%;
  background: #e1251b;
  font-size: 16px;
  color: #FFFFFF;
  border: none;
}
/*/deep/ .el-input-number__decrease:hover,*/
/*/deep/.el-input-number__increase:hover {*/
/*  color: #e1251b;*/
/*}*/
/deep/ .el-breadcrumb__inner.is-link:hover {
  color: #e1251b;
  cursor: pointer;
}

/deep/ .el-breadcrumb__inner.is-link {
   font-weight: 500;
 }
</style>
