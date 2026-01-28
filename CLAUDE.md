# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个 Claude Code 插件生态系统项目，包含三个功能插件和配套的 marketplace 分发系统。项目采用插件与市场分离的架构设计。

**核心组件**：
- **marketplaces/** - 3个独立的 marketplace，每个包含对应的插件
  - codex-marketplace (包含 codex-plugin)
  - plugin-creator-marketplace (包含 plugin-creator-plugin)
  - website-cloner-marketplace (包含 website-cloner-plugin)
- **docs/** - 51个官方文档 + 自定义文档

## 快速开始

### 加载插件（推荐开发使用）

```bash
# 单个插件
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin

# 多个插件
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-creator-plugin \
       --plugin-dir ./marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin \
       --plugin-dir ./marketplaces/codex-marketplace/plugins/codex-plugin
```

### 测试插件

```bash
cd marketplaces/<marketplace-name>/plugins/<plugin-name>-plugin
./validate.sh                    # 验证结构
claude plugin validate .         # 官方验证（最可靠）
claude --plugin-dir .           # 本地测试
```

## 架构说明

### 官方推荐的 Marketplace 结构

**关键设计**：根据 Claude Code 官方文档，插件应该位于 marketplace 目录内部，不允许使用 `..` 进行路径遍历。

```
<marketplace-name>/
├── .claude-plugin/
│   └── marketplace.json         # Marketplace 配置
└── plugins/
    └── <plugin-name>-plugin/    # 插件本身
        └── .claude-plugin/
            └── plugin.json      # 插件配置
```

**marketplace.json 中的 source 字段**：
```json
{
  "plugins": [{
    "source": "./plugins/<plugin-name>-plugin"  // 相对路径指向插件
  }]
}
```

### 标准插件结构

```
<plugin-name>-plugin/
├── .claude-plugin/
│   └── plugin.json              # 插件元数据（必需）
├── commands/                    # 用户命令（显式调用）
│   └── *.md                    # 命令文件
├── skills/                      # Agent 技能（自动调用）
│   └── <skill-name>/
│       └── SKILL.md            # 必须包含 name 和 description
├── README.md
├── QUICKSTART.md
├── USAGE_GUIDE.md
├── validate.sh                  # 验证脚本
└── INSTALL.sh                   # 安装脚本
```

### Commands vs Skills

- **Commands**: 用户显式调用 `/plugin-name:command-name`
- **Skills**: Claude 根据上下文自动调用，SKILL.md 必须包含 `name` 和 `description` 字段

## 插件功能

### 1. Plugin Creator（元插件）⭐

创建其他插件的脚手架工具。

```bash
/plugin-creator:create my-plugin "插件描述"
```

**生成内容**：
- 完整插件目录结构（12个文件）
- 独立的 marketplace 目录
- 示例命令和技能
- 验证和安装脚本
- 完整文档

### 2. Website Cloner

高保真克隆网站，包括 HTML、CSS、JavaScript 和静态资源。

```bash
/website-cloner:clone https://example.com
```

**输出位置**：`cloned-sites/<domain>/`

**技术特点**：
- 递归下载所有资源（CSS、JS、图片、字体）
- 智能路径修正（绝对路径转相对路径）
- 处理 CSS 中的 @import 和 url()
- 支持本地预览

### 3. Codex Plugin

Codex CLI 集成，提供自动化任务执行和代码审查。

**用户命令**：
- `/codex:quick-review [focus]` - 快速代码审查
- `/codex:exec <task>` - 执行任务
- `/codex:resume [session]` - 恢复会话
- `/codex:apply` - 应用差异

**Agent 技能**：
- `exec` - 自动执行 Codex 任务
- `review` - 自动代码审查

**安全特性**：默认使用 read-only 沙箱，仅在必要时升级权限。

## 开发工作流

### 创建新插件

**使用 Plugin Creator（推荐）**：
```bash
# 1. 加载 Plugin Creator
claude --plugin-dir ./plugins/plugin-creator-plugin

# 2. 创建新插件
/plugin-creator:create my-plugin "插件描述"

# 3. 自动生成完整结构
# - my-plugin-plugin/ 目录
# - my-plugin-marketplace/ 目录
# - 所有必需文件和文档
```

### 验证和测试

```bash
cd my-plugin-plugin

# 1. 验证结构
./validate.sh

# 2. 官方验证（最可靠）
claude plugin validate .

# 3. 检查 JSON 格式
cat .claude-plugin/plugin.json | jq

# 4. 本地测试
claude --plugin-dir .
```

### 发布插件

```bash
# 1. 初始化 Git
git init
git add .
git commit -m "Initial commit: My Plugin"

# 2. 推送到 GitHub
git remote add origin https://github.com/username/my-plugin.git
git push -u origin main

# 3. 用户可以安装
/plugin marketplace add username/my-plugin-marketplace
/plugin install my-plugin@username-my-plugin-marketplace
```

## 配置文件说明

### plugin.json 格式

```json
{
  "name": "plugin-name",
  "description": "插件描述",
  "version": "1.0.0",
  "author": {"name": "作者名称"},
  "homepage": "https://github.com/...",
  "repository": "https://github.com/...",  // 注意：必须是字符串，不是对象
  "license": "MIT",
  "keywords": ["关键词"]
}
```

### marketplace.json 格式

```json
{
  "name": "marketplace-name",
  "owner": {"name": "Owner Name"},        // 必需字段
  "metadata": {
    "description": "市场描述",
    "version": "1.0.0"
  },
  "plugins": [{
    "name": "plugin-name",
    "description": "插件描述",
    "version": "1.0.0",
    "author": {"name": "作者"},
    "homepage": "https://...",
    "source": "./plugins/<plugin-name>-plugin",  // 相对路径
    "license": "MIT"
  }]
}
```

### SKILL.md 格式

```yaml
---
name: skill-name          # 必需
description: 技能描述，说明何时使用  # 必需
---

# 技能实现内容
```

## 常见问题

### plugin.json 格式错误

**错误**：repository 使用对象格式
```json
"repository": {"type": "git", "url": "..."}  // ❌ 错误
```

**正确**：使用字符串格式
```json
"repository": "https://github.com/..."  // ✅ 正确
```

### SKILL.md 缺少必需字段

**错误**：缺少 `name` 字段
```yaml
---
description: 技能描述
---
```

**正确**：必须包含 name 和 description
```yaml
---
name: skill-name
description: 技能描述
---
```

### marketplace source 路径规则

**重要**：根据 Claude Code 官方规范，source 路径不允许使用 `..` 进行路径遍历（安全限制）。

**正确**：插件位于 marketplace 内部
```json
"source": "./plugins/plugin-name-plugin"  // ✅ 正确
```

**错误**：使用 `..` 访问外部目录
```json
"source": "../../plugins/plugin-name-plugin"  // ❌ 错误（路径遍历不允许）
```

### 插件和 marketplace 的正确结构

**正确**：插件位于 marketplace 内部
```
marketplace-name/
├── .claude-plugin/marketplace.json
└── plugins/plugin-name/
    └── .claude-plugin/plugin.json
```

**错误**：插件和 marketplace 分离
```
project/
├── plugins/plugin-name/          # ❌ 错误
└── marketplaces/marketplace-name/ # ❌ 错误
```

### 插件创建规范 ⚠️

**重要**：创建插件时必须遵循以下规范，避免硬编码用户特定信息。

#### 1. 禁止硬编码用户路径

**错误示例**：
```bash
# ❌ 错误：硬编码用户名
ENV_FILE="C:/Users/liuguohao/.config/app.env"
CONFIG_PATH="/home/username/.app/config"
```

**正确示例**：
```bash
# ✅ 正确：使用环境变量和通用路径
ENV_FILE="${APP_ENV_FILE:-$HOME/.config/app.env}"
CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/app"
```

#### 2. 使用跨平台路径表示

**文档中的路径示例**：
```markdown
# ✅ 正确：提供多平台示例
**Windows**: `%USERPROFILE%\.app\.env`
**Linux/Mac**: `~/.app/.env`

# 或使用通用表示
配置文件位置：`~/.app/.env`
```

#### 3. 支持自定义配置路径

**脚本中应支持环境变量覆盖**：
```bash
# ✅ 正确：允许用户自定义路径
CONFIG_FILE="${MY_APP_CONFIG:-$HOME/.app/config.json}"

# 在文档中说明
export MY_APP_CONFIG=/custom/path/config.json
```

#### 4. 插件生成位置规范

**必须**：新插件应生成到 `marketplaces/` 目录下

```bash
# ✅ 正确
marketplaces/
└── new-plugin-marketplace/
    └── plugins/
        └── new-plugin-plugin/

# ❌ 错误：生成到项目根目录
new-plugin-marketplace/  # 不应该在根目录
```

#### 5. 敏感信息处理

**禁止在插件代码中包含**：
- 用户名
- 绝对路径（除非必要）
- API 密钥
- 个人邮箱
- 特定机器的配置

**正确做法**：
- 使用环境变量
- 提供配置模板
- 在文档中说明如何配置
- 使用相对路径或 `$HOME`

#### 6. 验证清单

创建插件后，检查以下内容：

```bash
# 检查是否包含用户特定路径
grep -r "Users/[^/]*/" .
grep -r "/home/[^/]*/" .

# 检查是否包含硬编码的用户名
grep -r "username" .
grep -r "liuguohao" .  # 替换为实际用户名

# 确认插件位置正确
pwd  # 应该在 marketplaces/<plugin-name>-marketplace/
```

## 项目特色

### 元编程能力

Plugin Creator 可以创建其他插件，实现"用插件创建插件"的元编程思想。

### 完整的生态系统

- 3个功能插件 + 1个测试插件
- 配套的 marketplace 分发系统
- 完整的文档体系（51个官方文档 + 自定义文档）

### 生产就绪

- 所有插件通过官方验证
- 完整的测试和验证脚本
- 清晰的安装和使用文档

## 参考资源

- **快速开始**：`QUICKSTART.md`
- **完整说明**：`PLUGINS_README.md`
- **项目概览**：`PROJECT_OVERVIEW.md`
- **Marketplace 结构**：`MARKETPLACE_STRUCTURE.md`
- **官方文档**：`docs/official/` (51个文档)
- **自定义文档**：`docs/custom/`
