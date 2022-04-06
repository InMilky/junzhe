<template>
  <div class="goods-view">
    <SeckillTop @search="searchGoods"></SeckillTop>
    <el-row class="goods-info">
      <div class="nav-top">
        <el-row type="flex" justify="center" style="width: 100%">
          <el-col :span="20" style="display:flex;overflow: hidden;justify-content: space-between">
            <el-breadcrumb separator-class="el-icon-arrow-right" class="left-breadrum">
              <el-breadcrumb-item to="/">{{info.brand}}</el-breadcrumb-item>
              <el-breadcrumb-item>{{info.title}}</el-breadcrumb-item>
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
              <div class="main-img"><img :src="info.img_url" alt="main-img"/></div>
              <div class="bottom-img">
                <el-row type="flex" justify="space-between" align="center" style="width: 100%;height: 100%">
                  <el-col :span="3" class="rl-icon"><i class="el-icon-arrow-left"></i></el-col>
                  <el-col :span="5"><div class="b-img active"><img :src="info.img_url" :alt="info.img_url"/></div></el-col>
                  <el-col :span="5"><div class="b-img"><img :src="info.img_url" alt="main-img"/></div></el-col>
                  <el-col :span="5"><div class="b-img"><img :src="info.img_url" alt="main-img"/></div></el-col>
                  <el-col :span="3" class="rl-icon"><i class="el-icon-arrow-right"></i></el-col>
                </el-row>
              </div>
            </el-col>
            <el-col :span="14" :push="1" class="p-info">
              <div class="p-title">{{info.title}}</div>
              <div class="p-price">
                <div class="p-header">
                  <div>
                    <i class="el-icon-alarm-clock" style="font-size: 21px;padding-right: 5px;position: relative;top: 2px"></i>
                    <span style="display: inline-block">橘栀秒杀活动 {{timer.start_date}}</span></div>
                  <div v-if="activityFlag!==2">距离活动{{eflag}}还有 {{countdown}}</div>
                  <div v-else>{{eflag}}</div>
                </div>
                <div class="p-body">
                  <div>秒杀价：<span style="color: #e1251b">￥</span>
                    <span class="mprice">{{info.m_price}}</span>
                    <span class="oprice">￥{{info.price}}</span></div>
                  <div>促  销：限购1件，超出数量以结算价为准</div>
                  <div class="discount">
                    <el-tag type="danger">领券购买</el-tag>
                  </div>
                </div>
              </div>
              <div class="p-tip">服 务：支持极速审核、运费险、闪电退款，包邮免运费（限中国内地）</div>
              <div class="p-description">
                描述：<span>{{info.description}}</span>
              </div>
              <div class="p-sth">
                  <div class="p-sth-item"><p>月销量</p><p class="count">{{info.sold_num}}+</p></div>
                  <div class="p-sth-item"><p>累计评论</p><p class="count">1640+</p></div>
                  <div class="p-sth-item"><p>库存量</p><p class="count">{{ stock }}</p></div>
              </div>
              <div class="addnum">
                数量：<el-input-number v-model="num" :min="1" :max="1"></el-input-number>
              </div>
              <div class="btn-group">
                <button type="button" class="paybtn" @click="toOrder" :disabled="disabled">{{btn_value}}</button>
                <button type="button" class="cartbtn" @click="toCart">
                  <i class="el-icon-shopping-cart-2" style="font-size: 20px;padding-right: 5px"></i>
                  加入购物车</button>
              </div>
            </el-col>
          </el-row>
          </div>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" style="width: 100%;margin-top: 30px">
        <el-col :span="20">
          <div class="info-title">
            <span class="active">商品详情</span>
            <span>规格包装</span>
            <span>商品评价</span>
          </div>
          <el-backtop :visibility-height="800" :right="20"></el-backtop>
          <div class="desc">
            <el-descriptions title="产品信息" class="desc-info">
              <el-descriptions-item v-for="(item,key) in info.detail" :key="key"
                                    :label="entocn[key]">{{item}}</el-descriptions-item>
            </el-descriptions>
          </div>
          <div class="info-img" v-for="(img,index) in info.brief_img" :key="index">
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
      <el-row type="flex" justify="center" v-if="info.flag" :class="{fixed:isFixed}"
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
import { SERVER_HOST } from '@/plugins/config'
export default {
  data () {
    return {
      num: 1,
      itemID: '',
      activityFlag: 0,
      btn_values: ['敬请期待', '立即购买', '活动已结束', '已购买', '已售罄'],
      btn_value: '敬请期待',
      eflag_names: ['开始', '结束', '活动已结束'],
      eflag: '开始',
      countdown: '00:00:00',
      diffTime: 0,
      timer: {
        interval: '',
        start_date: '',
        end_date: '',
        hours: '',
        minutes: '',
        seconds: ''
      },
      limitClick: false,
      info: { brand: '首页' },
      stock: '',
      rate: 4.9,
      radio: '0',
      isFixed: false,
      entocn: {
        item_no: '商品编号',
        brand: '商品品牌',
        color: '颜色分类',
        publish_date: '上市时间',
        feature: '商品特性',
        size: '尺寸大小',
        details: '详情描述'
      }
    }
  },
  async mounted () {
    window.addEventListener('scroll', this.getScrollTop)
    this.itemID = this.$route.params.ID
    await this.getItem()
    await this.getSecTime()
  },
  beforeDestroy () { // 当离开页面时，清除倒计时
    clearInterval(this.timer.interval)
  },
  computed: {
    disabled () {
      return (this.activityFlag !== 1 || this.limitClick)
    }
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
      this.$router.push({ name: 'list_item', query: { key: key } })
    },
    getItem () {
      const itemID = this.itemID
      this.$axios.post('/miaosha/getItem', { itemID: itemID })
        .then(res => {
          if (res.status === 200) {
            const item = res.data
            item.flag = false
            item.img_url = SERVER_HOST + item.img_url
            // 若存在detail
            if (item.detail) {
              item.flag = true
              item.detail.brief_img = item.detail.brief_img.map((temp) => {
                temp = SERVER_HOST + temp
                return temp
              })
              item.brief_img = item.detail.brief_img
              // 调整顺序
              const object = [item.detail.feature, item.detail.size, item.detail.details]
              delete item.detail.feature
              delete item.detail.size
              delete item.detail.details
              delete item.detail.brief_img
              item.detail.color = item.color
              item.detail.size = object[1]
              item.detail.feature = object[0]
              item.detail.details = object[2]
            }
            this.info = res.data
          } else {
            this.$message.error(res.msg)
          }
        }).catch(err => {
          this.$message.error(err)
        })
    },
    getSecTime () {
      const itemID = this.itemID
      this.$axios.get('/miaosha/getSecTime', { params: { itemID: itemID } })
        .then(res => {
          if (res.status === 200) {
            this.timer.start_date = res.data.start_date
            this.timer.end_date = res.data.end_date
            this.diffTime = res.data.diffTime
            this.activityFlag = res.data.activityFlag
            this.stock = res.data.stock
            this.eflag = this.eflag_names[this.activityFlag]
            this.btn_value = this.btn_values[this.activityFlag]
            if (this.diffTime > 0) {
              this.setTimer()
            } else {
              clearInterval(this.timer.interval)
            }
            console.log('diffTime', this.diffTime)
            console.log('activityFlag', this.activityFlag)
            console.log('eflag', this.eflag)
            console.log('btn_value', this.btn_value)
          }
        }).catch(err => {
          this.$message.error(err)
        })
    },
    countDown () {
      const hour = parseInt(this.diffTime / 1000 / 60 / 60 % 24)
      const minute = parseInt(this.diffTime / 1000 / 60 % 60)
      const second = parseInt(this.diffTime / 1000 % 60)
      const hours = hour < 10 ? '0' + hour : hour
      const minutes = minute < 10 ? '0' + minute : minute
      const seconds = second < 10 ? '0' + second : second
      this.countdown = `${hours}:${minutes}:${seconds}`
    },
    setTimer () {
      this.timer.interval = window.setInterval(() => {
        this.diffTime = this.diffTime - 1000
        this.countDown()
        if (this.diffTime <= 0) {
          window.clearInterval(this.timer.interval)
          this.getSecTime()
        }
      }, 1000)
    },
    toOrder () {
      const ID = this.info.ID.toString()
      // const buyNum = this.num.toString()
      // this.$router.push({ name: 'checkout', params: { ID: ID, buyNum: buyNum } })
      this.$axios.post('/miaosha/order', { itemID: ID })
        .then(res => {
          if (res.status === 200) {
            if (res.code === 1) {
              this.limitClick = true
              this.btn_value = this.btn_values[3]
            }
            this.stock -= 1
            this.$message.success(res.msg)
          } else {
            this.$message.error(res.msg)
          }
        })
        .catch(err => {
          console.error(err)
          this.$message.error(err)
        })
    },
    toCart () {
      const ID = this.info.ID.toString()
      const buyNum = this.num.toString()
      // 若没登陆先登陆-回到该页面，否则先插入或更新购物车再跳转到购物车页面
      if (!localStorage.getItem('jwt_token')) {
        this.$router.push({
          path: '/login',
          query: {
            redirectURL: this.$route.fullPath
          }
        })
      } else {
        this.$axios.post('/cart/updateCart', { item_id: ID, buyNum: buyNum })
          .then(res => {
            if (res.status === 200) {
              this.$router.push({ name: 'cart' })
            }
          }).catch(err => {
            Promise.reject(err)
          })
      }
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
  height: 500px;
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
  height: 17%;
  margin-top: 3%;
  color: #606266;
  text-align: center;
}
.b-img{
  width: 100%;
  height: 100%;
  overflow: hidden;
  box-sizing: border-box;
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
  margin-top: 10px;
  width: 100%;
  height: 136px;
}
.p-header{
  width: 100%;
  height: 42px;
  line-height: 42px;
  background-color: #e1251b;
  color: #FFFFFF;
  padding: 0 10px;
  display: flex;
  justify-content: space-between;
}
.p-header>div{
  margin: auto 0;
}
.p-body{
  width: 100%;
  height: 88px;
  padding: 0 10px;
  background-color: #e6e6e6;
  color: #999999;
  font-size: 14px;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.p-body>div{
  padding: 5px 0;
}
.discount{
  position: absolute;
  right: 10px;
  top: 50%;
  margin-top: -6%;
  cursor: pointer;
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
  padding: 0 15px;
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
button[disabled]{
  cursor: not-allowed;
  border: 2px solid #dddddd;
  font-size: 16px;
  background: #eeeeee;
  color: #a9a9a9;
}
</style>
