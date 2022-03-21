<template>
  <div class="seckill">
    <SeckillTop></SeckillTop>
    <el-row type="flex" justify="center">
    <div class="headerbg"></div>
      <el-col :span="20">
      <div class="seckill-main">
        <div class="shead">
          <h3 class="stitle">秒杀专区</h3>
          <div class="tuijian">
            <img src="@/assets/img/seckill/tuijian.png" alt="焦点图">
          </div>
        </div>
        <div class="sbody">
          <el-card :body-style="{ padding: '0px' }" shadow="hover" class="card-item"
                   v-for="item in miaoshaList" :key="item.item_id" @click.native="toGoodsInfo(item.item_id)">
            <div class="s-image">
              <el-image style="padding: 0 14%" :src="item.img_url" fit="contain" lazy></el-image></div>
            <div class="s-txt">
              <span>{{ item.title }}</span>
              <div class="bottom">
                <div class="price">￥<span class="mprice">{{ item.m_price }}</span>
                  <span class="oprice">￥{{item.price}}</span></div>
                <span class="percent">已售{{parseInt(item.sold_num/item.amount*100)}}%</span>
                <el-progress :percentage="parseInt(item.sold_num/item.amount*100)" class="my-progress"
                             color="#e1251b" :stroke-width="8" :show-text="false"></el-progress>
              </div>
              <el-button type="text" class="button" @click="toGoodsInfo(item.item_id)">立即抢购</el-button>
            </div>
          </el-card>
        </div>
      </div>
    </el-col></el-row>
    <el-divider> END </el-divider>
  </div>
</template>

<script>
import SeckillTop from '@/components/home/seckill/SeckillTop'
import { SERVER_HOST } from '@/plugins/config'

export default {
  data () {
    return {
      miaoshaList: []
    }
  },
  mounted () {
    this.getMiaosha()
  },
  methods: {
    toGoodsInfo (id) {
      return this.$router.push({ name: 'seckill_item', params: { ID: id } })
    },
    getMiaosha () {
      this.$axios.get('/miaosha/getSeckill').then(res => {
        if (res.status === 200) {
          res.data = res.data.map((item) => {
            item.img_url = SERVER_HOST + item.img_url
            return item
          })
          this.miaoshaList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    }
  },
  components: {
    SeckillTop
  }
}
</script>

<style scoped>
.seckill{
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;
  background-color: #f6f6f6;
}
.seckill-main{
  width: 100%;
  height: 100%;
}
.headerbg{
  width: 100%;
  height: 300px;
  background: url(../../../assets/img/seckill/header_bgV2.png) no-repeat top;
  position: absolute;
  top: 0;
}
.shead{
  width: 100%;
  margin-bottom: 30px;
}
.stitle{
  margin: 28px 0;
  text-align: center;
  font-size: 28px;
  color: #e1251b;
  letter-spacing: 5px;
}
.tuijian{
  width: 100%;
  z-index: 3;
}
.tuijian>img{
  width: 100%;
  display: block;
}
.sbody{
  width: 100%;
  overflow: hidden;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.card-item{
  width: 24%;
  height: 360px;
  margin: 10px 0;
}
.s-image{
  width:100%;
  height: 70%;
  display: flex;
}
.s-txt{
  height: 30%;
  padding: 0 16px;
  font-size: 14px;
  color: #333333;
  position: relative;
}
.bottom{
  margin-top: 4%;
}
.price{
  color: #e1251b;
}
.mprice{
  font-size: 20px;
  font-weight: bold;
}
.oprice{
  font-size: 14px;
  color: #999999;
  text-decoration: line-through;
  padding-left: 10px;
}
.my-progress{
  display: inline-block;
  width: 30%;
}
.percent{
  font-size: 12px;
  padding-right: 3%;
}
.button{
  width: 30%;
  background-color: #e1251b;
  color: #FFFFFF;
  position: absolute;
  right: 12px;
  bottom: 20px;
}
.button:hover{
  background-color: rgba(241,37,27,0.91);
}
/deep/ .el-card__header{
  width: 0;
  height: 0;
  margin: 0;
  padding: 0;
}
/deep/ .el-card__body{
  width: 100%;
  height: 100%;
}
/deep/ .el-divider--horizontal {
  width: 30%;
  text-align: center;
  margin: 36px auto;
}
/deep/ .el-divider__text {
  background-color: #f6f6f6;
  color: #dddddd;
  font-size: 18px;
}
</style>
