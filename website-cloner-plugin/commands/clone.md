---
description: 高保真克隆网站，输入URL即可完整复制网站的HTML、CSS、JS和所有资源
---

# 网站克隆命令

你需要帮助用户克隆网站 "$ARGUMENTS" 并创建一个高保真的本地副本。

## 执行步骤

### 1. 验证URL
- 检查用户提供的URL: "$ARGUMENTS"
- 如果URL不包含协议，自动添加 https://
- 提取域名用于创建目录

### 2. 创建项目结构
使用 Bash 工具创建目录：
```bash
mkdir -p "cloned-sites/<域名>"
mkdir -p "cloned-sites/<域名>/css"
mkdir -p "cloned-sites/<域名>/js"
mkdir -p "cloned-sites/<域名>/images"
mkdir -p "cloned-sites/<域名>/fonts"
mkdir -p "cloned-sites/<域名>/assets"
```

### 3. 获取主页面
使用 WebFetch 工具获取网站内容：
- URL: "$ARGUMENTS"
- Prompt: "提取完整的HTML内容，包括所有标签和属性"

### 4. 分析和下载资源
从HTML中识别并下载：
- **CSS文件**: 查找 `<link rel="stylesheet" href="...">`
- **JavaScript**: 查找 `<script src="...">`
- **图片**: 查找 `<img src="...">`, `<source>`, CSS中的背景图
- **字体**: 查找 CSS 中的 `@font-face`
- **其他资源**: favicon, manifest等

对每个资源：
1. 使用 WebFetch 下载内容
2. 使用 Write 工具保存到对应目录
3. 记录原始URL和本地路径的映射

### 5. 处理CSS文件
对于每个CSS文件：
- 下载CSS内容
- 查找其中的 `@import` 和 `url()` 引用
- 递归下载这些资源
- 更新路径为相对路径

### 6. 修正HTML中的路径
- 将所有绝对URL替换为相对路径
- 更新资源引用指向本地文件
- 保持HTML结构完整

### 7. 保存最终文件
使用 Write 工具保存修正后的 index.html

### 8. 生成使用说明
创建一个 README.md 在克隆目录中，包含：
- 克隆时间和源URL
- 文件统计信息
- 本地预览方法

## 输出格式

向用户报告：
```
✅ 网站克隆完成！

📊 统计信息：
- 源网站: <URL>
- 保存位置: cloned-sites/<域名>/
- HTML文件: X 个
- CSS文件: X 个
- JavaScript文件: X 个
- 图片文件: X 个
- 其他资源: X 个
- 总大小: X MB

🚀 本地预览方法：
1. 使用 Python:
   cd cloned-sites/<域名>
   python -m http.server 8000

2. 使用 Node.js:
   npx http-server cloned-sites/<域名> -p 8000

3. 直接在浏览器打开:
   open cloned-sites/<域名>/index.html

⚠️  注意：某些需要后端API的动态功能可能无法正常工作
```

## 错误处理

如果遇到问题：
- URL无法访问：提示用户检查URL是否正确
- 资源下载失败：记录失败的资源，继续处理其他资源
- 权限问题：提示用户检查目录写入权限

## 最佳实践

1. **优先处理关键资源**：先下载HTML、CSS、主要JS
2. **批量处理**：对相同类型的资源批量下载
3. **保持结构**：尽可能保持原网站的目录结构
4. **路径一致性**：确保所有路径引用正确
5. **提供反馈**：实时告知用户进度

## 示例执行

当用户输入：`/website-cloner:clone https://example.com`

你应该：
1. 创建 `cloned-sites/example.com/` 目录
2. 下载主页HTML
3. 分析并下载所有资源
4. 修正路径引用
5. 生成完整的本地副本
6. 提供预览说明

开始执行克隆任务吧！记住要详细报告每个步骤的进度。
