const { defineConfig } = require('@vue/cli-service')
const path = require('path')
const { PORT } = require('./src/plugins/config')

module.exports = defineConfig({
  transpileDependencies: true,
  runtimeCompiler: true,
  devServer: {
    port: PORT // 端口号
    // proxy: { // 已在nginx中设置，此处可以省略
    //   '/server': { // 将/server替换 后端服务器URL
    //     target: SERVER_HOST,
    //     changeOrigin: true, // 允许跨域
    //     ws: true,
    //     secure: false, // 使用http协议设置为false
    //     pathRewrite: {
    //       '^/server': ''
    //     }
    //   // 会将请求到当前devServer的path中的/server替换掉
    //     // 即http://localhost:80/server/xxx => http://test1.env.com/xxx
    //   }
    // }
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
