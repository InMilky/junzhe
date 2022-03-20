const { defineConfig } = require('@vue/cli-service')
const path = require('path')
const { SERVER_HOST, PORT } = require('@/plugins/config.js')

module.exports = defineConfig({
  transpileDependencies: true,
  runtimeCompiler: true,
  devServer: {
    port: PORT, // 端口号
    proxy: {
      '/server': { // 将/server替换 后端服务器URL
        target: SERVER_HOST,
        changeOrigin: true, // 允许跨域
        ws: true,
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
  }
})
