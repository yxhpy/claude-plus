# Marketplace 结构说明

## ✅ 正确的目录结构

根据 Claude Code 官方文档，marketplace 应该与插件分离。现在的结构如下：

```
claude-plus/
├── plugin-creator-marketplace/      # Plugin Creator 市场
│   └── .claude-plugin/
│       └── marketplace.json        # 指向 ./plugin-creator-plugin
│
├── plugin-creator-plugin/          # Plugin Creator 插件
│   ├── .claude-plugin/
│   │   └── plugin.json            # 只有 plugin.json
│   ├── commands/
│   ├── skills/
│   └── ...
│
├── website-cloner-marketplace/     # Website Cloner 市场
│   └── .claude-plugin/
│       └── marketplace.json        # 指向 ./website-cloner-plugin
│
├── website-cloner-plugin/          # Website Cloner 插件
│   ├── .claude-plugin/
│   │   └── plugin.json
│   └── ...
│
├── codex-marketplace/              # Codex 市场
│   └── .claude-plugin/
│       └── marketplace.json        # 指向 ./codex-plugin
│
└── codex-plugin/                   # Codex 插件
    ├── .claude-plugin/
    │   └── plugin.json
    └── ...
```

## 📋 关键区别

### 插件目录（plugin）
- **包含**: `plugin.json`
- **不包含**: `marketplace.json`
- **用途**: 定义插件本身的元数据和功能

### 市场目录（marketplace）
- **包含**: `marketplace.json`
- **不包含**: `plugin.json`
- **用途**: 列出可用的插件及其源位置

## 🚀 使用方法

### 方法 1：直接使用插件（推荐用于开发）

```bash
# 直接加载插件目录
claude --plugin-dir ./plugin-creator-plugin
```

### 方法 2：通过市场安装

```bash
# 添加市场
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/plugin-creator-marketplace

# 安装插件
/plugin install plugin-creator@plugin-creator-marketplace
```

### 方法 3：同时使用多个插件

```bash
claude --plugin-dir ./plugin-creator-plugin \
       --plugin-dir ./website-cloner-plugin \
       --plugin-dir ./codex-plugin
```

## 📦 三个市场

### 1. Plugin Creator Marketplace
```bash
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/plugin-creator-marketplace
/plugin install plugin-creator@plugin-creator-marketplace
```

### 2. Website Cloner Marketplace
```bash
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/website-cloner-marketplace
/plugin install website-cloner@website-cloner-marketplace
```

### 3. Codex Marketplace
```bash
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/codex-marketplace
/plugin install codex@codex-marketplace
```

## ✨ 为什么这样组织？

### 1. 符合官方规范
- Marketplace 和插件分离是官方推荐的做法
- 避免路径遍历（`..`）问题
- 更清晰的职责分离

### 2. 更灵活的分发
- 可以在一个 marketplace 中列出多个插件
- 插件可以独立开发和测试
- Marketplace 可以指向不同位置的插件（本地、GitHub 等）

### 3. 避免验证错误
- 不使用 `".."` 路径遍历
- 使用相对路径 `"./plugin-name"`
- 符合安全最佳实践

## 🔧 Marketplace.json 正确格式

```json
{
  "name": "marketplace-name",
  "owner": {
    "name": "Owner Name"
  },
  "metadata": {
    "description": "Marketplace description",
    "version": "1.0.0"
  },
  "plugins": [
    {
      "name": "plugin-name",
      "description": "Plugin description",
      "version": "1.0.0",
      "author": {
        "name": "Author Name"
      },
      "homepage": "https://github.com/...",
      "source": "./plugin-directory",
      "license": "MIT"
    }
  ]
}
```

## 📚 参考文档

- [Create and distribute a plugin marketplace](https://code.claude.com/docs/plugin-marketplaces)
- [Discover and install prebuilt plugins](https://code.claude.com/docs/discover-plugins)
- [Plugins reference](https://code.claude.com/docs/plugins-reference)

---

**更新日期**: 2026-01-28
**状态**: ✅ 结构已优化，符合官方规范
