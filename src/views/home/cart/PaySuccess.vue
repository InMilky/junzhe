<template>
  <div class="pay-success">
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row type="flex" justify="space-between">
          <el-col :span="6">
            <div class="logo">
              <img src="@/assets/logo.png" />
              <div class="page-title">收银台</div>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row class="tip" type="flex" justify="center">
      <el-col :span="20" style="margin: auto 0;display: flex">
        <div class="q-img"><img src="@/assets/img/index/erweima.png" alt="QRcode"></div>
        <div class="q-txt"><p>订单提交成功，请尽快付款！订单号：{{orderID}}</p>
          <p style="color: #999999;font-size: 12px">请您在<span style="color: #e1251b">{{countdown}}</span>内完成支付，负责订单会被自动取消</p>
        </div>
        <div class="q-price">应付金额
          <span style="color: #e1251b;font-size: 20px;padding: 0 5px">{{totalPrice}}</span>元</div>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center" style="border-top: 1px solid #e6e6e6;padding: 10px 0">
      <el-col :span="20">
        <div>
          <h4 style="font-weight: 500">订单详情</h4>
          <p>收货人：{{receiver.name}} {{receiver.telphone}}</p>
          <p>收货地址：{{receiver.address}}</p>
          <p>商品名称：{{itemInfo}}</p>
        </div>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center" style="margin-top:30px;border-top: 1px solid #e6e6e6;">
      <el-col :span="20">
        <div>
          <h4 style="font-weight: 500">推荐支付：</h4>
          <div style="display: flex">
            <div class="pay-code">
              <p>支付宝支付</p>
              <img src="@/assets/img/index/erweima.png" alt="QRcode"></div>
            <div class="pay-code">
              <p>微信支付</p>
              <img src="@/assets/img/index/erweima.png" alt="QRcode"></div>
            <div class="pay-code">
              <el-link class="jump" @click="toOrder" :underline="false">已完成支付</el-link>
              <el-link class="jump jumpindex" @click="toIndex" :underline="false">返回首页</el-link>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return {
      countdown: '',
      timer: 300,
      orderID: '',
      totalPrice: '',
      itemInfo: '',
      receiver: {}
    }
  },
  async mounted () {
    this.orderID = this.$route.params.orderID
    // this.totalPrice = this.$route.params.account
    await this.getReceiver()
    await this.getOrder()
    this.countDown()
  },
  methods: {
    countDown () {
      // 5分钟倒计时
      const timer = window.setInterval(() => {
        this.timer -= 1
        const minute = parseInt(this.timer / 60)
        const second = parseInt(this.timer % 60)
        const minutes = minute < 10 ? '0' + minute : minute
        const seconds = second < 10 ? '0' + second : second
        this.countdown = `${minutes}分钟${seconds}秒`
        if (this.timer === 0) {
          window.clearInterval(timer)
          this.$router.replace('/order')
        }
      }, 1000)
    },
    getOrder () {
      this.$axios.get('/order/getOrderByID', { params: { orderID: this.orderID } })
        .then(res => {
          if (res.status === 200) {
            this.totalPrice = res.data[0].account
            let itemInfo = ' '
            res.data.forEach((val, index) => {
              itemInfo += val.title + ' x' + val.quantity
              if (index !== res.data.length - 1) {
                itemInfo += ', '
              }
            })
            this.itemInfo = itemInfo
          }
        }).catch(err => {
          console.error(err)
          Promise.reject(err)
        })
    },
    getReceiver () {
      this.$axios.get('/order/getReceiver')
        .then(res => {
          if (res.status === 200) {
            this.receiver = res.data[0]
          }
        }).catch(err => {
          console.error(err)
          Promise.reject(err)
        })
    },
    toOrder () {
      this.$router.replace('/order')
    },
    toIndex () {
      this.$router.replace('/index')
    }
  }
}
</script>
<style scoped>
.pay-success{
  width: 100%;
  overflow: hidden;
  margin-bottom: 50px;
}
.headerarea{
  width: 100%;
  height: 100px;
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
}
/deep/ .el-col {
  margin: auto 0;
}
.tip{
  width: 100%;
  height: 100px;
  margin: 20px;
}

.q-img{
  height: 100%;
  flex: 0 0 100px;
}
.q-img>img{
  width: auto;
  height: 100%;
  display: block;
  border: 1px solid #e1251b;
}
.q-txt{
  flex: 1;
  margin: auto 15px;
}
.q-price{
  flex: 0 0 200px;
  margin: auto 0;
}
.pay-code{
  width: 200px;
  height: 120px;
  text-align: center;
}
.pay-code>img{
  width: auto;
  height: 80%;
}

.jump{
  display: inline-block;
  width: 140px;
  line-height: 38px;
  border-radius: 3px;
  font-size: 18px;
  text-align: center;
  height: 40px;
  background-color: #e1251b;
  color: #FFFFFF;
  font-weight: bold;
  float: right;
  margin: 10px 24px;
}
.jumpindex{
  background-color: transparent;
  color: #e1251b;
  border: 1px solid #e1251b;
  box-sizing: border-box;
}
.jump:hover{
  color: #FFFFFF;
  background: rgba(225,37,27,.95);
}
.jumpindex:hover{
  background: rgba(225,37,27,1);
}
</style>
