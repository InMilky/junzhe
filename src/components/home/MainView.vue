<template>
  <div class="mainview">
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <!--  轮播图  -->
        <div class="carousel">
            <el-carousel height="480px">
              <el-carousel-item v-for="item in banner" :key="item.index">
<!--                <h3 class="small">{{ item }}</h3>-->
                <img :src="item.src" :alt="item.index">
              </el-carousel-item>
            </el-carousel>
          </div>
        <!--  秒杀专区  -->
        <div id="seckill" class="miaosha-zone">
            <div class="seckill-area">
              <a href="/seckill" target="_blank" class="seckill-link">
                <div class="countdown-title">秒杀专区</div>
                <div class="qianggou-icon"><i class="el-icon-alarm-clock"></i></div>
                <div class="countdown-desc">距离 <strong>抢购</strong> 开始
                <p><b>还有</b></p>
                </div>
                <div class="countdown-timer">
                  <span class="timer-unit timer-unit-day">00</span>
                  <span class="timer-unit timer-unit-hour">00</span>
                  <span class="timer-unit timer-unit-minute">00</span>
                </div></a>
            </div>
            <div class="slide-list">
              <div class="slide-wrapper">
                <a v-for="item in miaoshaList" :key="item.index"
                   :href="item.href" target="_blank" class="seckill-item-link" >
                  <div class="seckill-item">
                    <div class="seckill-item-img">
                      <img :src="item.imgurl" :alt="item.title"></div>
                    <h6 class="seckill-item-name">{{ item.title }}</h6>
                    <div class="seckill-item-price">
                      <span>￥{{ item.miaosha_price}}</span><span>￥{{item.price}}</span></div>
                  </div>
                </a>

              </div>
            </div>
        </div>
        <!--  每日推荐  -->
        <div id="special" class="special-offer">
            <div class="offer-item">
              <div class="sbox-title">
                <a href="javascript:void(0)" class="sbox-link">
                  <span class="sbox-hit">每日特价</span>
                  <el-button class="more" size="mini" circle>
                    <i class="el-icon-arrow-right"></i> </el-button></a>
              </div>
              <el-tabs v-model="activeName" @tab-click="handleClick">
                <el-tab-pane v-for="list in offerList" :key="list.label" :label="list.label" :name="list.name" class="tab-item">
                  <div class="tab-item-0">
                    <a href="#" class="tab-item-link">
                      <div class="tab-item-img">
                        <img :src="list.imgMain[0].imgurl" :alt="list.imgMain[0].title" /></div>
                      <div class="tab-item-msg">
                        <span class="tab-itemmsg-name">{{ list.imgMain[0].title }}</span>
                        <div class="tab-itemmsg-price">
                          <span class="miaosha-price">￥{{list.imgMain[0].miaosha_price}}</span>
                          <span class="original-price">￥{{list.imgMain[0].price}}</span></div>
                      </div>
                    </a>
                  </div>
                  <div class="tab-item-1">
                    <div class="tab-item-list" v-for="(item,index) in list.imgList" :key="index">
                      <a href="#" class="tab-item-link">
                        <div class="tab-item-img">
                          <img :src="item.imgurl" :alt="item.title" /></div>
                        <div class="tab-item-msg">
                          <span class="tab-itemmsg-name">{{ item.title }}</span>
                          <div class="tab-itemmsg-price">
                            <span class="miaosha-price">￥{{ item.miaosha_price }}</span>
                            <span class="original-price">￥{{ item.price }}</span>
                            <span class="soldnum">已抢<b>{{ item.soldnum }}</b>件</span></div>
                        </div>
                      </a>
                    </div>
                  </div>
                </el-tab-pane>
              </el-tabs>
            </div>
            <div class="offer-item" style="margin-left: 2%">
              <div class="sbox-title">
                <a href="javascript:void(0)" class="sbox-link">
                  <span class="sbox-hit">品牌闪购</span>
                  <el-button class="more" size="mini" circle>
                    <i class="el-icon-arrow-right"></i> </el-button></a>
              </div>
              <div class="brand-item">
                <div class="brand-list" v-for="(item,index) in brandList" :key="index">
                  <a href="javascript:void(0)" class="brand-nav">
                    <div class="brand-logo"><img :src="item.imgurl" :alt="item.name"></div>
                    <p class="brand-name">{{item.name}}</p>
                  </a>
                </div>
                </div>
              </div>
        </div>
        <!--  发现好货  -->
        <div :id="'nicegoods'+i" class="nicegoods" v-for="i in 2" :key="i">
          <div class="nice-nav nice-title">
            <a href="javascript:void(0)" class="nicegoods-link">
              <div class="nicegoods-tit">
                <span class="nicegoods-txt">发现好货</span>
                <el-button class="more" size="mini" circle>
                  <i class="el-icon-arrow-right"></i> </el-button>
              </div></a>
          </div>
          <div class="nice-nav" v-for="(item,index) in niceList" :key="index">
            <a href="javascript:void(0)" target="_blank" class="nice-item-link">
              <div class="nice-item">
                <div class="nice-item-img">
                  <img :src="item.imgurl" :alt="item.name"></div>
                <p class="nice-item-name">{{ item.name }}</p>
                <div class="nice-item-price">￥{{ item.price }}</div>
              </div>
            </a>
          </div>
        </div>
        <!--  为你推荐  -->
        <div id="recommand" class="recommand">
          <div class="recommandtit"><h3>为你推荐</h3></div>
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
  </div>
</template>

<script>
export default {
  props: ['dID'],
  data () {
    return {
      destinationID: this.dID,
      isClick: false,
      banner: [
        { index: 0, src: require('@/assets/img/banner/banner01.png') },
        { index: 1, src: require('@/assets/img/banner/banner02.png') },
        { index: 2, src: require('@/assets/img/banner/banner03.png') },
        { index: 3, src: require('@/assets/img/banner/banner04.png') },
        { index: 4, src: require('@/assets/img/banner/banner05.png') }
      ],
      miaoshaList: [
        { index: 1, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
        { index: 2, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
        { index: 3, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
        { index: 4, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item04.png'), href: '/' },
        { index: 5, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item05.png'), href: '/' },
        { index: 6, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item06.png'), href: '/' },
        { index: 7, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item07.png'), href: '/' },
        { index: 8, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item08.png'), href: '/' },
        { index: 9, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item09.png'), href: '/' }
      ],
      activeName: 'first',
      offerList: [
        {
          name: 'first',
          label: '精选',
          imgMain: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' }
          ],
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item01.png'), href: '/' }
          ]
        },
        {
          name: 'second',
          label: '热销',
          imgMain: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' }
          ],
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item02.png'), href: '/' }
          ]
        },
        {
          name: 'third',
          label: '新品',
          imgMain: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' }
          ],
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', miaosha_price: '16.40', soldnum: '99', imgurl: require('@/assets/img/seckill/seckill-item03.png'), href: '/' }
          ]
        }
      ],
      brandList: [
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand00.webp') },
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand00.webp') },
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand01.webp') },
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand01.webp') },
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand00.webp') },
        { name: '奢品大牌闪购', imgurl: require('@/assets/img/index/brand01.webp') }
      ],
      niceList: [
        { name: '你身上有光我抓来看看阿絮是老温的光', price: '16.40', imgurl: require('@/assets/img/seckill/seckill-item01.png') },
        { name: '你身上有光我抓来看看你是我永远的月光，温柔且强大', price: '511.91', imgurl: require('@/assets/img/seckill/seckill-item09.png') },
        { name: '你身上有光我抓来看看你身上有光我抓来看看', price: '21.46', imgurl: require('@/assets/img/seckill/seckill-item03.png') },
        { name: '无论有多少双手想拉你共沉沦我希望我们山人会一直相信光，永远都在', price: '51.29', imgurl: require('@/assets/img/seckill/seckill-item04.png') }
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
  watch: {
    dID () {
      if (this.dID !== 'top' && this.dID) {
        const des = document.getElementById(this.dID)
        const y = des.offsetTop + 88
        window.scrollTo({
          top: y,
          behavior: 'smooth'
        })
      } else if (this.dID) {
        window.scrollTo({
          top: 0,
          behavior: 'smooth'
        })
      }
    }
  },
  methods: {
    handleClick () {

    }
  },
  components: {
  }
}
</script>

<style scoped>
@import "../../assets/css/index.css";

/deep/ .el-carousel__item{
  background-color: #666666;
}
/deep/ .el-carousel__button {
  width: 10px;
  height: 10px;
  border: none;
  border-radius: 50%;
  margin: 0 5px;
}
/deep/ .el-divider--horizontal {
  width: 30%;
  text-align: center;
  margin: 36px auto;
}
/deep/ .el-divider__text {
  background-color: #f4f4f4;
  color: #dddddd;
  font-size: 18px;
}
/deep/ .el-tabs__nav-wrap::after {
  height: 0;
}
/deep/ .el-tabs__header {
  margin: 0 0 6px;
}
/deep/ .el-tabs__nav-wrap{
  float: right;
  padding: 0 15px;
}
/deep/ .el-tabs__item {
  padding: 0 12px;
}
/deep/ .el-tabs__item.is-active {
  color: #e1251b;
}
/deep/ .el-tabs__item:hover {
   color: #e1251b !important;
 }
/deep/ .el-tabs__active-bar {
  bottom: 6px;
  background-color: #e1251b;
}
/deep/ .el-button {
  border: 1px solid #e1251b;
  color: #e1251b;
  padding: 5px;
  border-radius: 4px;
}
/deep/ .el-button--middle,
/deep/ .el-button--mini.is-circle {
  padding: 1px;
}
/deep/ .el-button .el-icon-arrow-right{
  color: #e1251b
}

/deep/ .sbox-link:hover>.el-button .el-icon-arrow-right{
  color: #FFFFFF;
}
/deep/ .nicegoods-link:hover .el-button .el-icon-arrow-right{
  color: #FFFFFF;
}
/deep/ .el-tabs{
  width: 100%;
  height: 100%;
}
/deep/ .el-tabs__content {
  width: 100%;
  height: 80%;
  text-align: left;
  padding: 15px 13px 0 3px;
}
</style>
