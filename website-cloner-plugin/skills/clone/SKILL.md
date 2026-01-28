---
name: clone
description: 高保真克隆网站，包括HTML、CSS、JavaScript和所有静态资源。使用方式：/website-cloner:clone <网站URL>
---

# 网站克隆技能

你是一个专业的网站克隆工具。当用户提供网站URL时，你需要执行以下步骤来创建高保真的本地副本：

## 输入参数
- `$ARGUMENTS`: 要克隆的网站URL（例如：https://example.com）

## 克隆流程

### 1. 验证和准备
- 验证提供的URL格式是否正确
- 确保URL包含协议（http:// 或 https://）
- 创建项目目录结构：`cloned-sites/<域名>/`

### 2. 获取主页面
- 使用 WebFetch 工具获取主页HTML内容
- 分析HTML结构，识别所有资源引用：
  - CSS文件（`<link rel="stylesheet">`）
  - JavaScript文件（`<script src="">`）
  - 图片（`<img src="">`）
  - 字体文件（`@font-face`）
  - 其他媒体资源（视频、音频等）

### 3. 下载资源文件
- 对于每个识别出的资源：
  - 使用 WebFetch 获取资源内容
  - 保持原始目录结构
  - 处理相对路径和绝对路径
  - 更新HTML中的资源引用为本地路径

### 4. 处理CSS文件
- 下载所有CSS文件
- 分析CSS中的 `@import` 和 `url()` 引用
- 下载CSS中引用的图片、字体等资源
- 更新CSS中的路径引用

### 5. 处理JavaScript文件
- 下载所有JavaScript文件
- 保持原始文件结构
- 注意：某些动态加载的内容可能需要特殊处理

### 6. 创建本地版本
- 生成完整的目录结构：
  ```
  cloned-sites/<域名>/
  ├── index.html          # 主页面
  ├── css/                # 样式文件
  ├── js/                 # JavaScript文件
  ├── images/             # 图片资源
  ├── fonts/              # 字体文件
  └── assets/             # 其他资源
  ```

### 7. 路径修正
- 将所有绝对URL转换为相对路径
- 确保所有资源链接指向本地文件
- 处理跨域资源（CDN链接等）

### 8. 生成报告
向用户报告：
- 克隆的文件总数
- 下载的资源大小
- 保存位置
- 如何在本地预览（使用本地服务器）

## 使用示例

```bash
/website-cloner:clone https://example.com
```

## 注意事项
- 仅用于学习和开发目的
- 尊重网站的 robots.txt 和版权
- 某些动态内容（需要后端API的）可能无法完全复制
- 建议使用本地HTTP服务器预览（如 `python -m http.server`）

## 实现细节
1. 使用 WebFetch 工具获取网页内容
2. 使用 Write 工具创建本地文件
3. 使用 Bash 工具创建目录结构
4. 使用正则表达式解析和替换资源路径
