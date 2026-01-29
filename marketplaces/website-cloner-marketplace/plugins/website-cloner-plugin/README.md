# Website Cloner Plugin v2.2

一个强大的 Claude Code 插件，使用 **Puppeteer 无头浏览器**高保真克隆网站，支持动态网站、SPA 应用和懒加载内容，**自动修正资源路径**。

## 🎯 v2.2 核心升级

基于 Apple iPhone 网站克隆的实战经验，新增关键功能：

- ✅ **自动路径修正**：智能替换所有资源路径为本地相对路径
- ✅ **完整样式支持**：CSS、JS、图片路径全部自动修正
- ✅ **即开即用**：克隆后无需手动修改，直接可用
- ✅ **Python 脚本工具**：提供 fix-all-paths.py 自动修正工具

## 🎯 v2.0 核心升级

基于 Bilibili 网站克隆的实战经验，全面升级克隆技术：

- ✅ **Puppeteer 渲染**：完整执行 JavaScript，获取真实内容
- ✅ **自动滚动**：触发懒加载，下载所有可见图片
- ✅ **HTML 格式化**：自动格式化压缩的 HTML，IDE 友好
- ✅ **智能提取**：支持协议相对路径、data-src、背景图片
- ✅ **多版本保存**：原始、渲染、格式化三个版本

## 功能特性

- 🎯 **动态网站支持**：完美支持 React、Vue、Angular 等 SPA 应用
- 📦 **完整资源下载**：自动下载 CSS、JavaScript、图片、字体等
- 🔄 **懒加载处理**：自动滚动页面触发懒加载内容
- 🔗 **路径智能修正**：处理绝对路径、相对路径、协议相对路径
- 📁 **结构化输出**：清晰的目录结构，包含多个 HTML 版本
- 📸 **页面截图**：自动生成页面预览截图
- 🚀 **即开即用**：克隆后可直接在本地浏览器中预览

## 前置要求

- **Node.js**: v14+ （用于运行 Puppeteer）
- **npm**: 包管理器
- **Claude Code**: 最新版本

## 安装方法

### 1. 安装插件

```bash
# 本地开发测试
claude --plugin-dir ./marketplaces/website-cloner-marketplace
```

### 2. 安装 Puppeteer（首次使用）

```bash
cd /tmp && npm install puppeteer
```

## 使用方法

启动 Claude Code 后，使用以下命令克隆网站：

```bash
/website-cloner:clone https://example.com
```

## 使用示例

### 克隆动态网站（如 Bilibili）
```bash
/website-cloner:clone https://www.bilibili.com
```

### 克隆 SPA 应用
```bash
/website-cloner:clone https://your-react-app.com
```

## 输出结构

克隆的网站将保存在以下结构中：

```
cloned-sites/
└── example.com/
    ├── index.html              # 原始静态 HTML
    ├── index-rendered.html     # 初次渲染版本
    ├── index-full.html         # 完整格式化版本 ⭐ 推荐使用
    ├── screenshot.png          # 页面截图
    ├── README.md              # 使用说明
    ├── css/                    # 样式文件
    │   ├── main.css
    │   └── ...
    ├── js/                     # JavaScript文件
    │   ├── app.js
    │   └── ...
    ├── images/                 # 图片资源（30-50个主要图片）
    │   └── ...
    ├── fonts/                  # 字体文件
    │   └── ...
    └── assets/                 # 其他资源
        └── ...
```

## 本地预览

克隆完成后，可以使用以下方法在本地预览：

### 使用 Python 内置服务器（推荐）
```bash
cd cloned-sites/example.com
python3 -m http.server 8000
```
然后在浏览器中访问 `http://localhost:8000/index-full.html`

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
git clone https://github.com/claude-plus/claude-plus.git
cd website-cloner-plugin
claude --plugin-dir .
```

## 版本历史

- **v2.2.0** (2026-01-29)
  - 🎯 **新增自动路径修正功能**
  - 添加 fix-all-paths.py 脚本，自动修正 HTML 中的资源路径
  - 支持 CSS、JS、图片路径的批量替换（832+ 引用）
  - 修正后的 index.html 可直接在本地服务器预览
  - 基于 Apple iPhone 网站克隆的实战经验优化

- **v2.0.0** (2026-01-28)
  - 升级为 Puppeteer 无头浏览器渲染
  - 支持动态网站和 SPA 应用
  - 自动滚动触发懒加载
  - HTML 自动格式化
  - 基于 Bilibili 网站克隆的实战经验

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
