---
description: 高保真克隆网站，自动修正资源路径，输入URL即可完整复制网站的HTML、CSS、JS和所有资源
---

# 网站克隆命令

你需要帮助用户克隆网站 "$ARGUMENTS" 并创建一个高保真的本地副本。

## 执行方法

直接调用克隆脚本：

```bash
bash marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin/scripts/clone-website.sh "$ARGUMENTS"
```

## 克隆流程

脚本会自动执行以下步骤：

1. **验证URL** - 检查并提取域名
2. **创建目录** - 创建结构化输出目录
3. **Puppeteer渲染** - 使用无头浏览器渲染完整页面
4. **格式化HTML** - 自动格式化压缩的HTML
5. **提取资源** - 识别所有CSS、JS、图片URL
6. **下载资源** - 批量下载资源文件
7. **修正路径** - 自动替换为本地相对路径 ⭐
8. **生成文档** - 创建README和统计信息

## 输出报告

向用户报告：

```
✨ 网站克隆完成！

📊 统计信息：
- 源网站: <URL>
- 保存位置: cloned-sites/<域名>/
- 总大小: X MB
- HTML文件: 3 个
- CSS文件: X 个
- JavaScript文件: X 个
- 图片文件: X 个

🚀 本地预览：
cd cloned-sites/<域名>
python3 -m http.server 8000
访问: http://localhost:8000/index.html

⚠️  注意：动态功能（API调用等）无法工作
```

## 示例

```bash
/website-cloner:clone https://www.apple.com/iphone/
/website-cloner:clone https://example.com
```
