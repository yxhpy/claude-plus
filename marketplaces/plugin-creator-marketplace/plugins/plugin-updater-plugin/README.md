# Plugin Updater

更新现有 Claude Code 插件的配置和内容。

## 快速开始

### 安装

```bash
# 直接加载（推荐）
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-updater-plugin

# 通过 Marketplace
/plugin marketplace add ./marketplaces/plugin-creator-marketplace
/plugin install plugin-updater@plugin-creator-marketplace
```

### 基本使用

```bash
/plugin-updater:update <plugin-path> <requirements>
```

## 功能特性

- ✅ 更新插件配置（版本、描述、作者等）
- ✅ 添加新命令和技能
- ✅ 自动同步 plugin.json 和 marketplace.json
- ✅ 智能版本号管理（语义化版本）
- ✅ 精简优化（删除冗余文档）
- ✅ 自动化脚本支持

## 命令

### `/plugin-updater:update`

更新现有插件的配置和内容。

**示例**：

```bash
# 更新版本和描述
/plugin-updater:update ./plugins/my-plugin "版本升级到 1.1.0，描述改为'增强功能'"

# 添加新命令
/plugin-updater:update ./plugins/my-plugin "添加 format 命令用于代码格式化"

# 精简优化
/plugin-updater:update ./plugins/my-plugin "精简 SKILL.md，删除冗余文档"
```

## 技能

- **update**: 自动更新插件配置和内容（Claude 自动调用）

## 更新类型

### 1. 配置更新
- 版本号（语义化版本规范）
- 描述、作者、主页、仓库
- 许可证、关键词

### 2. 内容更新
- 添加命令（commands/）
- 添加技能（skills/）
- 添加脚本（scripts/）

### 3. 精简优化
- 删除冗余文档
- 精简 skills/commands
- 脚本化自动化

## 版本号规则

- **主版本（Major）**：破坏性变更 - 1.0.0 → 2.0.0
- **次版本（Minor）**：新功能 - 1.0.0 → 1.1.0
- **补丁（Patch）**：Bug 修复 - 1.0.0 → 1.0.1

## 自动化脚本

### update-plugin.sh

快速更新插件版本和描述：

```bash
cd scripts
./update-plugin.sh <plugin-path> <new-version> [description]

# 示例
./update-plugin.sh ../../../codex-plugin 1.2.0 "新增自动化功能"
```

## 项目结构

```
plugin-updater-plugin/
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   └── update.md
├── skills/
│   └── update/
│       └── SKILL.md
├── scripts/
│   └── update-plugin.sh    # 自动化脚本
├── README.md
└── validate.sh
```

## 核心原则

1. **能力优先** - 脚本 > 文档
2. **精简优先** - 删除冗余
3. **脚本化** - 自动化流程

## 开发

```bash
# 验证插件
./validate.sh

# 测试插件
claude --plugin-dir .
```

## 许可证

MIT License
