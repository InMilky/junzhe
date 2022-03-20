<template>
  <div class="re-temp">
    <!--  为你推荐  -->
    <el-row class="top-nav" type="flex" justify="center">
      <el-col :span="20">
        <div id="recommand" class="recommand">
          <div class="re-title">猜你喜欢</div>
          <div class="re-more">
            <div class="re-item" v-for="(item,index) in recommendList" :key="index">
              <a href="javascript:void(0)" @click="toItem(item.ID)" class="re-link">
                <div class="re-img">
                  <el-image class="el-img" :src="item.img_url" :alt="item.title" fit="contain" lazy></el-image>
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
      </el-col>
    </el-row>

  </div>
</template>

<script>
import { SERVER_HOST } from '@/plugins/config'

export default {
  data () {
    return {
      recommendList: []
    }
  },
  created () {
    this.getRecommond()
  },
  // mounted () {
  //   this.getRecommond()
  // },
  methods: {
    getRecommond () {
      this.$axios.get('/item/getRecommond').then(res => {
        if (res.status === 200) {
          // const url = 'http://localhost:5129/'
          const url = SERVER_HOST
          res.data = res.data.map((item, index) => {
            item.img_url = url + item.img_url
            return item
          })
          this.recommendList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    toItem (ID) {
      const itemID = ID || '1234'
      this.$router.push({ name: 'goods_item', params: { ID: itemID } })
    }
  }
}
</script>

<style scoped>
.re-temp{
  width: 100%;
  overflow: hidden;
}
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
.re-link:hover .re-img .el-img{
  opacity:0.8;
  transform: scale(1,1);
}
</style>
