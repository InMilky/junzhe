<template>
  <div class="item-index">
    <SeckillTop :keyword="keyword" @search="searchItem"></SeckillTop>
    <el-row class="search-main" type="flex" justify="center">
      <el-col :span="20">
        <div class="top-filter">
          <div style="float: left">
            <span style="margin-right: 10px;display: inline-block">全部商品</span>/
          <span style="margin: 0 5px;display: inline-block">{{keyword}}</span></div>
          <div style="float: right;display: flex"><span>价格区间：</span></div>
        </div>
        <div class="search-content">
          <el-result icon="warning" title="抱歉" subTitle="msg" v-if="emptyMsg">
          </el-result>
          <div class="item-div" v-else>
              <div class="re-more">
                <div class="re-item" v-for="(item,index) in item" :key="index">
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
        </div>
        <div class="breadrumb-tag">
          <span style="color: #999999">您是不是想找：</span>
          <el-breadcrumb separator="|">
            <el-breadcrumb-item>手机数码</el-breadcrumb-item>
            <el-breadcrumb-item>手表饰品</el-breadcrumb-item>
            <el-breadcrumb-item>新款包包</el-breadcrumb-item>
            <el-breadcrumb-item>可爱娃衣</el-breadcrumb-item>
            <el-breadcrumb-item>图书杂志</el-breadcrumb-item>
            <el-breadcrumb-item>明星同款</el-breadcrumb-item>
          </el-breadcrumb>
        </div>
      </el-col>
    </el-row>
    <RecommendTemp></RecommendTemp>
  </div>
</template>

<script>
import SeckillTop from '@/components/home/seckill/SeckillTop'
import RecommendTemp from '@/components/home/recommand/RecommendTemp'
import { SERVER_HOST } from '@/plugins/config'
export default {
  data () {
    return {
      item: [],
      emptyMsg: '',
      keyword: ''
    }
  },
  mounted () {
    this.keyword = this.$route.query.key
    this.searchItem(this.keyword)
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
    }
  },
  components: {
    SeckillTop,
    RecommendTemp
  }
}
</script>

<style scoped>
.search-main{
  width: 100%;
  height: 100%;
  margin-top: 30px;
  overflow: hidden;
}
.top-filter{
  height: 42px;
  line-height: 42px;
  border: 1px solid #e6e6e6;
  font-size: 14px;
  padding: 0 20px;
  overflow: hidden;
}
.breadrumb-tag{
  height: 42px;
  border: 1px solid #e6e6e6;
  background-color: #f4f4f4;
  font-size: 12px;
  display: flex;
  padding-left: 18px;
  line-height: 42px;
}
.breadrumb-tag>div{
  margin: auto 0;
  font-size: 12px;
}
/deep/ .breadrumb-tag .el-breadcrumb__inner{
  cursor: pointer;
}
.item-div{
  width: 100%;
  height: auto;
  margin: 30px 0;
}
.re-more{
  display: flex;
  flex-wrap: wrap;
}
.re-item{
  border: 1px solid #dddddd;
  width: 20%;
  height: 300px;
  box-sizing: border-box;
}
.re-item:hover{
  border: 1px solid #e1251b;
}
.re-link:hover .re-img .el-img{
  opacity:0.8;
  transform: scale(1,1);
}
</style>
