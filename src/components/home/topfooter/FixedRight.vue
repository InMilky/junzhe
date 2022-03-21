<template>
  <div class="right-aside">
    <aside class="right-nav">
        <div class="elevator-item" v-for="(item,index) in elevatorList" :key="index">
          <el-link class="elevator-link" @click="toDestination(item.id)" >
            <div>
              <i :class="item.icon" style="font-size: 21px" v-if="item.hasIcon"></i>
              <span class="elevator-lk-txt">{{ item.title }}</span></div>
          </el-link>
        </div>
    </aside>
  </div>
</template>

<script>
export default {
  data () {
    return {
      elevatorList: [
        { id: 'seckill', title: '秒杀专区', hasIcon: false },
        { id: 'special', title: '特色优选', hasIcon: false },
        { id: 'nicegoods', title: '频道广场', hasIcon: false },
        { id: 'recommand', title: '为你推荐', hasIcon: false },
        { id: '', title: '客服', hasIcon: true, icon: 'el-icon-service' },
        { id: '', title: '反馈', hasIcon: true, icon: 'el-icon-edit' },
        { id: 'top', title: '顶部', hasIcon: true, icon: 'el-icon-arrow-up' }
      ]
    }
  },
  methods: {
    toDestination (id) {
      this.$emit('destination', id)
    }
  }
}
</script>

<style scoped>
.right-aside{
  width: 60px;
  height: 72%;
  position: fixed;
  right: 1%;
  top: 16%;
  background-color: white;
  overflow: hidden;
  z-index: 15;
}
.right-nav{
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.elevator-item{
  flex: 1;
  width: 100%;
  font-size: 16px;
  color: #333;
  text-align: center;
}
.elevator-link{
  text-decoration: none;
  width: 100%;
  height: 100%;
  display: flex;
  position: relative;
  background-color: transparent;
}
.elevator-link div{
  width: 72%;
  margin: auto;
}
.elevator-link:after {
  position: absolute;
  display: inline-block;
  width: 60px;
  height: 1px;
  left: 0;
  bottom: 0;
  background: -webkit-gradient(linear, right top, left top, from(white), color-stop(#eeeeee), color-stop(#eeeeee), to(white));
  background: linear-gradient(
    270deg, white, #eeeeee, #eeeeee, white);
  z-index: 1;
  content: "";
}
.elevator-item:last-child>.elevator-link{
  color: #c81623;
}
.elevator-item:hover>.elevator-link{
  background-color: #c81623;
  color: #FFFFFF;
}
.elevator-item:hover>.elevator-link:after {
  background:#c81623;
  content: "";
  z-index: 1;
}

.elevator-lk-txt{
  display: inline-block;
}
</style>
