import Vue from 'vue'
import axios from 'axios'

Vue.prototype.$axios = axios
axios.defaults.baseURL = '/server'
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

const config = {
  timeout: 3000, // Timeout
  withCredentials: true // Check cross-site Access-Control
}

const _axios = axios.create(config)

_axios.interceptors.request.use(
  function (config) {
    if (localStorage.jwt_token) {
      config.headers.Authorization = localStorage.jwt_token
    }
    return config
  },
  function (error) {
    return Promise.reject(error)
  }
)

// Add a response interceptor
_axios.interceptors.response.use(
  function (response) {
    return response
  },
  function (error) {
    Promise.reject(error)
  }
)

export default _axios
