'use strict'
const path = require('path')
const defaultSettings = require('./src/settings.js')

function resolve(dir) {
  return path.join(__dirname, dir)
}

const name = defaultSettings.title || 'vue Admin Template' // 页面标题

const port = process.env.port || process.env.npm_config_port || 9528 // 开发端口

module.exports = {
  // 项目名，与Nginx中location的配置项一致
  publicPath: '/RBAC',
  outputDir: 'dist',
  assetsDir: 'static',
  lintOnSave: process.env.NODE_ENV === 'development',
  productionSourceMap: false,
  devServer: {
    port: port,
    open: true,
    overlay: {
      warnings: false,
      errors: true
    },
    proxy: {
        // 开发环境，匹配以 /dev-api 开头的请求路径
      //  '/dev-api': {
      //    target: 'http://localhost:8001',
      //    //支持跨域
      //    changeOrigin: true,
      //    //重写路径，去掉路径中开头的 /dev-api
      //    pathRewrite: {
      //      '^/dev-api': ''
      //    }
      //  }
       
      // 生产环境，匹配以 /prod-api 开头的请求路径，打包：npm run build:prod
      // 打包完成后，将dist中所有文件复制到Nginx的html文件夹下，运行nginx即可
     '/prod-api': {
        target: 'http://localhost:8800',
        changeOrigin: true,
        pathRewrite: {
          '^/prod-api': ''
        }
      }
    }
  },
  configureWebpack: {
    name: name,
    resolve: {
      alias: {
        '@': resolve('src')
      }
    }
  },
  chainWebpack(config) {
    config.plugin('preload').tap(() => [
      {
        rel: 'preload',
        fileBlacklist: [/\.map$/, /hot-update\.js$/, /runtime\..*\.js$/],
        include: 'initial'
      }
    ])

    config.plugins.delete('prefetch')

    config.module
      .rule('svg')
      .exclude.add(resolve('src/icons'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/icons'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()

    config
      .when(process.env.NODE_ENV !== 'development',
        config => {
          config
            .plugin('ScriptExtHtmlWebpackPlugin')
            .after('html')
            .use('script-ext-html-webpack-plugin', [{
              inline: /runtime\..*\.js$/
            }])
            .end()
          config
            .optimization.splitChunks({
              chunks: 'all',
              cacheGroups: {
                libs: {
                  name: 'chunk-libs',
                  test: /[\\/]node_modules[\\/]/,
                  priority: 10,
                  chunks: 'initial' 
                },
                elementUI: {
                  name: 'chunk-elementUI', 
                  priority: 20, 
                  test: /[\\/]node_modules[\\/]_?element-ui(.*)/ 
                },
                commons: {
                  name: 'chunk-commons',
                  test: resolve('src/components'), 
                  minChunks: 3, 
                  priority: 5,
                  reuseExistingChunk: true
                }
              }
            })
          config.optimization.runtimeChunk('single')
        }
      )
  }
}
