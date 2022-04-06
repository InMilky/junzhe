<template>
  <div class="cart-container">
    <CartHeader :search="keyword" @search="searchItem" :title="title"></CartHeader>
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
              <div class="cart-item" v-for="list in cartList" :key="list.ID">
                <input type="checkbox" class="el-checkbox__inner goods-checkbox" v-model="checkGoods" :value="list.ID" />
                <div class="goods-img">
                  <img :src="list.img_url"/></div>
                <div class="goods-info">
                  <div>{{ list.title }}</div>
                  <div style="color: #999999">{{list.color}}</div>
                </div>
                <div class="goods-price" style="font-weight: 700;">￥{{ list.price|dot }}</div>
                <div class="goods-num">
                  <el-input-number v-model="list.quantity" :min="1" :max="9999" @change="numChange(list.ID,list.quantity)" size="mini"></el-input-number>
                </div>
                <div class="goods-amount" style="color: #e1251b;font-weight: 700;">￥{{ list.price * list.quantity|dot }}</div>
                <div class="goods-action">
                  <a href="javascript:void(0)" @click="delItem(list.ID)">删除</a>
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
              <span>总价:<span style="color: #e1251b">￥</span><span class="amount">{{totalPrice|dot}}</span></span>
              <el-link class="topay" @click="toOrder" :underline="false">去结算</el-link>
              </div></el-col>
          </el-row>
        </div>
      </div>
    </el-col></el-row>
    <el-divider> END </el-divider>
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
      title: '购物车',
      keyword: '',
      account: '',
      checkAll: false,
      checkedCount: 0,
      checkGoods: [],
      cartList: []
    }
  },
  async mounted () {
    await this.getCart()
  },
  watch: {
    // 单选checkbox 自动将checkbox中的value纳入数组
    checkGoods: function (e) {
      this.checkAll = this.checkGoods.length === this.cartList.length
      this.checkedCount = e.length
    }
  },
  methods: {
    searchItem (key) {
      this.keyword = key
      this.$router.replace({ name: 'list_item', query: { key: key } })
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
    },
    chooseAll () {
      if (this.checkAll) {
        this.checkGoods.length = 0
        this.cartList.forEach((item) => {
          this.checkGoods.push(item.ID)
        })
        this.checkedCount = this.checkGoods.length
      } else {
        this.checkGoods = []
        this.checkedCount = 0
      }
    },
    getCart () {
      this.$axios.get('/cart/getCart').then(res => {
        if (res.status === 200) {
          res.data = res.data.map((item) => {
            item.img_url = SERVER_HOST + item.img_url
            return item
          })
          this.cartList = res.data
          // 默认全选
          this.checkAll = true
          this.chooseAll()
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    numChange (cartID, num) { // 更新购物车商品数量
      this.$axios.get('/cart/updateQuantity', { params: { cart_id: cartID, num: num } })
    },
    delChosed () {
      this.$confirm('确定从购物车中移除选中的商品吗？', '', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'cancelbtn',
        confirmButtonClass: 'confirmbtn',
        type: 'warning',
        center: true
      }).then(() => {
        const chosedlist = this.checkGoods
        const goodslist = this.cartList
        for (let i = 0, j = 0; i < chosedlist.length; i++) {
          while (j < goodslist.length) {
            if (chosedlist[i] === goodslist[j].ID) {
              goodslist.splice(j, 1)
              j = 0
              break
            } else {
              j++
            }
          }
        }
        this.cartList = goodslist
        this.checkGoods = []
        this.checkedCount = 0
        this.$axios.get('/cart/deleteCartItem', { params: { carts_id: chosedlist } })
      })
    },
    delItem (id) {
      this.$confirm('确定从购物车中移除该商品吗？', '', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'cancelbtn',
        confirmButtonClass: 'confirmbtn',
        type: 'warning',
        center: true
      }).then(() => {
        const goodslist = this.cartList
        const chosedlist = this.checkGoods
        const index = goodslist.findIndex(function (val) {
          return val.ID === id
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
        this.$axios.get('/cart/deleteCartItem', { params: { carts_id: [id] } })
      })
    },
    toOrder () {
      if (this.checkGoods.length <= 0) {
        this.$alert('请至少选中一个商品下单', '商品下单', {
          confirmButtonText: '确定',
          confirmButtonClass: 'confirmbtn'
        })
      } else {
        this.$router.push({ name: 'payorder', query: { ID: this.checkGoods, account: this.account } })
      }
    }
  },
  computed: {
    totalPrice () {
      let sum = 0
      this.checkGoods.forEach(item => {
        this.cartList.forEach(cartItem => {
          if (item === cartItem.ID) {
            sum += cartItem.price * cartItem.quantity
          }
        })
      })
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      this.account = sum
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
  },
  components: {
    CartHeader,
    RecommendTemp
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
.cart-tbody{
  width: 100%;
  font-size: 14px;
  color: #606266;
}
.cart-item{
  width: 100%;
  height: 80px;
  display: flex;
  margin: 5px 0;
  overflow: hidden;
  border-bottom: 1px solid #e6e6e6;
}
.cart-checkbox{
  flex: 0 0 80px;
  padding-left: 15px;
}

.goods-info{
  flex: 1;
  margin: auto 0;
}

.goods-price,.goods-num,.goods-amount,.goods-action,.goods-img{
  flex: 0 0 110px;
  margin: auto 0;
  line-height: 1;
  text-align: center;
}
.goods-action,.goods-img{
  flex: 0 0 90px;
}
.goods-img>img{
  height: 56px;
  width: auto;
  margin: 0 auto;
}
.goods-action>a{
  display: inline-block;
  margin: auto;
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
  margin: 50px auto 10px;
}
/deep/ .el-divider__text {
  background-color: #fff;
  color: #dddddd;
  font-size: 18px;
}
/deep/ .el-input-number--mini {
  width: 90px;
}
</style>
