/*
 * @Description: 标签页title
 * @Author: Alex_McAvoy
 * @Date: 2023-02-18 16:47:13
 */

import defaultSettings from '@/settings'

const title = defaultSettings.title || '通用后台管理系统'

export default function getPageTitle(pageTitle) {
  if (pageTitle) {
    return `${pageTitle} - ${title}`
  }
  return `${title}`
}

