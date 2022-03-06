<template>
  <div class="order-container">
    <TopNav></TopNav>
    <CartHeader :search="search" :title="title"></CartHeader>
    <el-row type="flex" justify="center"><el-col :span="20">
    <div class="order">
      <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~" v-if="orderList.length==0">
        <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
      </el-empty>
      <div v-else>
        <el-tabs type="border-card">
          <el-tab-pane label="全部订单">
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
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page.sync="currentPage"
                :page-size="10"
                layout="prev, pager, next, jumper"
                :total="51">
              </el-pagination>
            </div>
          </el-tab-pane>
          <el-tab-pane label="待付款">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
          <el-tab-pane label="待发货">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
          <el-tab-pane label="待收货">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
          <el-tab-pane label="评价">
            <div class="order-lists">
              <div class="order-header">
                <div class="o-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total" style="font-weight: normal">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
    </el-col></el-row>
    <!--  为你推荐  -->
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <div id="recommand" class="recommand">
          <span class="re-title">热门推荐</span>
          <div class="re-more">
            <div class="re-item" v-for="(item,index) in recommondList" :key="index">
              <a href="javascript:void(0)" class="re-link">
                <div class="re-img">
                  <img :src="item.imgurl" :alt="item.title">
                </div>
                <div class="re-info">
                  <p class="re-info-name">{{ item.title }}</p>
                  <div class="re-info-price">
                    <i>￥</i>
                    <span class="re-info-price-txt">{{ item.price }}.<span class="re-info-price-decimal">00</span></span>
                    <span class="re-sales">已售{{ item.soldnum }}件</span>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
        <el-divider> END </el-divider>
      </el-col>
    </el-row>
    <FooterView></FooterView>
  </div>
</template>

<script>

import TopNav from '@/components/home/topfooter/TopNav'
import CartHeader from '@/components/home/topfooter/CartHeader'
import FooterView from '@/components/home/topfooter/FooterView'

export default {
  data () {
    return {
      title: '订单',
      orderList: [
        {
          orderID: '20220222-051129',
          itemID: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1',
          totalPrice: '3649.00',
          paystate: '已发货',
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
          paystate: '已发货',
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
          paystate: '已发货',
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
      recommondList: [
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '1640', soldnum: '99', imgurl: require('@/assets/img/recommond/re01.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '511', soldnum: '99', imgurl: require('@/assets/img/recommond/re02.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '1129', soldnum: '99', imgurl: require('@/assets/img/recommond/re03.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '2146', soldnum: '99', imgurl: require('@/assets/img/recommond/re04.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '5129', soldnum: '99', imgurl: require('@/assets/img/recommond/re05.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '1929', soldnum: '99', imgurl: require('@/assets/img/recommond/re06.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '330', soldnum: '99', imgurl: require('@/assets/img/recommond/re07.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '15', soldnum: '99', imgurl: require('@/assets/img/recommond/re08.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '327', soldnum: '99', imgurl: require('@/assets/img/recommond/re09.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '54', soldnum: '99', imgurl: require('@/assets/img/recommond/re10.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '222', soldnum: '99', imgurl: require('@/assets/img/recommond/re11.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '324', soldnum: '99', imgurl: require('@/assets/img/recommond/re12.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '528', soldnum: '99', imgurl: require('@/assets/img/recommond/re01.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '603', soldnum: '99', imgurl: require('@/assets/img/recommond/re02.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '603', soldnum: '99', imgurl: require('@/assets/img/recommond/re04.png'), href: '/' },
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '1640', soldnum: '99', imgurl: require('@/assets/img/recommond/re03.png'), href: '/' }
      ]
    }
  },
  methods: {
    handleSizeChange () {

    },
    handleCurrentChange () {

    },
    currentPage () {

    }
  },
  components: {
    TopNav,
    CartHeader,
    FooterView
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
  width: 100%;
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
/* recommond */
.re-title{
  color: #e1251b;
  font-size: 18px;
  line-height: 33px;
  margin: 20px 0;
  border-bottom: 2px solid #e1251b;
  padding: 5px 5px 0;
  display: inline-block;
}
.re-item{
  border: 1px solid #dddddd;
}
.re-item:hover{
  border: 1px solid #e1251b;
}
.re-link:hover .re-img img {
  opacity: 1;
  transform: scale(1, 1);
}
</style>
