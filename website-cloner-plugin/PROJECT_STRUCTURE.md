# Website Cloner Plugin - 项目结构

## 📁 完整目录结构

```
website-cloner-plugin/
├── .claude-plugin/
│   └── plugin.json              # 插件清单文件（必需）
├── commands/
│   └── clone.md                 # 用户可调用的克隆命令
├── skills/
│   └── clone/
│       └── SKILL.md             # Agent 技能定义
├── .gitignore                   # Git 忽略文件
├── README.md                    # 项目说明文档
├── EXAMPLES.md                  # 使用示例和教程
└── test-plugin.sh               # 快速测试脚本
```

## 📄 文件说明

### 核心文件

#### `.claude-plugin/plugin.json`
插件的元数据配置文件，定义了：
- 插件名称：`website-cloner`
- 版本号：`1.0.0`
- 描述信息
- 作者信息

#### `commands/clone.md`
用户可直接调用的命令，使用方式：
```bash
/website-cloner:clone <URL>
```

这是一个用户可调用的技能（user-invocable skill），包含详细的执行步骤和指令。

#### `skills/clone/SKILL.md`
Agent 技能定义，Claude 可以根据上下文自动调用此技能来克隆网站。

### 文档文件

#### `README.md`
- 插件功能介绍
- 安装方法
- 基本使用说明
- 注意事项和限制

#### `EXAMPLES.md`
- 详细的使用示例
- 常见问题解答
- 故障排除指南
- 高级用法

#### `test-plugin.sh`
快速测试脚本，用于本地开发和测试。

## 🚀 使用流程

### 1. 加载插件
```bash
claude --plugin-dir ./website-cloner-plugin
```

### 2. 调用命令
在 Claude Code 中输入：
```
/website-cloner:clone https://example.com
```

### 3. 查看结果
克隆的网站会保存在：
```
cloned-sites/<域名>/
```

## 🔧 工作原理

1. **命令解析**：用户输入 `/website-cloner:clone <URL>`
2. **URL 验证**：检查 URL 格式和可访问性
3. **创建目录**：建立输出目录结构
4. **获取内容**：使用 WebFetch 工具获取 HTML
5. **资源分析**：解析 HTML 中的所有资源引用
6. **下载资源**：批量下载 CSS、JS、图片等
7. **路径修正**：转换绝对路径为相对路径
8. **保存文件**：使用 Write 工具保存所有文件
9. **生成报告**：向用户展示克隆结果

## 🛠️ 技术栈

- **Claude Code Plugin System**：插件框架
- **WebFetch Tool**：网页内容获取
- **Write Tool**：文件写入
- **Bash Tool**：目录创建和文件操作
- **Markdown**：技能和命令定义

## 📦 输出格式

```
cloned-sites/
└── example.com/
    ├── index.html          # 主页面（路径已修正）
    ├── README.md           # 克隆信息
    ├── css/                # 样式文件
    │   └── *.css
    ├── js/                 # JavaScript 文件
    │   └── *.js
    ├── images/             # 图片资源
    │   └── *.png, *.jpg, *.svg
    ├── fonts/              # 字体文件
    │   └── *.woff, *.woff2, *.ttf
    └── assets/             # 其他资源
        └── favicon.ico, manifest.json
```

## 🎯 核心功能

### 1. HTML 处理
- 完整保留 HTML 结构
- 识别所有资源引用
- 修正路径为相对路径

### 2. CSS 处理
- 下载所有样式表
- 处理 @import 规则
- 下载 CSS 中的资源（背景图、字体）
- 更新 url() 引用

### 3. JavaScript 处理
- 下载所有脚本文件
- 保持原始文件结构
- 处理模块依赖

### 4. 资源下载
- 图片（PNG, JPG, SVG, WebP）
- 字体（WOFF, WOFF2, TTF, OTF）
- 图标（favicon, apple-touch-icon）
- 其他静态资源

### 5. 路径转换
- 绝对 URL → 相对路径
- 协议相对 URL 处理
- CDN 链接处理
- 跨域资源处理

## ⚙️ 配置选项

当前版本使用默认配置，未来可以添加：
- 自定义输出目录
- 资源过滤规则
- 下载深度限制
- 并发下载数量
- 超时设置

## 🔄 开发计划

### v1.1.0（计划中）
- [ ] 支持整站爬取（多页面）
- [ ] 添加进度显示
- [ ] 支持断点续传
- [ ] 资源去重优化

### v1.2.0（计划中）
- [ ] 支持 SPA 应用
- [ ] 添加资源压缩
- [ ] 支持自定义配置
- [ ] 批量克隆功能

### v2.0.0（未来）
- [ ] 支持动态内容渲染
- [ ] 添加浏览器自动化
- [ ] 支持认证页面
- [ ] 云端存储集成

## 📝 贡献指南

欢迎贡献代码和建议！

1. Fork 项目
2. 创建特性分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

## 📄 许可证

MIT License - 详见 LICENSE 文件

## 👥 作者

Claude Plus Team

## 🙏 致谢

感谢 Claude Code 团队提供的强大插件系统！
