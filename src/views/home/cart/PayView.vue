<template>
  <div class="pay-view">
    <h1>This is a page of pay-order</h1>
    <p>ID:{{ID}}</p>
    <p>buyNum:{{buyNum}}</p>
  </div>
</template>
<script>
export default {
  data () {
    return {
      ID: '',
      buyNum: ''
    }
  },
  methods: {

  },
  mounted () {
    this.ID = this.$route.params.ID
    this.buyNum = this.$route.params.buy_num
  },
  components: {

  }
}
</script>

<style scoped>

</style>
