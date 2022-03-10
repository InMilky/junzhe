<template>
  <div class="re-temp">

    <!--  为你推荐  -->
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <div id="recommand" class="recommand">
          <div class="re-title">猜你喜欢</div>
          <div class="re-more">
            <div class="re-item" v-for="(item,index) in recommendList" :key="index">
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
      </el-col>
    </el-row>

  </div>
</template>

<script>
export default {
  data () {
    return {
      recommendList: [
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
        { title: '依波路(ERNEST BOREL)瑞士手表原装进口男自动机械手表方盘皮带传奇系列男表 GS1856S-E251BK', price: '324', soldnum: '99', imgurl: require('@/assets/img/recommond/re12.png'), href: '/' }
      ]
    }
  },
  methods: {}
}
</script>

<style scoped>
.re-temp{
  width: 100%;
  overflow: hidden;
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
