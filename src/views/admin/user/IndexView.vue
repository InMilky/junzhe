<template>
  <div class="home">
    <h1>This is an page of user-view</h1>
    <p>{{datalist}}</p>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'IndexView',
  data () {
    return {
      datalist: []
    }
  },
  created () {
    const request = axios.create({
      baseURL: 'https://api.apiopen.top',
      timeout: 5000
    })
    const url = '/getJoke'
    // axios.get(url, { params: { page: 1, count: 2, type: 'video' } }).then(res => {
    //   this.datalist = res
    // })
    // const whiteUrl = ['/login']
    // request.interceptors.request.use(
    //   config => {
    //     const url = config.url.replace(config.baseURL, '')
    //     if (whiteUrl.some(wl => url === wl)) {
    //       return config
    //     }
    //     config.headers.token = 'abcd'
    //     return config
    //   },
    //   error => {
    //     return Promise.reject(error)
    //   }
    // )
    // request.interceptors.response.use(
    //   response => {
    //     const res = response.data
    //     if (res.error_code !== 0) {
    //       return Promise.reject(new Error(res.msg))
    //     } else {
    //       return res
    //     }
    //   },
    //   error => {
    //     return Promise.reject(error)
    //   }
    // )
    request({ url, method: 'get', params: { page: 1, count: 2, type: 'video' } }).then(res => {
      this.datalist = res
    }).then(response => {
      console.log(response)
    }).catch(err => {
      console.log(err)
    })
  }
}
</script>

<style scoped>

</style>
