<template>
  <div class="cart-container">
    <TopNav></TopNav>
    <CartHeader :search="search" :title="title"></CartHeader>
    <div class="cart">

    </div>
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
    search () {

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
  height: 1000px;background: #99a9bf;
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
  color: #333333;
  font-size: 18px;
  line-height: 30px;
  padding-left: 10px;
  margin: 20px 0;
  border-left: 5px solid #333333;
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
