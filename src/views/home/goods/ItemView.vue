<template>
  <div class="goods-view">
    <SeckillTop></SeckillTop>
    <el-row class="goods-info">
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
                    <el-col :span="5"><div class="b-img active"><img :src="info[0].img_btm[0]" alt="main-img"/></div></el-col>
                    <el-col :span="5"><div class="b-img"><img :src="info[0].img_btm[1]" alt="main-img"/></div></el-col>
                    <el-col :span="5"><div class="b-img"><img :src="info[0].img_btm[2]" alt="main-img"/></div></el-col>
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
                  描述：<span>{{info[0].description['描述']}}</span>
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
      <el-row type="flex" justify="center" style="width: 100%;margin-top: 50px">
        <el-col :span="20">
          <div class="info-title">
            <span class="active">商品详情</span>
            <span>规格包装</span>
            <span>商品评价</span>
            <button type="button" class="addcartbtn" @click="toCart">
              <i class="el-icon-shopping-cart-2" style="font-size: 20px;padding-right: 5px"></i>
              加入购物车</button>
          </div>
          <el-backtop :visibility-height="800" :right="20"></el-backtop>
          <div class="desc">
            <el-descriptions title="产品信息" class="desc-info">
              <el-descriptions-item v-for="(item,key) in info[0].description" :key="key"
                                    :label="key">{{item}}</el-descriptions-item>
            </el-descriptions>
          </div>
          <div class="info-img" v-for="(img,index) in info[0].imggruop" :key="index">
            <img :src="img" :alt="index" />
          </div>
          <div class="evaluate">
            <div class="evaluate_title">评论</div>
            <div class="evaluate_main">
              <div class="left-rate">
                <span style="font-size: 12px;color: #999999">与描述相符</span>
                <p class="rate-num">{{rate}}</p>
                <el-rate v-model="rate" disabled></el-rate>
              </div>
              <div class="right-rate">
                <el-tag>挺显脸小(1010)</el-tag>
                <el-tag>款式很好看(1129)</el-tag>
                <el-tag>很时尚(511)</el-tag>
                <el-tag>很好搭配(5129)</el-tag><br>
                <el-tag>很实惠性价比高(9291)</el-tag>
                <el-tag>物流速度快</el-tag>
              </div>
            </div>
            <div class="evaluate_select">
              <el-radio v-model="radio" label="0">全部</el-radio>
              <el-radio v-model="radio" label="1">好评(51129)</el-radio>
              <el-radio v-model="radio" label="2">追评(2146)</el-radio>
              <el-radio v-model="radio" label="3">图片视频(1640)</el-radio>
            </div>
          </div>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" :class="{fixed:isFixed}"
              style="width: 100%;background-color: #FFFFFF">
        <el-col :span="20">
          <div class="info-title">
            <span class="active">商品详情</span>
            <span>规格包装</span>
            <span>商品评价</span>
            <button type="button" class="addcartbtn" @click="toCart">
              <i class="el-icon-shopping-cart-2" style="font-size: 20px;padding-right: 5px"></i>
              加入购物车</button>
          </div>
        </el-col>
      </el-row>
    </el-row>
  </div>
</template>

<script>
import SeckillTop from '@/components/home/seckill/SeckillTop'

export default {
  data () {
    return {
      num: 1,
      rate: 4.9,
      radio: '0',
      isFixed: false,
      info: [
        {
          ID: 'O1CN014gHYph20tulJeXAqV',
          title: '木九十新品太阳镜百搭黑超偏光男女墨镜MJ102SH519',
          price: '699',
          category: 'MUJOSH',
          store: '木九十官方旗舰店',
          miaosha_price: '599',
          amount: 1129,
          soldnum: 51,
          imgurl: require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_00.jpg'),
          img_btm: [
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_b01.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_b02.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_b03.jpg')
          ],
          imggruop: [
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_01.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_02.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_03.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_04.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_05.jpg'),
            require('@/assets/img/O1CN014gHYph20tulJeXAqV/O1CN014gHYph20tulJeXAqV_06.jpg')
          ],
          description: {
            商品名称: 'MUJOSH/木九十',
            商品编号: 'O1CN014gHYph20tulJeXAqV',
            颜色分类: 'BKC1曜石黑+单灰偏光片',
            上市时间: '2021年春季',
            镜架材质: '尼龙',
            镜片尺寸: '64mm及以上',
            描述: '前卫简约舒适时尚，男女通用，适合各种脸型，功能: 防UVA、防UVB、偏光、遮阳。尼龙镜片，配送高清尼龙镜片/双面防油污/内渡减反射膜'
          }
        }]
    }
  },
  mounted () {
    window.addEventListener('scroll', this.getScrollTop)
  },
  methods: {
    getScrollTop () {
      const top = document.body.scrollTop || window.pageYOffset || window.scrollY
      if (top > 710) {
        this.isFixed = true
      } else {
        this.isFixed = false
      }
    },
    searchGoods (key) {
      // alert(key)
      // axios请求
    },
    toOrder () {
      const ID = this.info[0].ID.toString()
      const buyNum = this.num.toString()
      this.$router.push({ name: 'seckill_item', params: { ID: ID, buy_num: buyNum } })
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
  overflow: hidden;
}
.main-img>img{
  width: auto;
  height: 100%;
  display: block;
  margin: 0 auto;
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
  overflow: hidden;
}
.b-img.active{
  border: 2px solid #e1251b;
}
.b-img>img{
  width: 100%;
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
  margin: 30px 0;
}
.p-sth-item{
  width: 33.3%;
  border-right:1px solid #e6e6e6;
}
.p-sth-item:last-child{
  border-right: none;
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
  margin: 40px 0;
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

.info-title{
  width: 100%;
  height: 42px;
  background-color: #eeeeee;
  /*overflow: hidden;*/
  box-sizing: border-box;
  border-bottom: 1px solid #e1251b;
  z-index: 3;
}
.fixed{
  border-bottom: 1px solid #e6e6e6;
  position: fixed;
  top: 0;
}
.info-title>span{
  display: inline-block;
  line-height: 42px;
  padding: 0 20px;
}
.info-title>span:hover{
  color: #e1251b;
}
.info-title>span.active{
  background-color: #e1251b;
  color: #FFFFFF;
  border-bottom: none;
}
.info-title>span.active:hover{
  color: #FFFFFF;
}
.addcartbtn{
  width: 150px;
  height: 100%;
  background: #e1251b;
  font-size: 16px;
  color: #FFFFFF;
  border: none;
  float: right
}
.desc{
  font-size: 12px;
  color: #e6e6e6;
  margin: 30px 0;
  padding: 0 30px;
}
/deep/ .el-descriptions__title {
  font-size: 14px;
  color: #999999;
  font-weight: 700;
}
.info-img{
  width: 100%;
}
.info-img>img{
  width: 80%;
  height: auto;
  margin: 0 auto;
  display: block;
}
.evaluate{
  width: 100%;
}
.evaluate_title{
  height: 36px;
  line-height: 36px;
  background-color: #e1251b;
  color: #FFFFFF;
  font-size: 14px;
  letter-spacing: 5px;
  font-weight: 700;
  padding-left: 15px;
}
.evaluate_main{
  height: 100px;
  border: 1px solid #a9a9a9;
  display: flex;
  padding-left: 15px;
  text-align: center;
}
.left-rate{
  flex: 0 0 200px;
  margin: auto;
  border-right: 1px solid #e6e6e6;
}
.rate-num{
  font-size: 30px;
  color: #ff9911;
  font-weight: bold;
}
.right-rate{
  flex: 1;
}
.evaluate_select{
  height: 32px;
  background-color: #e6e6e6;
  border: 1px solid #a9a9a9;
  padding-left: 15px;
  line-height: 32px;
}
/deep/ .el-tag {
  background-color: rgba(225,37,27,.1);
  border-color: rgba(225,37,27,.3);
  color: #e1251b;
  margin: 15px 15px 0;
}
/deep/ .el-radio__input.is-checked .el-radio__inner {
  border-color: #e1251b;
  background: #e1251b;
}
/deep/ .el-radio__input.is-checked+.el-radio__label {
  color: #e1251b;
}
/deep/ .el-backtop{
  color: #e1251b;
  border: 1px solid #e1251b;
  background-color: rgba(225,37,27,.1);
}
</style>
