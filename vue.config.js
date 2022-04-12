const { defineConfig } = require('@vue/cli-service')
const path = require('path')
const { PORT, SERVER_HOST } = require('./src/plugins/config')

module.exports = defineConfig({
  transpileDependencies: true,
  runtimeCompiler: true,
  devServer: {
    port: PORT, // 端口号
    proxy: { // 已在nginx中设置，此处可以省略
      '/server': { // 将/server替换 后端服务器URL
        target: SERVER_HOST,
        changeOrigin: true, // 允许跨域
        ws: true,
        secure: false, // 使用http协议设置为false
        pathRewrite: {
          '^/server': ''
        }
      }
    }
  },
  pluginOptions: {
    express: {
      shouldServeApp: true,
      serverDir: './srv'
    }
  },
  chainWebpack (config) {
    config.resolve.alias
      .set('@', path.join(__dirname, 'src'))
      // 发布模式
    config.when(process.env.NODE_ENV === 'production', config => {
      // 配置入口文件
      config.entry('app').clear().add('./src/main-prod.js')
      // 配置CDN
      config.set('externals', {
        vue: 'Vue',
        'vue-router': 'VueRouter',
        axios: 'axios',
        nprogress: 'NProgress',
        'element-ui': 'ELEMENT'
      })
      // 首页配置是否加载CDN资源
      config.plugin('html').tap(args => {
        args[0].isProd = true
        return args
      })
    })
    // 开发模式
    config.when(process.env.NODE_ENV === 'development', config => {
      config.entry('app').clear().add('./src/main-dev.js')
      config.plugin('html').tap(args => {
        args[0].isProd = false
        return args
      })
    })
  }
})
