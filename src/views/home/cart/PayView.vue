<template>
  <div class="pay-view">
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row type="flex" justify="space-between">
          <el-col :span="6">
            <div class="logo">
              <img src="@/assets/logo.png" />
              <div class="page-title">结算页面</div>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center">
      <el-col :span="20">
        <h3>填写并核对订单信息</h3>
        <div class="order-main">
          <div class="receiver-info">
            <div class="rec-title">
              <span>确认收货地址</span>
              <el-link :underline="false" style="float: right;font-size: 12px">管理收货地址</el-link></div>
            <div class="rec-info">
              <span class="checked" style="margin-right: 8px;position:relative;">
                {{ receiver.name }}
                <label class="el-upload-list__item-status-label"><i class="el-icon-upload-success el-icon-check"></i></label>
              </span>
              <span>{{ receiver.name }} {{receiver.phone}} {{receiver.address}}</span>
              <el-tag type="danger" size="mini">默认地址</el-tag>
            </div>
            <span class="rec-link">更多地址<i class="el-icon-arrow-down"></i></span>
          </div>
          <div class="pay-method">
            <div class="pay-title">支付方式</div>
            <div class="pay-ways">
              <span :class="onlineClass" @click="activeChange(0)">在线付款</span>
              <span :class="deliverClass" @click="activeChange(1)">货到付款</span>
              <span class="el-dropdown-link">更多<i class="el-icon-d-arrow-right"></i></span>
            </div>
          </div>
          <div class="order-info">
            <div class="order-title">确定订单信息</div>
            <div class="order-item" v-for="list in orderList" :key="list.id">
              <div class="item-img">
                <img width="56" height="56" :src="list.img_url"/></div>
              <div class="item-title">
                <div>{{ list.title }}</div>
                <div style="color: #999999">{{list.description}}</div>
              </div>
              <div class="item-price" style="font-weight: 700;">￥{{ list.price }}</div>
              <div class="item-num">x{{list.num}}</div>
              <div class="item-amount" style="color: #e1251b;font-weight: 700;">￥{{ list.price * list.num }}</div>
            </div>
          </div>
        </div>
        <div class="detail">
          <div>总商品金额：<span style="color: #e1251b">￥{{totalPrice| dot }}</span></div>
          <div>运费：免费配送 快递 免邮</div>
          <div>
            <div>应付总金额：<span style="color: #e1251b;font-size: 21px;font-weight: bold;line-height: 30px">￥{{totalPrice|dot }}</span></div>
            <div style="color: #606266;font-size: 12px;line-height: 16px;margin-top: 5px">寄送至：{{receiver.address}}</div>
            <div style="color: #606266;font-size: 12px;line-height: 16px">收货人：{{receiver.name}} {{receiver.phone}}</div>
          </div>
        </div>
          <div><el-link class="topay" @click.native="toPay" :underline="false">提交订单</el-link></div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  data () {
    return {
      ID: '',
      orderList: [
        {
          ID: 'ef71b3ab-21d6-4ab8-b9b9-8e5651b40f76',
          title: '迪奥全新烈艳蓝金单色腮红6.7G 新品',
          description: '哑光#999',
          price: '249.00',
          num: '1',
          img_url: 'http://localhost:5129/upload/dd3027f1c63c05160cd2dd705a380d2c.png'
        }
      ],
      receiver: {
        name: '小橘子',
        phone: '183****5129',
        address: '广东省佛山市南海区狮山镇华南师范大学南海校区(菜鸟驿站)'
      },
      onlineClass: 'checked',
      deliverClass: 'non-checked'
    }
  },
  mounted () {
    this.ID = this.$route.params.ID
  },
  methods: {
    toPay () {
      // :to="{ path:'/pay',query:{'cartIds':0}}"
      this.$router.push({ name: 'payitem', query: { orderID: 202202222146, receiverID: 1 } })
    },
    activeChange (val) {
      if (val === 0) {
        this.onlineClass = 'checked'
        this.deliverClass = 'non-checked'
      } else {
        this.deliverClass = 'checked'
        this.onlineClass = 'non-checked'
      }
    }
  },
  computed: {
    totalPrice () {
      let sum = 0
      for (let i = 0; i < this.orderList.length; i++) {
        sum += this.orderList[i].price * this.orderList[i].num
      }
      return sum
    }
  },
  filters: {
    dot: function (value) {
      if (!value) return '0.00'
      else {
        return value.toFixed(2)
      }
    }
  }
}
</script>

<style scoped>
.pay-view{
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
.order-main{
  border:1px solid #e6e6e6;
  padding: 0 24px;
}
.receiver-info,.pay-method,.order-info,.detail{
  width: 100%;
  border-bottom: 1px solid #e6e6e6;
  font-size: 14px;
  overflow: hidden;
  padding: 18px 0;
}
.receiver-info{
  height: 100px;
}
.pay-method{
  height: 60px;
}
.detail{
  border-bottom: none;
  overflow: hidden;
  text-align: right;
  background-color: #f4f4f4;
  padding: 18px 24px;
  box-sizing: border-box;
  margin-top: 15px;
  line-height: 24px;
}
/*.detail>div{*/
/*  margin: 5px 0;*/
/*}*/
.rec-title>span,.pay-title,.order-title{
  font-weight: 700;
}
.rec-info,.pay-ways{
  padding: 12px 15px 10px;
  display: flex;
  color: #606266;
}
.rec-info>span{
  display: inline-block;
  margin: auto 0;
}
.checked{
  padding: 5px;
  border: 2px solid #e1251b;
}
.non-checked{
  padding: 5px;
  border: 2px solid transparent;
}
.pay-ways>span{
  display: inline-block;
  margin: auto 10px auto 0;
  cursor: pointer;
}
.rec-link{
  padding-left: 15px;
  color: #606266;
  cursor: pointer;
}
.non-checked{
  border: 2px solid transparent;
}
.el-dropdown-link{
  cursor: pointer;
}
.el-dropdown-link:hover,
.el-dropdown-link:hover .el-icon-d-arrow-right{
  color: #e1251b;
  text-decoration: underline;
}
.order-item{
  width: 100%;
  height: 80px;
  display: flex;
  margin: 5px 0;
  overflow: hidden;
  background-color: #fafafa;
}
.item-title{
  flex: 1;
  margin: auto;
}
.item-price,.item-num,.item-amount{
  flex: 0 0 110px;
  margin: auto 0;
  line-height: 1;
  text-align: center;
}
.item-img{
  flex: 0 0 90px;
  margin: auto;
}

.topay{
  display: inline-block;
  width: 136px;
  line-height: 40px;
  border-radius: 3px;
  font-size: 18px;
  text-align: center;
  height: 40px;
  background-color: #e1251b;
  color: #FFFFFF;
  font-weight: bold;
  float: right;
  margin: 18px 24px;
}
.topay:hover{
  color: #FFFFFF;
  background: rgba(225,37,27,.9);
}
</style>
