<template>
  <div class="about">
    <SeckillTop></SeckillTop>
    <div class="goods-info">
      <el-row type="flex" justify="center">
        <el-col :span="20">

        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import SeckillTop from '@/components/home/seckill/SeckillTop'

export default {
  data () {

  },
  methods: {

    searchGoods (key) {
      // alert(key)
      // axios请求
    }
  },
  components: {
    SeckillTop
  }
}
</script>
