# Website Cloner 插件 - 完整使用指南

## 🎯 插件概述

Website Cloner 是一个强大的 Claude Code 插件，能够高保真地克隆网站，包括：
- HTML 结构
- CSS 样式表
- JavaScript 脚本
- 图片、字体等静态资源

## 📦 安装方法

### 方法 1：本地开发模式（推荐用于测试）

直接使用插件目录启动 Claude Code：

```bash
cd /Users/yxhpy/PycharmProjects/claude-plus
claude --plugin-dir ./website-cloner-plugin
```

这种方式适合：
- 插件开发和调试
- 快速测试功能
- 不需要安装到系统

### 方法 2：通过本地市场安装

1. **添加本地市场**：
   ```bash
   /plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/marketplaces/website-cloner-marketplace
   ```

2. **查看可用插件**：
   ```bash
   /plugin
   ```
   切换到 **Discover** 标签页，找到 `website-cloner` 插件

3. **安装插件**：
   ```bash
   /plugin install website-cloner@website-cloner-marketplace
   ```

### 方法 3：通过 GitHub 分发（推荐用于团队使用）

1. **将插件推送到 GitHub**：
   ```bash
   cd website-cloner-plugin
   git init
   git add .
   git commit -m "Initial commit: Website Cloner Plugin"
   git remote add origin https://github.com/your-username/website-cloner-plugin.git
   git push -u origin main
   ```

2. **其他用户安装**：
   ```bash
   /plugin marketplace add your-username/website-cloner-plugin
   /plugin install website-cloner@your-username-website-cloner-plugin
   ```

## 🚀 使用方法

### 基本用法

克隆一个网站：

```bash
/website-cloner:clone https://example.com
```

### 使用示例

#### 示例 1：克隆简单网站
```bash
/website-cloner:clone https://example.com
```

#### 示例 2：克隆复杂的单页应用
```bash
/website-cloner:clone https://www.anthropic.com
```

#### 示例 3：克隆文档网站
```bash
/website-cloner:clone https://code.claude.com
```

## 📁 输出结构

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
    ├── assets/             # 其他资源
    │   └── ...
    └── README.md           # 克隆信息
```

## 🌐 本地预览

克隆完成后，可以使用以下方法在本地预览：

### 方法 1：Python 内置服务器
```bash
cd cloned-sites/example.com
python -m http.server 8000
```
然后在浏览器中访问 `http://localhost:8000`

### 方法 2：Node.js http-server
```bash
npx http-server cloned-sites/example.com -p 8000
```

### 方法 3：VS Code Live Server
1. 在 VS Code 中打开克隆的目录
2. 右键点击 `index.html`
3. 选择 "Open with Live Server"

### 方法 4：直接打开（简单网站）
```bash
open cloned-sites/example.com/index.html
```

⚠️ **注意**：某些网站可能需要 HTTP 服务器才能正常工作（推荐使用方法 1 或 2）

## 🔍 工作原理

插件执行以下步骤来克隆网站：

1. **验证 URL**：检查 URL 格式，确保包含协议
2. **创建目录结构**：为克隆的网站创建组织良好的目录
3. **获取主页面**：使用 WebFetch 工具下载 HTML
4. **分析资源**：识别所有 CSS、JS、图片、字体等资源
5. **下载资源**：批量下载所有识别出的资源
6. **处理 CSS**：下载 CSS 中引用的资源（字体、背景图等）
7. **路径修正**：将绝对路径转换为相对路径
8. **生成报告**：提供克隆统计和预览说明

## ⚠️ 注意事项

### 合法使用
- ✅ 用于学习和开发目的
- ✅ 用于创建网站原型
- ✅ 用于离线访问公开内容
- ❌ 不要用于侵犯版权
- ❌ 不要用于商业盗用

### 技术限制
- **动态内容**：需要后端 API 的功能无法复制
- **认证保护**：需要登录的页面无法直接克隆
- **JavaScript 渲染**：某些完全依赖 JS 渲染的内容可能需要额外处理
- **跨域资源**：某些 CDN 资源可能有访问限制

### 最佳实践
1. 遵守网站的 `robots.txt` 规则
2. 尊重网站的版权和使用条款
3. 不要频繁克隆同一网站（避免给服务器造成负担）
4. 仅用于合法和道德的目的

## 🐛 故障排除

### 问题 1：URL 无法访问
**解决方案**：
- 检查 URL 格式是否正确
- 确保包含 `http://` 或 `https://`
- 验证网站是否在线

### 问题 2：资源下载失败
**解决方案**：
- 检查网络连接
- 某些资源可能有访问限制
- 查看错误日志了解具体失败的资源

### 问题 3：本地预览不正常
**解决方案**：
- 使用 HTTP 服务器而不是直接打开文件
- 检查浏览器控制台的错误信息
- 某些动态功能可能需要后端支持

### 问题 4：插件命令不可用
**解决方案**：
- 确认插件已正确安装：`/plugin`
- 检查插件是否已启用
- 重启 Claude Code

## 📊 性能建议

- **小型网站**（< 10 MB）：通常 1-2 分钟完成
- **中型网站**（10-50 MB）：可能需要 5-10 分钟
- **大型网站**（> 50 MB）：建议分批克隆或只克隆特定页面

## 🔧 开发和贡献

### 本地开发
```bash
git clone <your-repo>
cd website-cloner-plugin
claude --plugin-dir .
```

### 测试插件
```bash
./test-plugin.sh
```

### 验证插件配置
```bash
./validate.sh
```

## 📝 版本历史

- **v1.0.0** (2026-01-28)
  - 初始版本发布
  - 支持基本的 HTML、CSS、JS 克隆
  - 自动资源下载和路径修正
  - 生成结构化输出目录

## 📄 许可证

MIT License - 详见 LICENSE 文件

## 👥 作者

Claude Plus Team

## 🔗 相关资源

- [Claude Code 官方文档](https://code.claude.com/docs)
- [插件开发指南](https://code.claude.com/docs/plugins)
- [插件市场创建指南](https://code.claude.com/docs/plugin-marketplaces)

---

**提示**：如果遇到问题，请确保：
1. URL 格式正确（包含 http:// 或 https://）
2. 目标网站可以正常访问
3. 有足够的磁盘空间存储克隆的文件
4. 使用 HTTP 服务器预览克隆的网站
