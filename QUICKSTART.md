# Claude Plus 插件项目 - 快速开始

## 📦 项目结构

```
claude-plus/
├── Marketplaces (市场目录)
│   ├── plugin-creator-marketplace/
│   ├── website-cloner-marketplace/
│   └── codex-marketplace/
│
└── Plugins (插件目录)
    ├── plugin-creator-plugin/
    ├── website-cloner-plugin/
    └── codex-plugin/
```

## 🚀 三种使用方式

### 方式 1：直接使用插件（最快，推荐用于开发）

```bash
cd /Users/yxhpy/PycharmProjects/claude-plus

# 使用单个插件
claude --plugin-dir ./plugin-creator-plugin

# 同时使用多个插件
claude --plugin-dir ./plugin-creator-plugin \
       --plugin-dir ./website-cloner-plugin \
       --plugin-dir ./codex-plugin
```

### 方式 2：通过本地市场安装

```bash
# 添加市场
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/plugin-creator-marketplace
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/website-cloner-marketplace
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/codex-marketplace

# 安装插件
/plugin install plugin-creator@plugin-creator-marketplace
/plugin install website-cloner@website-cloner-marketplace
/plugin install codex@codex-marketplace
```

### 方式 3：从 GitHub 安装（需要先推送）

```bash
# 推送到 GitHub 后
/plugin marketplace add your-username/plugin-creator-marketplace
/plugin install plugin-creator@your-username-plugin-creator-marketplace
```

## 📋 三个插件

### 1. Plugin Creator ⭐
**创建其他插件的元插件**

```bash
# 直接使用
claude --plugin-dir ./plugin-creator-plugin

# 创建新插件
/plugin-creator:create my-plugin "插件描述"
```

### 2. Website Cloner
**克隆网站的插件**

```bash
# 直接使用
claude --plugin-dir ./website-cloner-plugin

# 克隆网站
/website-cloner:clone https://example.com
```

### 3. Codex Plugin
**Codex CLI 集成**

```bash
# 直接使用
claude --plugin-dir ./codex-plugin

# 使用命令
/codex:quick-review
/codex:exec run tests
```

## 🎯 推荐工作流

### 新手入门
1. 使用方式 1（直接加载插件）最简单
2. 测试每个插件的功能
3. 熟悉后再使用市场方式

### 团队协作
1. 将插件和市场推送到 GitHub
2. 团队成员通过市场安装
3. 统一版本管理

### 插件开发
1. 使用 Plugin Creator 创建新插件
2. 使用 `--plugin-dir` 测试
3. 完成后创建对应的 marketplace

## 📚 详细文档

- [完整项目说明](./PLUGINS_README.md)
- [Marketplace 结构说明](./MARKETPLACE_STRUCTURE.md)
- [Marketplace 修复总结](./MARKETPLACE_FIX_SUMMARY.md)

## ✨ 快速测试

```bash
# 1. 测试 Plugin Creator
claude --plugin-dir ./plugin-creator-plugin
# 然后运行: /plugin-creator:create test-plugin

# 2. 测试 Website Cloner
claude --plugin-dir ./website-cloner-plugin
# 然后运行: /website-cloner:clone https://example.com

# 3. 测试 Codex
claude --plugin-dir ./codex-plugin
# 然后运行: /codex:quick-review
```

---

**提示**: 使用 `--plugin-dir` 方式最简单，适合快速测试和开发！
