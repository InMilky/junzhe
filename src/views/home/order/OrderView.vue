<template>
  <div class="order-container">
    <CartHeader :search="search" :title="title"></CartHeader>
    <el-row type="flex" justify="center"><el-col :span="20">
    <div class="order">
      <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~" v-if="orderList.length==0">
        <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
      </el-empty>
      <div v-else>
        <el-tabs v-model="activeName" type="border-card">
          <el-tab-pane name="全部订单" label="全部订单">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <div class="order-item" v-for="item in orderList" :key="item.orderID">
                <div class="o-head">
                  <span style="font-weight: 700">订单号：{{item.orderID}}</span>
                  <span>下单时间：{{item.order_time}}</span> </div>
                <div class="o-body">
                  <div class="o-img">
                  <img style="width:94px;max-height: 100%;" :src="item.img_url"/></div>
                  <div class="o-title">{{item.title}}--{{item.description}}</div>
                  <div class="o-price">￥{{item.price}}</div>
                  <div class="o-num">{{item.num}}</div>
                  <div class="o-total red">￥{{item.totalPrice}}</div>
                  <div class="o-state">{{item.paystate}}</div>
                  <div class="o-action">评论</div>
                </div>
              </div>
              <el-pagination
                background
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page.sync="currentPage"
                :page-size="10"
                layout="prev, pager, next, jumper"
                :total="51" style="float: right;">
              </el-pagination>
            </div>
          </el-tab-pane>
          <el-tab-pane name="待付款" label="待付款">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
          <el-tab-pane name="待发货" label="待发货">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单~" v-if="orderList.length===0">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
              <div class="order-item" v-for="list in orderList" :key="list.orderID" v-else>
                <div class="o-head">
                  <span style="font-weight: 700">订单号：{{list.orderID}}</span>
                  <span>下单时间：{{list.order_time}}</span> </div>
                <div class="o-body">
                  <div class="o-img">
                    <img style="width:94px;max-height: 100%;" :src="list.img_url" /></div>
                  <div class="o-title">{{list.title}}--{{list.description}}</div>
                  <div class="o-price">￥{{list.price}}</div>
                  <div class="o-num">{{list.num}}</div>
                  <div class="o-total red">￥{{list.totalPrice}}</div>
                  <div class="o-state">{{list.paystate}}</div>
                  <div class="o-action">评论</div>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane name="待收货" label="待收货">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
          <el-tab-pane name="评价" label="评价">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单哦~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
    </el-col></el-row>
    <RecommendTemp></RecommendTemp>
  </div>
</template>

<script>

import CartHeader from '@/components/home/topfooter/CartHeader'
import RecommendTemp from '@/components/home/recommand/RecommendTemp'

export default {
  data () {
    return {
      title: '订单',
      search: '',
      activeName: '待发货',
      orderList: [
        {
          orderID: '20220222-051129',
          itemID: 'ef71b3ab-21d6-4ab8-b9b9-8e5651b40f76',
          title: '迪奥全新烈艳蓝金单色腮红6.7G 新品',
          description: '哑光#999',
          price: '249.00',
          num: '1',
          totalPrice: '249.00',
          paystate: '待发货',
          img_url: 'http://localhost:5129/upload/dd3027f1c63c05160cd2dd705a380d2c.png',
          order_time: '2022-03-17 17:11:29'
        }],
      currentPage: 1
    }
  },
  methods: {
    handleSizeChange () {

    },
    handleCurrentChange () {

    }
  },
  components: {
    CartHeader,
    RecommendTemp
  }
}
</script>
<style scoped>
@import "../../../assets/css/index.css";
.order-container{
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.order{
  width: 100%;
  margin-top: 30px;
}
.order-lists{
  width: 100%;
  overflow: hidden;
}
.order-header{
  width: 100%;
  height: 36px;
  line-height: 36px;
  background-color: #e6e6e6;
  color: #606266;
  font-size: 14px;
  text-align: center;
  display: flex;
}
.o-info{
  flex: 1;
  height: 100%;
  margin: auto;
}
.order-item{
  height: 150px;
  border: 1px solid #e6e6e6;
  color: #606266;
  font-size: 14px;
  display: flex;
  flex-direction: column;
  margin: 10px 0;
}
.order-item:hover{
  border: 1px solid #666666;
}
.o-head{
  flex:0 0 36px;
  background-color: #e6e6e6;
  padding: 0 10px;
  display: flex;
  overflow: hidden;
}
.o-head>span{
  margin: auto 20px auto 0;
  display: inline-block;
}
.o-body{
  flex: 1;
  padding: 10px;
  overflow: hidden;
  display: flex;
  text-align: center;
}
.o-img{
  width: 12%;
  height: 100%;
}
.o-title{
  flex: 1;
}
.o-title:hover{
  color: #e1251b;
}
.o-price{
  width: 10%;
}
.o-num{
  width: 5%;
}
.o-total{
  width: 12%;
}
.o-total.red{
  font-weight: 700;
  color: #e1251b;
}
.o-state,.o-action{
  width: 10%;
}
/deep/ .el-divider--horizontal {
  width: 30%;
  text-align: center;
  margin: 36px auto;
}
/deep/ .el-divider__text {
  background-color: #fff;
  color: #dddddd;
  font-size: 18px;
}
/deep/ .el-tabs--border-card>.el-tabs__header .el-tabs__item:not(.is-disabled):hover {
  color: #e1251b;
}
/deep/ .el-tabs--border-card>.el-tabs__header .el-tabs__item.is-active {
   color: #e1251b;
 }
/deep/ .el-pagination.is-background .el-pager li {
  font-weight: normal;
}
/deep/ .el-pagination.is-background .el-pager li.active {
  background-color: #e1251b;
  color: #FFF;
  cursor: default;
}
/deep/ .el-pagination.is-background .el-pager li:hover {
   color: #e1251b;
 }
/deep/ .el-pagination.is-background .el-pager li.active:hover {
   color: #FFFFFF;
 }
/deep/ .el-input__inner:focus {
  border: 1px solid #e1251b;
}
</style>
