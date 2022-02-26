<template>
  <div class="home">
    <HeaderView></HeaderView>
    <el-container>
      <el-main>
        <div class="carousel">
          <el-carousel height="100%">
            <el-carousel-item v-for="item in 4" :key="item">
              <h3 class="small">{{ item }}</h3>
            </el-carousel-item>
          </el-carousel>
        </div>
      </el-main>
    </el-container>
    <FooterView></FooterView>
  </div>
</template>

<script>

import FooterView from '@/components/home/FooterView'
import HeaderView from '@/components/home/HeaderView'
export default {
  components: { HeaderView, FooterView }
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
