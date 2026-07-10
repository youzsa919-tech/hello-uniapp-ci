import { defineConfig } from 'vite'
import uni from '@dcloudio/vite-plugin-uni'

/**
 * uni-app CLI 构建配置 (替代 HBuilderX 图形界面)
 *
 * 使用方式:
 *   npm run build:app     → 打包 APP (Android + iOS 资源包)
 *   npm run build:h5      → 打包 H5
 *   npm run build:mp-weixin → 打包微信小程序
 *
 * 构建产物目录:
 *   dist/build/app/       → APP 资源包
 *   dist/build/h5/        → H5 产物
 *   dist/build/mp-weixin/ → 小程序产物
 */
export default defineConfig({
  plugins: [uni()],
})
