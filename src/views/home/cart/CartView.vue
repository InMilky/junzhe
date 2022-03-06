<template>
  <div class="cart-container">
    <TopNav></TopNav>
    <CartHeader :search="search" :title="title"></CartHeader>
    <el-row type="flex" justify="center"><el-col :span="20">
      <div class="cart">
        <el-empty description="购物车空空的哦~，去看看心仪的商品吧~" v-if="cartList.length==0">
          <router-link :underline="false" to="/index" style="color: #e1251b;font-size: 14px">去购物></router-link>
        </el-empty>
        <div class="cart-list" v-else>
          <div class="cart-thead">
            <div class="cart-checkbox"><input type="checkbox" class="el-checkbox__inner"
                   v-model="checkAll" id="all"  @change="chooseAll"/>
            <label for="all" style="position: relative;top: -2px;padding-left: 2px">全选</label></div>
            <div class="goods-info">商品</div>
            <div class="goods-price">单价</div>
            <div class="goods-num">数量</div>
            <div class="goods-amount">小计</div>
            <div class="goods-action">操作</div>
          </div>
          <div class="cart-tbody">
              <div class="cart-item" v-for="list in cartList" :key="list.id">
                <input type="checkbox" class="el-checkbox__inner goods-checkbox" v-model="checkGoods" :value="list.id" />
                <div class="goods-img">
                  <img width="56" height="56" src="../../../assets/img/seckill/seckill-item10.png"/></div>
                <div class="goods-info">{{ list.title }} - {{list.description}}</div>
                <div class="goods-price">￥{{ list.price }}</div>
                <div class="goods-num">
                  {{list.num}}
<!--                  <input v-model.number="list.num" type="number" value="list.num" />-->
                </div>
                <div class="goods-amount">{{ list.price * list.num }}</div>
                <div class="goods-action">
                  <a href="javascrip:void(0)" @click="delItem(list.id)">删除</a>
                </div>
              </div>
          </div>
          <el-row type="flex" justify="space-between" class="cart-tfoot">
            <el-col :span="10" style="overflow: hidden">
              <div class="cart-checkbox" style="float: left">
                <input type="checkbox" class="el-checkbox__inner" v-model="checkAll" id="chooseAll" @change="chooseAll"/>
                <label for="chooseAll" style="position: relative;top: -2px;padding-left: 2px">全选</label>
              </div>&nbsp;
              <span @click="delChosed" class="delchoose">删除选中商品({{checkedCount}})</span>
            </el-col>
            <el-col :span="10">
              <div style="float: right">
              <span>总价:<span class="amount">￥{{amount|tofixed}}</span></span>
              <el-link class="topay" @click="toOrder" :underline="false">去结算</el-link>
              </div></el-col>
          </el-row>
        </div>
      </div>
    </el-col></el-row>
    <!--  为你推荐  -->
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
       <div id="recommand" class="recommand">
        <div class="re-title">猜你喜欢</div>
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
      title: '购物车',
      checkAll: true,
      checkedCount: 0,
      checkGoods: [],
      amount: 0,
      cartList: [
        {
          id: 'p0001',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '1'
        },
        {
          id: 'p0002',
          title: '小米12 小米手机 5G手机 新品手机 120Hz高刷 骁龙8 Gen1',
          description: '8GB+128GB 黑色 官方标配',
          price: '3649.00',
          num: '2'
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
  mounted () {
    if (this.checkAll) {
      this.checkGoods.length = 0
      for (let i = 0; i < this.cartList.length; i++) {
        this.checkGoods.push(this.cartList[i].id)
      }
      this.checkedCount = this.checkGoods.length
    } else {
      this.checkGoods = []
      this.checkedCount = 0
      this.amount = 0
    }
  },
  watch: {
    checkGoods: function (e) {
      this.amount = 0
      this.checkAll = this.checkGoods.length === this.cartList.length
      this.checkedCount = this.checkGoods.length
      if (e) {
        for (let i = 0; i < e.length; i++) {
          for (let j = 0; j < this.cartList.length; j++) {
            if (e[i] === this.cartList[j].id) {
              this.amount += this.cartList[j].price * this.cartList[j].num
            }
          }
        }
      } else {
        this.amount = 0
      }
    }
  },
  methods: {
    search () {},
    chooseAll () {
      if (this.checkAll) {
        this.checkGoods.length = 0
        for (let i = 0; i < this.cartList.length; i++) {
          this.checkGoods.push(this.cartList[i].id)
        }
        this.checkedCount = this.checkGoods.length
      } else {
        this.checkGoods = []
        this.checkedCount = 0
        this.amount = 0
      }
    },
    delChosed () {
      const chosedlist = this.checkGoods
      const goodslist = this.cartList
      for (let i = 0, j = 0; i < chosedlist.length; i++) {
        while (j < goodslist.length) {
          if (chosedlist[i] === goodslist[j].id) {
            goodslist.splice(j, 1)
            j = 0; break
          } else {
            j++
          }
        }
      }
      this.cartList = goodslist
      this.checkGoods = []
      this.checkedCount = 0
    },
    delItem (id) {
      const goodslist = this.cartList
      const chosedlist = this.checkGoods
      const index = goodslist.findIndex(function (val) {
        return val.id === id
      })
      if (index !== -1) {
        this.cartList.splice(index, 1)
      }
      const index2 = chosedlist.findIndex(function (val) {
        return val === id
      })
      if (index2 !== -1) {
        this.checkGoods.splice(index, 1)
      }
    },
    toOrder () {
    // :to="{ path:'/pay',query:{'cartIds':0}}"
      if (this.checkGoods.length <= 0) {
        this.$alert('请至少选中一个商品下单', '商品下单', {
          confirmButtonText: '确定'
        })
      } else {
        this.$message.success('下单成功')
      }
    }
  },
  filters: {
    tofixed: function (value) {
      if (!value) return '0.00'
      else {
        return value.toFixed(2)
      }
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
.cart-container{
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.cart{
  width: 100%;
  margin-top: 20px;
}
.cart-list{
  width: 100%;
}
/* 购物车头部信息 */
.cart-thead{
  width: 100%;
  height: 42px;
  background-color: #e6e6e6;
  display: flex;
  font-size: 14px;
  color: #606266;
}
.cart-tfoot{
  width: 100%;
  height: 56px;
  display: flex;
  font-size: 14px;
  color: #606266;
  border-top: 1px solid #e6e6e6;
  border-bottom: 1px solid #e6e6e6;
}
.cart-thead>div,.cart-tfoot>div{
  margin: auto 0;
}
.cart-checkbox{
  flex: 0 0 80px;
  padding-left: 15px;
}
.goods-info{
  flex: 1;
  margin: auto 0;
  line-height: 1;
}
.goods-price,.goods-num,.goods-amount,.goods-action,.goods-img{
  flex: 0 0 100px;
  margin: auto 0;
  line-height: 1;
  text-align: center;
}
.cart-tbody{
  width: 100%;
}
.cart-item{
  width: 100%;
  height: 80px;
  display: flex;
  margin: 5px 0;
  border-bottom: 1px solid #e6e6e6;
}
.cart-item:last-child{
  border-bottom: 0;
}
.goods-checkbox{
  flex: 0 0 auto;
  margin: auto 10px auto 18px;
}
.delchoose{
  cursor: pointer
}
.delchoose:hover{
  color: #e1251b;
}
.amount{
  color: #e1251b;
  font-weight: bold;
  font-size: 18px;
}
.topay{
  display: inline-block;
  width: 100px;
  line-height: 56px;
  text-align: center;
  height: 100%;
  background-color: #e1251b;
  color: #FFFFFF;
  font-size:20px;
  font-weight: bold;
  margin-left: 10px;
}
/deep/ .el-link.el-link--default:hover {
  color: #FFFFFF;
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
  line-height: 30px;
  padding-left: 10px;
  margin: 20px 0;
  border-left: 5px solid #e1251b;
}
.re-item{
  border: 1px solid #dddddd;
}
.re-item:hover{
  border: 1px solid #e1251b;
}

.re-link:hover .re-img img{
  opacity:0.8;
  transform: scale(1,1);
}

</style>
