<template>
  <div class="">
    <aside id="right-nav">
      <ul class="elevator-list">
        <li class="elevator-item" v-for="(item,index) in elevatorList" :key="index">
          <a class="elevator-link" href="javascript:void(0)" v-if="item.hasIcon">
            <div><span class="elevator-lk-txt">{{ item.title }}</span></div>
          </a>
          <a class="elevator-link" href="javascript:void(0)" v-else>
            <div class="pt-10">{{item.icon}}
              <span class="elevator-lk-txt elevator-lk-txttoimg">{{ item.title }}</span>
            </div></a>
        </li>
      </ul>
    </aside>
  </div>
</template>

<script>
export default {
  data () {
    return {
      elevatorList: [
        { title: '秒杀专区', hasIcon: false, icon: '' },
        { title: '特色优选', hasIcon: false, icon: '' },
        { title: '频道广场', hasIcon: false, icon: '' },
        { title: '为你推荐', hasIcon: false, icon: '' },
        { title: '客服', hasIcon: true, icon: '<i class="el-icon-view el-icon--right"></i>' },
        { title: '反馈', hasIcon: true, icon: '<i class="el-icon-view el-icon--right"></i>' },
        { title: '顶部', hasIcon: true, icon: '<i class="el-icon-view el-icon--right"></i>' }
      ]
    }
  },
  methods: {}
}
</script>

<style scoped>

</style>
