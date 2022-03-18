<template>
  <div class="count-down">
{{title}}——{{hour}}:{{minute}}:{{second}}
  </div>
</template>

<script>
export default {
  data () {
    return {
      title: '活动尚未开始',
      hour: 0,
      minute: 0,
      second: 0,
      timeGap: 0,
      info: [{
        start_date: '2022/3/19 01:51:29',
        end_date: '2022/3/19 03:00:00'
      }]
    }
  },
  async created () {
    const serverTime = await this.getServerTime()
    this.timeGap = Date.now() - serverTime// 当前时间和服务器时间差
    //   this.updateState()
    //   this.timeInterval = setInterval(() => {
    //     this.updateState()
    //   }, 1000)
  },
  methods: {
    getServerTime () {
      this.$axios.get('/getServerTime').then(res => {
        return res.currentTime
      }).catch(err => {
        Promise.reject(err)
      })
    }
  }
}
</script>

<style scoped>

</style>
