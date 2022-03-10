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
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <div class="order-item" v-for="item in orderList" :key="item.orderID">
                <div class="o-head">
                  <span style="font-weight: 700">订单号：{{item.orderID}}</span>
                  <span>下单时间：{{item.order_time}}</span> </div>
                <div class="o-body">
                  <div class="o-img">
                  <img width="56" height="56" src="../../../assets/img/seckill/seckill-item10.png"/></div>
                  <div class="o-title">{{item.title}}--{{item.description}}</div>
                  <div class="o-price">￥{{item.price}}</div>
                  <div class="o-num">{{item.num}}</div>
                  <div class="o-total">￥{{item.totalPrice}}</div>
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
                <div class="o-total" style="font-weight: normal">实付款</div>
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
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单~" v-if="orderList.length===0">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
              <div class="order-item" v-for="i in 3" :key="orderList[i].orderID" v-else>
                <div class="o-head">
                  <span style="font-weight: 700">订单号：{{orderList[i].orderID}}</span>
                  <span>下单时间：{{orderList[i].order_time}}</span> </div>
                <div class="o-body">
                  <div class="o-img">
                    <img width="56" height="56" src="../../../assets/img/seckill/seckill-item10.png"/></div>
                  <div class="o-title">{{orderList[i].title}}--{{orderList[i].description}}</div>
                  <div class="o-price">￥{{orderList[i].price}}</div>
                  <div class="o-num">{{orderList[i].num}}</div>
                  <div class="o-total">￥{{orderList[i].totalPrice}}</div>
                  <div class="o-state">{{orderList[i].paystate}}</div>
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
                <div class="o-total" style="font-weight: normal">实付款</div>
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
                <div class="o-total" style="font-weight: normal">实付款</div>
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
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1',
          totalPrice: '3649.00',
          paystate: '待发货',
          order_time: '2022-02-22 05:11:29'
        },
        {
          orderID: '20211028-051129',
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1',
          totalPrice: '3649.00',
          paystate: '待发货',
          order_time: '2021-10-28 05:11:29'
        },
        {
          orderID: '20210813-051129',
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1',
          totalPrice: '3649.00',
          paystate: '待发货',
          order_time: '2021-08-13 05:11:29'
        },
        {
          orderID: '20210520-051129',
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1',
          totalPrice: '3649.00',
          paystate: '已发货',
          order_time: '2021-05-20 05:11:29'
        },
        {
          orderID: '20210504-051129',
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '51.00',
          num: '3',
          totalPrice: '153.00',
          paystate: '已评论',
          order_time: '2021-05-04 05:11:29'
        }
      ],
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
  font-weight: 700;
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
