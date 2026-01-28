# Website Cloner Plugin

一个强大的 Claude Code 插件，能够高保真地克隆和还原网站，包括 HTML、CSS、JavaScript 和所有静态资源。

## 功能特性

- 🎯 **高保真克隆**：完整复制网站的HTML结构、样式和脚本
- 📦 **资源下载**：自动下载所有CSS、JavaScript、图片、字体等资源
- 🔗 **路径修正**：智能转换绝对路径为相对路径，确保本地可用
- 📁 **结构化输出**：生成清晰的目录结构，易于理解和维护
- 🚀 **即开即用**：克隆后可直接在本地浏览器中预览

## 安装方法

### 方法1：本地开发测试
```bash
claude --plugin-dir ./website-cloner-plugin
```

### 方法2：通过插件市场安装（如果已发布）
```bash
/plugin install website-cloner
```

## 使用方法

启动 Claude Code 后，使用以下命令克隆网站：

```bash
/website-cloner:clone https://example.com
```

## 使用示例

### 克隆一个简单网站
```bash
/website-cloner:clone https://example.com
```

### 克隆一个复杂的单页应用
```bash
/website-cloner:clone https://your-spa-site.com
```

## 输出结构

克隆的网站将保存在以下结构中：

```
cloned-sites/
└── example.com/
    ├── index.html          # 主页面
    ├── css/                # 样式文件
    │   ├── main.css
    │   └── ...
    ├── js/                 # JavaScript文件
    │   ├── app.js
    │   └── ...
    ├── images/             # 图片资源
    │   └── ...
    ├── fonts/              # 字体文件
    │   └── ...
    └── assets/             # 其他资源
        └── ...
```

## 本地预览

克隆完成后，可以使用以下方法在本地预览：

### 使用 Python 内置服务器
```bash
cd cloned-sites/example.com
python -m http.server 8000
```
然后在浏览器中访问 `http://localhost:8000`

### 使用 Node.js http-server
```bash
npx http-server cloned-sites/example.com -p 8000
```

### 使用 VS Code Live Server
在 VS Code 中打开克隆的目录，右键点击 `index.html`，选择 "Open with Live Server"

## 注意事项

⚠️ **重要提示**：

1. **合法使用**：此工具仅用于学习、开发和测试目的
2. **版权尊重**：请尊重网站的版权和使用条款
3. **robots.txt**：遵守网站的 robots.txt 规则
4. **动态内容限制**：依赖后端API的动态内容可能无法完全复制
5. **性能考虑**：大型网站可能需要较长时间来克隆

## 技术限制

- **动态内容**：需要后端API支持的功能无法复制
- **认证保护**：需要登录的页面无法直接克隆
- **JavaScript渲染**：某些完全依赖JS渲染的内容可能需要额外处理
- **跨域资源**：某些CDN资源可能有访问限制

## 开发和贡献

欢迎提交问题和改进建议！

### 本地开发
```bash
git clone <your-repo>
cd website-cloner-plugin
claude --plugin-dir .
```

## 版本历史

- **v1.0.0** (2026-01-28)
  - 初始版本发布
  - 支持基本的HTML、CSS、JS克隆
  - 自动资源下载和路径修正

## 许可证

MIT License

## 作者

Claude Plus Team

---

**提示**：如果遇到问题，请确保：
1. URL格式正确（包含 http:// 或 https://）
2. 目标网站可以正常访问
3. 有足够的磁盘空间存储克隆的文件
