<template>
  <div class="home">
    <FixedTop v-show="showFixedTop" @search="searchGoods"></FixedTop>
    <FixedRight v-show="showRightnav" @destination="toDestination"></FixedRight>
    <HeaderView @search="searchGoods"></HeaderView>
    <MainView :dID="destinationID"></MainView>
  </div>
</template>

<script>

import HeaderView from '@/components/home/topfooter/HeaderView'
import MainView from '@/components/home/MainView'
import FixedRight from '@/components/home/topfooter/FixedRight'
import FixedTop from '@/components/home/topfooter/FixedTop'

export default {
  data () {
    return {
      showFixedTop: false,
      showRightnav: false,
      destinationID: ''
    }
  },
  mounted () {
    window.addEventListener('scroll', this.getScrollTop)
  },
  destroyed () {
    window.removeEventListener('scroll', this.getScrollTop)
  },
  methods: {
    getScrollTop () {
      const top = document.body.scrollTop || window.pageYOffset || window.scrollY
      if (top > 320) {
        this.showFixedTop = true
        this.showRightnav = true
      } else {
        this.showFixedTop = false
        this.showRightnav = false
      }
    },
    toDestination (id) {
      this.destinationID = id
    },
    searchGoods (key) {
      // axios请求
      // this.$axios.get('/search', { query: { key: key } })
      //   .then(res => {
      //     if (res.status === 200) {
      //
      //     } else {
      //       this.$message.error(res.msg)
      //     }
      //   }).catch(err => {
      //     this.$message.error(err)
      //   })
    }
  },
  components: {
    HeaderView,
    MainView,
    FixedTop,
    FixedRight
  }
}
</script>

<style scoped>
.home{
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}
</style>
