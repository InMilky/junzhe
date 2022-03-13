const { defineConfig } = require('@vue/cli-service')
const path = require('path')

module.exports = defineConfig({
  transpileDependencies: true,
  runtimeCompiler: true,
  devServer: {
    port: 51129, // 端口号
    proxy: {
      '/server': { // 将/server替换 http://127.0.0.1:5129
        target: 'http://127.0.0.1:5129',
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
