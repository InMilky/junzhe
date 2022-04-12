<template>
  <div class="order-container">
    <CartHeader :search="keyword" @search="searchItem"  :title="title"></CartHeader>
    <el-row type="flex" justify="center"><el-col :span="20">
    <div class="order">
      <el-empty description="最近没有下过订单哦~，去看看心仪的商品吧~" v-if="orderList.length===0 && emptyFlag === 1">
        <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
      </el-empty>
      <div v-else>
        <el-tabs v-model="activeName" type="border-card">
          <el-tab-pane name="全部订单" label="全部订单">
            <div class="order-lists">
              <div class="order-header">
                <div class="oitem-info">宝贝</div>
                <div class="o-price">单价</div>
                <div class="o-num">数量</div>
                <div class="o-total">实付款</div>
                <div class="o-state">交易状态</div>
                <div class="o-action">交易操作</div>
              </div>
              <el-empty description="你还没有相关订单~" v-if="orderList.length===0 && flag===2">
                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>
              </el-empty>
              <div class="order-item" v-for="(item,key) in orderList" :key="key" v-loading="flag===0">
                <div class="o-head">
                  <div><span style="font-weight: 700;margin-right: 20px">订单号：{{item.ID}}</span>
                  <span>下单时间：{{item.ordertime}}</span></div>
                  <div class="delbtn" @click="deleteOrder(item.ID)"><i class="el-icon-delete"></i></div>
                </div>
                <div class="o-body">
                  <div class="oitem-info">
                    <div class="oinfo-item" v-for="(temp,index) in item.info" :key="index">
                      <div class="o-img"><img :src="temp.img_url"/></div>
                      <div class="o-title">
                        <p>{{temp.title}}</p>
                        <p style="color: #999999;font-size: 13px">{{temp.color}}</p></div>
                      <div class="o-price">￥{{temp.price}}</div>
                      <div class="o-num">{{temp.quantity}}</div>
                    </div>
                  </div>
                  <div class="o-total red">￥{{item.account}}</div>
                  <div class="o-state">{{payState[item.pay_state]}}</div>
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
<!--          <el-tab-pane name="待付款" label="待付款">-->
<!--            <div class="order-lists">-->
<!--              <div class="order-header">-->
<!--                <div class="o-info">宝贝</div>-->
<!--                <div class="o-price">单价</div>-->
<!--                <div class="o-num">数量</div>-->
<!--                <div class="o-total">实付款</div>-->
<!--                <div class="o-state">交易状态</div>-->
<!--                <div class="o-action">交易操作</div>-->
<!--              </div>-->
<!--              <el-empty description="你还没有相关订单~">-->
<!--                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>-->
<!--              </el-empty>-->
<!--            </div>-->
<!--          </el-tab-pane>-->
<!--          <el-tab-pane name="待发货" label="待发货">-->
<!--            <div class="order-lists">-->
<!--              <div class="order-header">-->
<!--                <div class="o-info">宝贝</div>-->
<!--                <div class="o-price">单价</div>-->
<!--                <div class="o-num">数量</div>-->
<!--                <div class="o-total">实付款</div>-->
<!--                <div class="o-state">交易状态</div>-->
<!--                <div class="o-action">交易操作</div>-->
<!--              </div>-->
<!--              <el-empty description="你还没有相关订单~" v-if="orderList.length===0">-->
<!--                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>-->
<!--              </el-empty>-->
<!--              <div class="order-item" v-for="list in orderList" :key="list.orderID" v-else>-->
<!--                <div class="o-head">-->
<!--                  <span style="font-weight: 700">订单号：{{item.ID}}</span>-->
<!--                  <span>下单时间：{{item.ordertime}}</span> </div>-->
<!--                <div class="o-body">-->
<!--                  <div class="o-img">-->
<!--                    <img style="width:94px;max-height: 100%;" :src="item.info[0].img_url"/></div>-->
<!--                  <div class="o-title">-->
<!--                    <p>{{item.info[0].title}}</p>-->
<!--                    <p>{{item.info[0].color}}</p></div>-->
<!--                  <div class="o-price">￥{{item.info[0].price}}</div>-->
<!--                  <div class="o-num">{{item.info[0].quantity}}</div>-->
<!--                  <div class="o-total red">￥{{item.account}}</div>-->
<!--                  <div class="o-state">{{payState[item.pay_state]}}</div>-->
<!--                  <div class="o-action">评论</div>-->
<!--                </div>-->
<!--              </div>-->
<!--            </div>-->
<!--          </el-tab-pane>-->
<!--          <el-tab-pane name="待收货" label="待收货">-->
<!--            <div class="order-lists">-->
<!--              <div class="order-header">-->
<!--                <div class="o-info">宝贝</div>-->
<!--                <div class="o-price">单价</div>-->
<!--                <div class="o-num">数量</div>-->
<!--                <div class="o-total">实付款</div>-->
<!--                <div class="o-state">交易状态</div>-->
<!--                <div class="o-action">交易操作</div>-->
<!--              </div>-->
<!--              <el-empty description="你还没有相关订单~">-->
<!--                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>-->
<!--              </el-empty>-->
<!--            </div>-->
<!--          </el-tab-pane>-->
<!--          <el-tab-pane name="评价" label="评价">-->
<!--            <div class="order-lists">-->
<!--              <div class="order-header">-->
<!--                <div class="o-info">宝贝</div>-->
<!--                <div class="o-price">单价</div>-->
<!--                <div class="o-num">数量</div>-->
<!--                <div class="o-total">实付款</div>-->
<!--                <div class="o-state">交易状态</div>-->
<!--                <div class="o-action">交易操作</div>-->
<!--              </div>-->
<!--              <el-empty description="你还没有相关订单哦~">-->
<!--                <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去首页逛逛></router-link>-->
<!--              </el-empty>-->
<!--            </div>-->
<!--          </el-tab-pane>-->
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
import { SERVER_HOST } from '@/plugins/config'

export default {
  data () {
    return {
      title: '订单',
      keyword: '',
      flag: 0, // 0-loading,1-list,2-empty
      activeName: '全部订单',
      payState: ['已取消', '待付款', '待发货', '运输中', '已签收', '已评价'],
      orderList: [{ ID: 1 }],
      currentPage: 1
    }
  },
  async mounted () {
    await this.getOrderList()
  },
  methods: {
    getOrderList () {
      this.flag = 0
      this.$axios.get('/order/allOrder')
        .then(res => {
          if (res.status === 200) {
            if (res.data.length > 0) {
              this.flag = 1
              res.data = res.data.map(item => {
                if (item.info) {
                  item.info = item.info.map(info => {
                    info.img_url = SERVER_HOST + info.img_url
                    return info
                  })
                }
                return item
              })
              res.data = res.data.map(it => {
                it.img_url = SERVER_HOST + it.img_url
                return it
              })
            } else {
              this.flag = 2
            }
            this.orderList = res.data
          } else {
            this.flag = 2
          }
        }).catch(err => {
          Promise.reject(err)
        })
    },
    deleteOrder (orderID) {
      this.$confirm('是否确定删除该订单？', '', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'cancelbtn',
        confirmButtonClass: 'confirmbtn',
        type: 'warning',
        center: true
      }).then(() => {
        const index = this.orderList.findIndex(function (val) {
          return val.ID === orderID
        })
        if (index !== -1) {
          this.orderList.splice(index, 1)
        }
        this.$axios.post('/order/deleteOrder', { orderID: orderID })
      })
    },
    handleSizeChange () {

    },
    handleCurrentChange () {

    },
    searchItem (key) {
      this.keyword = key
      this.$router.replace({
        name: 'list_item',
        query: { key: key }
      })
      this.$axios.get('/item/search', { params: { key: key } })
        .then(res => {
          if (res.status === 200) {
            res.data = res.data.map((item) => {
              item.img_url = SERVER_HOST + item.img_url
              return item
            })
            this.item = res.data
            this.emptyMsg = ''
          } else {
            this.item = []
            this.emptyMsg = res.msg
          }
        }).catch(err => {
          Promise.reject(err)
        })
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
  border: 1px solid #e6e6e6;
  color: #606266;
  font-size: 14px;
  margin: 10px 0;
}
.order-item:hover{
  border: 1px solid #666666;
}
.o-head{
  height: 36px;
  background-color: #e6e6e6;
  padding: 0 10px;
  display: flex;
  justify-content: space-between;
  overflow: hidden;
}
.o-head>div{
  margin: auto 20px auto 0;
  display: inline-block;
}
.delbtn:hover{
  color: #e1251b;
}
.o-body{
  padding: 10px;
  overflow: hidden;
  display: flex;
  text-align: center;
}
.oitem-info{
  flex: 6;
  height: 100%;
}
.oinfo-item{
  width: 100%;
  height: 90px;
  display: flex;
  flex-wrap: wrap;
}
.o-img{
  height: 100%;
  width: 20%;
}
.o-img>img{
  max-width:94px;
  max-height: 100%;
  height:auto;
  width: auto;
}
.o-title{
  width: 65%;
  text-align: left;
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
  flex: 1;
  height: 100%;
}
.o-total.red{
  font-weight: 700;
  color: #e1251b;
}
.o-state,.o-action{
  flex: 1;
  height: 100%;
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
</style>
