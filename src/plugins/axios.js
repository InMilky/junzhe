import axios from 'axios'

// axios.defaults.baseURL = '/server'
// axios.defaults.headers['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'

const config = {
  baseURL: '/server',
  timeout: 3000, // Timeout
  withCredentials: true // Check cross-site Access-Control
}

const service = axios.create(config)

service.interceptors.request.use(
  config => {
    if (localStorage.jwt_token) {
      config.headers.Authorization = localStorage.jwt_token
    }
    return config
  },
  error => {
    return Promise.reject(error)
  }
)

// Add a response interceptor
service.interceptors.response.use(
  response => {
    return response
  },
  error => {
    return Promise.reject(error)
  }
)
export default service
