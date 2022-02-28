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
        <div class="miaosha-zone"></div>
        <div class="special-offer"></div>
        <div class="nicegoods"></div>
        <div class="recommand"></div>
        <el-divider> END </el-divider>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return {
      banner: [{ index: 0, src: require('@/assets/img/banner/banner01.png') },
        { index: 1, src: require('@/assets/img/banner/banner02.png') },
        { index: 2, src: require('@/assets/img/banner/banner03.png') },
        { index: 3, src: require('@/assets/img/banner/banner04.png') },
        { index: 4, src: require('@/assets/img/banner/banner05.png') }
      ]
    }
  },
  methods: {
    change () {

    }
  }
}
</script>

<style scoped>
.mainview{
  width: 100%;
  height: 100%;
  background: #f4f4f4;
}
.carousel{
  width: 100%;
  height: 480px;
  overflow: hidden;
  background-color: #FFFFFF;
}
/deep/ .el-carousel__item{
  background-color: #666666;
}
.miaosha-zone{
  width: 100%;
  height: 260px;
  background-color: white;
  margin: 36px 0;
  display: flex;;
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

.nicegoods{
  width: 100%;
  height: 260px;
  margin: 21px 0;
  background-color: white;
}
.special-offer{
  width: 100%;
  height: 320px;
  display: flex;
  margin: 21px 0;
  background-color: white;
}
</style>
