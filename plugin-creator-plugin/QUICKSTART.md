# Plugin Creator - 快速开始

5分钟快速上手 Plugin Creator，创建你的第一个 Claude Code 插件！

## 🚀 第一步：安装 Plugin Creator

选择一种安装方式：

### 最快方式（推荐用于测试）
```bash
cd /Users/yxhpy/PycharmProjects/claude-plus
claude --plugin-dir ./plugin-creator-plugin
```

### 永久安装
```bash
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/plugin-creator-plugin
/plugin install plugin-creator@plugin-creator-marketplace
```

## 📦 第二步：创建你的第一个插件

### 基本创建
```bash
/plugin-creator:create my-first-plugin
```

系统会询问：
- 插件描述
- 作者名称

### 快速创建（带所有信息）
```bash
/plugin-creator:create my-first-plugin "我的第一个插件"
```

## 📁 第三步：查看生成的文件

```bash
cd my-first-plugin-plugin
ls -la
```

你会看到：
```
my-first-plugin-plugin/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/
│   └── example.md
├── skills/
│   └── example/
│       └── SKILL.md
├── README.md
├── USAGE_GUIDE.md
├── QUICKSTART.md
├── INSTALL.sh
├── validate.sh
├── .gitignore
├── LICENSE
└── PROJECT_STRUCTURE.md
```

## ✅ 第四步：验证插件

```bash
./validate.sh
```

如果看到 "✅ 验证通过！"，说明插件结构正确。

## 🧪 第五步：测试插件

```bash
claude --plugin-dir .
```

在 Claude Code 中测试示例命令：
```bash
/my-first-plugin:example hello world
```

## 🎨 第六步：自定义插件

### 1. 添加新命令
创建 `commands/my-command.md`：

```markdown
---
description: 我的自定义命令
---

# 我的命令

这是我的自定义命令实现...
```

### 2. 添加新技能
创建 `skills/my-skill/SKILL.md`：

```markdown
---
name: my-skill
description: 我的自定义技能
---

# 我的技能

这是我的自定义技能实现...
```

### 3. 更新文档
编辑 `README.md`，添加实际功能说明。

## 🚀 第七步：使用你的插件

重新加载插件：
```bash
claude --plugin-dir .
```

使用新命令：
```bash
/my-first-plugin:my-command
```

## 📚 常用命令速查

| 命令 | 说明 |
|------|------|
| `/plugin-creator:create <name>` | 创建新插件 |
| `./validate.sh` | 验证插件结构 |
| `claude --plugin-dir .` | 测试插件 |
| `./INSTALL.sh` | 查看安装指南 |

## 💡 实用技巧

### 技巧 1：快速原型
```bash
# 创建插件
/plugin-creator:create prototype

# 立即测试
cd prototype-plugin
claude --plugin-dir .
```

### 技巧 2：批量创建
```bash
# 创建多个相关插件
/plugin-creator:create data-loader
/plugin-creator:create data-processor
/plugin-creator:create data-exporter
```

### 技巧 3：从示例学习
生成的 `commands/example.md` 和 `skills/example/SKILL.md` 包含完整的示例代码，可以作为参考。

## 🐛 遇到问题？

### 插件未加载
```bash
# 检查结构
./validate.sh

# 检查 JSON 格式
cat .claude-plugin/plugin.json | jq
```

### 命令不可用
```bash
# 重启 Claude Code
# 确认插件已加载
/plugin
```

### 需要帮助
查看完整文档：
- `README.md` - 完整说明
- `USAGE_GUIDE.md` - 详细指南
- `PROJECT_STRUCTURE.md` - 结构说明

## 🎯 下一步

1. **学习示例**: 查看生成的示例命令和技能
2. **阅读文档**: 深入了解插件开发
3. **实现功能**: 添加实际的命令和技能
4. **分享插件**: 推送到 GitHub 供他人使用

## 📖 推荐阅读

- [完整 README](./README.md)
- [详细使用指南](./USAGE_GUIDE.md)
- [Claude Code 插件文档](https://code.claude.com/docs/plugins)

---

**恭喜！** 🎉 你已经创建了第一个 Claude Code 插件！

现在开始添加你的自定义功能吧！
