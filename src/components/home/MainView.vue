<template>
  <div class="mainview">
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <!--  轮播图  -->
        <div class="carousel">
            <el-carousel height="480px">
              <el-carousel-item v-for="item in carousel" :key="item.ID" @click.native="toItem(0)" class="banner">
                <img :src="item.img_url" :alt="item.title" :title="item.title">
              </el-carousel-item>
            </el-carousel>
          </div>
        <!--  秒杀专区  -->
        <div id="seckill" class="miaosha-zone">
            <div class="seckill-area">
              <router-link to="/seckill" target="_blank" class="seckill-link">
                <div class="countdown-title">秒杀专区</div>
                <div class="qianggou-icon"><i class="el-icon-alarm-clock"></i></div>
                <div class="countdown-desc">距离 <strong>抢购</strong> 开始
                <p><b>还有</b></p>
                </div>
                <div class="countdown-timer">
                  <span class="timer-unit timer-unit-day">00</span>
                  <span class="timer-unit timer-unit-hour">00</span>
                  <span class="timer-unit timer-unit-minute">00</span>
                </div></router-link>
            </div>
            <div class="slide-list">
              <div class="slide-wrapper">
                <router-link v-for="item in miaoshaList" :key="item.index"
                   :to="item.href" target="_blank" class="seckill-item-link" >
                  <div class="seckill-item">
                    <div class="seckill-item-img">
                      <el-image :src="item.img_url" :alt="item.title" fit="contain" lazy></el-image></div>
                    <h6 class="seckill-item-name">{{ item.title }}</h6>
                    <div class="seckill-item-price">
                      <span>￥{{ item.m_price}}</span><span>￥{{item.price}}</span></div>
                  </div>
                </router-link>

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
                <el-tab-pane v-for="list in offerList" :key="list.label"
                             :label="list.label" :name="list.name" class="tab-item">
                  <div class="tab-item-0" v-if="activeName===list.name">
                    <a href="javascript:void(0)" class="tab-item-link">
                      <div class="tab-item-img">
                        <el-image :src="list.imgMain.img_url" :alt="list.imgMain.title" fit="contain" lazy></el-image>
                      </div>
                      <div class="tab-item-msg">
                        <span class="tab-itemmsg-name">{{ list.imgMain.title }}</span>
                        <div class="tab-itemmsg-price">
                          <span class="miaosha-price">￥{{list.imgMain.m_price}}</span>
                          <span class="original-price">￥{{list.imgMain.price}}</span></div>
                      </div>
                    </a>
                  </div>
                  <div class="tab-item-1" v-if="activeName===list.name">
                    <div class="tab-item-list" v-for="(item,index) in list.imgList" :key="index">
                      <a href="javascript:void(0)" class="tab-item-link">
                        <div class="tab-item-img">
                          <el-image style="padding: 8%;" :src="item.img_url" :alt="item.title" fit="contain" lazy></el-image>
                        </div><div class="tab-item-msg">
                          <span class="tab-itemmsg-name">{{ item.title }}</span>
                          <div class="tab-itemmsg-price">
                            <span class="miaosha-price">￥{{ item.m_price }}</span>
                            <span class="original-price">￥{{ item.price }}</span>
                            <span class="soldnum">已抢<b>{{ item.sold_num }}</b>件</span></div>
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
                    <div class="brand-logo">
                      <el-image style="padding: 10%;margin: 0 auto" :src="item.logo_url" :alt="item.name" fit="contain"  lazy></el-image></div>
                    <p class="brand-name">{{item.name}}</p>
                  </a>
                </div>
                </div>
              </div>
        </div>
        <!--  发现好货  -->
        <div id="nicegoods" class="nicegoods">
          <div class="nice-nav nice-title">
            <a href="javascript:void(0)" class="nicegoods-link">
              <div class="nicegoods-tit">
                <span class="nicegoods-txt">发现好货</span>
                <el-button class="more" size="mini" circle>
                  <i class="el-icon-arrow-right"></i> </el-button>
              </div></a>
          </div>
          <div class="nice-nav" v-for="i in [0,1,2,3]" :key="i">
            <a href="javascript:void(0)" @click="toItem(niceList[i].ID)" class="nice-item-link">
              <div class="nice-item">
                <div class="nice-item-img">
                  <el-image style="padding: 0 5%" :src="niceList[i].img_url" :alt="niceList[i].title" fit="contain" lazy></el-image></div>
                <p class="nice-item-name">{{ niceList[i].title }}</p>
                <div class="nice-item-price">￥{{ niceList[i].price }}</div>
              </div>
            </a>
          </div>
        </div>
        <div id="rnicegoods" class="nicegoods">
          <div class="nice-nav nice-title">
            <a href="javascript:void(0)" class="nicegoods-link">
              <div class="nicegoods-tit">
                <span class="nicegoods-txt">好物推荐</span>
                <el-button class="more" size="mini" circle>
                  <i class="el-icon-arrow-right"></i> </el-button>
              </div></a>
          </div>
          <div class="nice-nav" v-for="i in [4,5,6,7]" :key="i">
            <a href="javascript:void(0)" @click="toItem(niceList[i].ID)" class="nice-item-link">
              <div class="nice-item">
                <div class="nice-item-img">
                  <el-image style="padding: 0 5%" :src="niceList[i].img_url" :alt="niceList[i].title" fit="contain" lazy></el-image></div>
                <p class="nice-item-name">{{ niceList[i].title }}</p>
                <div class="nice-item-price">￥{{ niceList[i].price }}</div>
              </div>
            </a>
          </div>
        </div>
        <!--  为你推荐  -->
        <div id="recommand" class="recommand">
          <div class="recommandtit"><h3>为你推荐</h3></div>
          <div class="re-more">
            <div class="re-item" v-for="(item,index) in recommondList" :key="index">
              <a href="javascript:void(0)" @click="toItem(item.ID)" class="re-link">
                <div class="re-img">
                  <el-image class="el-img" :src="item.img_url" :alt="item.title" lazy></el-image>
                </div>
                <div class="re-info">
                  <p class="re-info-name">{{ item.title }}</p>
                  <div class="re-info-price">
                    <i>￥</i>
                    <span class="re-info-price-txt">{{ item.price }}.<span class="re-info-price-decimal">00</span></span>
                    <span class="re-sales">已售{{ item.sold_num }}件</span>
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
      carousel: [],
      miaoshaList: [
        { index: 1, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
        { index: 2, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
        { index: 3, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
        { index: 4, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item04.png'), href: '/' },
        { index: 5, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item05.png'), href: '/' },
        { index: 6, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item06.png'), href: '/' },
        { index: 7, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item07.png'), href: '/' },
        { index: 8, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item08.png'), href: '/' },
        { index: 9, title: '山河令开播一周年快乐四季花常在九洲事尽知', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item09.png'), href: '/' }
      ],
      activeName: 'first',
      activeIndex: 0,
      offerList: [
        {
          name: 'first',
          label: '精选',
          imgMain: { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item04.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item05.png'), href: '/' }
          ]
        },
        {
          name: 'second',
          label: '热销',
          imgMain: { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item06.png'), href: '/' },
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item07.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item08.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item09.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item10.png'), href: '/' }
          ]
        },
        {
          name: 'third',
          label: '新品',
          imgMain: { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', img_url: require('@/assets/img/seckill/seckill-item11.png'), href: '/' },
          imgList: [
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item01.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item02.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item03.png'), href: '/' },
            { title: '世上本无事，庸人自扰之', price: '51.29', m_price: '16.40', sold_num: '99', img_url: require('@/assets/img/seckill/seckill-item04.png'), href: '/' }
          ]
        }
      ],
      brandList: [],
      niceList: [
        {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }, {
          img_url: 'upload/cfdab3c8d25418b0a1479a3b01678e9a.jpg'
        }],
      recommondList: []
    }
  },
  mounted () {
    this.getCarousel()
    this.getBrand()
    this.getNice()
    this.getRecommond()
  },
  watch: {
    dID () {
      if (this.dID !== 'top' && this.dID) {
        const des = document.getElementById(this.dID)
        const y = des.offsetTop + 96
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
    handleClick (tab, event) {
      const index = tab.index
      this.activeName = this.offerList[index].name
      this.activeIndex = index
    },
    getCarousel () {
      this.$axios.get('/item/getCarousel').then(res => {
        if (res.status === 200) {
          const url = 'http://localhost:5129/'
          res.data = res.data.map((item, index) => {
            item.img_url = url + item.img_url
            return item
          })
          this.carousel = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    getBrand () {
      this.$axios.get('/item/getBrand').then(res => {
        if (res.status === 200) {
          const url = 'http://localhost:5129/'
          res.data = res.data.map((item, index) => {
            item.name = item.name + '品牌闪购'
            item.logo_url = url + item.logo_url
            return item
          })
          this.brandList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    getNice () {
      this.$axios.get('/item/getNice').then(res => {
        if (res.status === 200) {
          const url = 'http://localhost:5129/'
          res.data = res.data.map((item, index) => {
            item.img_url = url + item.img_url
            return item
          })
          this.niceList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    getRecommond () {
      this.$axios.get('/item/getRecommond').then(res => {
        if (res.status === 200) {
          const url = 'http://localhost:5129/'
          res.data = res.data.map((item, index) => {
            item.img_url = url + item.img_url
            return item
          })
          this.recommondList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    toItem (ID) {
      let itemID = ID
      if (itemID) {
        this.$router.push({ name: 'goods_item', params: { ID: itemID } })
      } else {
        itemID = 'a9265ee9fa5ac0f7c6df2f02c4c1a6db'
        this.$router.push({ name: 'default_item', params: { ID: itemID } })
      }
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
