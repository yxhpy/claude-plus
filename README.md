# Claude Plus 插件项目

Claude Code 插件生态系统，包含三个功能插件和配套的 marketplace 分发系统。

## 📦 项目结构

```
claude-plus/
├── marketplaces/         # 市场目录
│   ├── plugin-creator-marketplace/
│   │   └── plugins/
│   │       ├── plugin-creator-plugin/    # 元插件：创建其他插件
│   │       └── plugin-updater-plugin/    # 插件更新工具
│   ├── website-cloner-marketplace/
│   │   └── plugins/
│   │       └── website-cloner-plugin/    # 网站克隆插件
│   ├── codex-marketplace/
│   │   └── plugins/
│   │       └── codex-plugin/             # Codex CLI 集成
│   └── gemini-designer-marketplace/
│       └── plugins/
│           └── gemini-designer-plugin/   # Gemini UI/UX 设计插件
│
└── docs/                 # 文档（51个官方文档 + 自定义文档）
```

## 🚀 快速开始

### 直接使用插件（推荐）

```bash
# 使用单个插件
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin

# 同时使用多个插件
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin \
       --plugin-dir ./marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin \
       --plugin-dir ./marketplaces/codex-marketplace/plugins/codex-plugin
```

### 通过 Marketplace 安装

```bash
# 添加本地市场
/plugin marketplace add /path/to/marketplaces/plugin-creator-marketplace

# 安装插件
/plugin install plugin-creator@plugin-creator-marketplace
```

## 📋 插件功能

### 1. Plugin Creator ⭐

创建其他插件的元插件，自动生成完整的插件结构。

```bash
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin
/plugin-creator:create my-plugin "插件描述"
```

**生成内容**：
- 完整插件目录结构
- 配套的 marketplace
- 示例命令和技能
- 完整文档和验证脚本

### 2. Website Cloner

高保真克隆网站，包括 HTML、CSS、JavaScript 和所有静态资源。

```bash
claude --plugin-dir ./marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin
/website-cloner:clone https://example.com
```

**输出位置**：`cloned-sites/<domain>/`

### 3. Codex Plugin

Codex CLI 集成，提供自动化任务执行和代码审查。

```bash
claude --plugin-dir ./marketplaces/codex-marketplace/plugins/codex-plugin
/codex:quick-review          # 快速代码审查
/codex:exec <task>           # 执行任务
```

## 🔧 开发插件

### 创建新插件

```bash
# 1. 使用 Plugin Creator
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin
/plugin-creator:create my-plugin "插件描述"

# 2. 验证插件
cd my-plugin-plugin
./validate.sh
claude plugin validate .

# 3. 测试插件
claude --plugin-dir .
```

### 发布插件

```bash
# 推送到 GitHub
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/my-plugin.git
git push -u origin main

# 用户可以安装
/plugin marketplace add username/my-plugin-marketplace
/plugin install my-plugin@username-my-plugin-marketplace
```

## 📚 文档

- **CLAUDE.md** - Claude Code 工作指南
- **plugins/\*/README.md** - 各插件详细文档
- **docs/** - Claude Code 官方文档和自定义文档

## 📄 许可证

MIT License
