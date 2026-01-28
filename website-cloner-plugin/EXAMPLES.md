# 使用示例

## 快速开始

### 1. 测试插件
```bash
cd /Users/yxhpy/PycharmProjects/claude-plus
./website-cloner-plugin/test-plugin.sh
```

### 2. 克隆一个简单网站
在 Claude Code 中输入：
```
/website-cloner:clone https://example.com
```

### 3. 克隆一个更复杂的网站
```
/website-cloner:clone https://www.anthropic.com
```

## 详细示例

### 示例 1: 克隆静态网站
```bash
# 启动 Claude Code
claude --plugin-dir ./website-cloner-plugin

# 在 Claude Code 中执行
/website-cloner:clone https://example.com

# 预览结果
cd cloned-sites/example.com
python -m http.server 8000
# 浏览器访问 http://localhost:8000
```

### 示例 2: 克隆带样式的网站
```bash
# 克隆一个有丰富CSS的网站
/website-cloner:clone https://tailwindcss.com

# 查看克隆的文件结构
ls -la cloned-sites/tailwindcss.com/
```

### 示例 3: 批量克隆多个页面
```bash
# 克隆主页
/website-cloner:clone https://example.com

# 克隆子页面
/website-cloner:clone https://example.com/about

# 克隆产品页
/website-cloner:clone https://example.com/products
```

## 预期输出

克隆完成后，你会看到类似这样的输出：

```
✅ 网站克隆完成！

📊 统计信息：
- 源网站: https://example.com
- 保存位置: cloned-sites/example.com/
- HTML文件: 1 个
- CSS文件: 3 个
- JavaScript文件: 5 个
- 图片文件: 12 个
- 其他资源: 2 个
- 总大小: 2.5 MB

🚀 本地预览方法：
1. 使用 Python:
   cd cloned-sites/example.com
   python -m http.server 8000

2. 使用 Node.js:
   npx http-server cloned-sites/example.com -p 8000

3. 直接在浏览器打开:
   open cloned-sites/example.com/index.html
```

## 目录结构示例

```
cloned-sites/
└── example.com/
    ├── index.html              # 主页面
    ├── README.md               # 克隆信息
    ├── css/
    │   ├── main.css
    │   ├── bootstrap.min.css
    │   └── custom.css
    ├── js/
    │   ├── app.js
    │   ├── jquery.min.js
    │   └── main.js
    ├── images/
    │   ├── logo.png
    │   ├── hero-bg.jpg
    │   └── icons/
    │       ├── icon-1.svg
    │       └── icon-2.svg
    ├── fonts/
    │   ├── roboto-regular.woff2
    │   └── roboto-bold.woff2
    └── assets/
        ├── favicon.ico
        └── manifest.json
```

## 常见问题

### Q: 克隆需要多长时间？
A: 取决于网站大小，简单网站几秒钟，复杂网站可能需要几分钟。

### Q: 可以克隆需要登录的网站吗？
A: 不可以，此工具只能克隆公开访问的页面。

### Q: 克隆的网站可以直接使用吗？
A: 静态内容可以，但依赖后端API的动态功能无法工作。

### Q: 如何克隆整个网站（多个页面）？
A: 需要分别克隆每个页面，或者修改插件支持爬取整站。

## 高级用法

### 自定义输出目录
修改 `commands/clone.md` 中的目录路径：
```markdown
mkdir -p "my-custom-dir/<域名>"
```

### 添加更多资源类型
在 `commands/clone.md` 中添加对其他资源的支持：
- 视频文件 (`<video>`, `<source>`)
- 音频文件 (`<audio>`)
- SVG 文件
- WebP 图片

### 处理单页应用 (SPA)
对于 React、Vue 等 SPA 应用，可能需要：
1. 克隆构建后的静态文件
2. 确保路由配置正确
3. 处理 API 调用

## 故障排除

### 问题：URL 无法访问
```bash
# 检查 URL 是否正确
curl -I https://example.com

# 检查网络连接
ping example.com
```

### 问题：资源下载失败
- 检查是否有防火墙或代理限制
- 某些资源可能有防盗链保护
- CDN 资源可能需要特殊处理

### 问题：本地预览样式错误
- 检查路径是否正确转换
- 查看浏览器控制台的错误信息
- 确保使用 HTTP 服务器而不是直接打开文件

## 贡献和改进

欢迎提交改进建议：
- 支持整站爬取
- 添加进度条显示
- 支持断点续传
- 优化大文件处理
- 添加资源压缩选项
