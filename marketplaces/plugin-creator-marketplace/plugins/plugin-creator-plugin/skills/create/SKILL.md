---
name: create
description: 自动创建 Claude Code 插件的完整结构，包括配置文件、命令、技能和文档
---

# 插件创建技能

你是一个专业的 Claude Code 插件脚手架生成器。当用户想要创建新插件时，你需要生成完整的插件结构。

## 输入参数
- `$ARGUMENTS`: 插件名称和可选的描述

## 创建流程

### 1. 参数解析
从用户输入中提取：
- 插件名称（必需）
- 插件描述（可选，如果未提供则询问）
- 作者名称（可选，默认 "Your Name"）

### 2. 验证和准备
- 验证插件名称格式（小写、连字符、数字）
- 检查目标目录是否已存在
- 确认用户意图

### 3. 生成插件结构

#### 目录结构
```
<plugin-name>-marketplace/            # Marketplace 目录（根据官方规范）
├── .claude-plugin/
│   └── marketplace.json              # Marketplace 配置
└── plugins/
    └── <plugin-name>-plugin/         # 插件在 marketplace 内部
        ├── .claude-plugin/
        │   └── plugin.json           # 插件配置
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

#### 必需文件

**1. <plugin-name>-marketplace/plugins/<plugin-name>-plugin/.claude-plugin/plugin.json**
```json
{
  "name": "<plugin-name>",
  "description": "<description>",
  "version": "1.0.0",
  "author": {"name": "<author>"},
  "homepage": "https://github.com/<user>/<plugin-name>-marketplace",
  "repository": "https://github.com/<user>/<plugin-name>-marketplace",
  "license": "MIT"
}
```

**2. <plugin-name>-marketplace/.claude-plugin/marketplace.json**
```json
{
  "name": "<plugin-name>-marketplace",
  "owner": {
    "name": "<author>"
  },
  "metadata": {
    "description": "<plugin-name> 插件市场",
    "version": "1.0.0"
  },
  "plugins": [{
    "name": "<plugin-name>",
    "description": "<description>",
    "version": "1.0.0",
    "author": {"name": "<author>"},
    "homepage": "https://github.com/<user>/<plugin-name>-marketplace",
    "source": "./plugins/<plugin-name>-plugin",
    "license": "MIT"
  }]
}
```

**重要**: 根据 Claude Code 官方规范，插件必须位于 marketplace 内部，source 字段使用 `./plugins/<plugin-name>-plugin`，不允许使用 `..` 进行路径遍历。

**3. commands/example.md**
示例命令文件，包含 frontmatter 和指令

**4. skills/example/SKILL.md**
示例技能文件，包含 frontmatter 和技能定义

**5. README.md**
完整的项目说明文档，包含：
- 插件概述和功能特性
- 安装方法
- 使用示例
- 命令和技能列表
- 项目结构
- 开发和测试指南
- 故障排除
- 贡献指南

**6. validate.sh**
插件验证脚本

**7. .gitignore**
Git 忽略文件

**8. LICENSE**
MIT 许可证

### 4. 文档内容模板

#### README.md 模板
创建一个完整的 README.md，整合所有必要信息（快速开始、安装、使用、项目结构、开发指南、故障排除等）
- 性能建议
- 完整的故障排除指南

#### validate.sh 模板
```bash
#!/bin/bash
echo "验证插件结构..."
# 检查必需文件
# 验证 JSON 格式
# 检查文档完整性
echo "✅ 验证通过！"
```

### 5. 生成报告

完成后向用户报告：
- 生成的目录结构
- 插件信息（名称、描述、版本）
- 生成的文件列表
- 下一步操作指南
- 测试方法

**报告格式示例**：
```
✅ 插件创建成功！

📦 生成的目录结构：
<plugin-name>-marketplace/
├── .claude-plugin/marketplace.json
└── plugins/<plugin-name>-plugin/
    ├── .claude-plugin/plugin.json
    ├── commands/example.md
    ├── skills/example/SKILL.md
    ├── README.md
    ├── validate.sh
    ├── .gitignore
    └── LICENSE

📋 插件信息：
- 名称: <plugin-name>
- 描述: <description>
- 版本: 1.0.0

🚀 快速使用：
1. 直接测试（推荐）：
   cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
   claude --plugin-dir .

2. 通过市场安装：
   /plugin marketplace add ./<plugin-name>-marketplace
   /plugin install <plugin-name>@<plugin-name>-marketplace
```

## 使用示例

### 示例 1：基本创建
```
用户：创建一个代码格式化插件
你：
1. 询问插件名称建议："code-formatter"
2. 生成完整结构
3. 提供使用说明
```

### 示例 2：带描述创建
```
用户：创建一个名为 test-runner 的插件，用于运行测试
你：
1. 使用提供的名称和描述
2. 生成完整结构
3. 提供使用说明
```

## 注意事项

1. **命名规范**：确保插件名称符合规范
2. **完整性**：生成所有必需文件（plugin.json, marketplace.json, README.md, validate.sh, .gitignore, LICENSE）
3. **文档质量**：确保 README.md 清晰完整，包含所有必要信息
4. **可执行权限**：为 .sh 文件设置执行权限
5. **JSON 格式**：确保所有 JSON 文件格式正确

## 实现细节

1. 使用 Bash 工具创建目录
2. 使用 Write 工具创建文件
3. 使用模板替换变量
4. 设置文件权限
5. 验证生成的结构

## 错误处理

- 名称无效：提示正确格式
- 目录已存在：询问是否覆盖
- 权限问题：提示检查权限
- 生成失败：提供详细错误信息

开始创建插件吧！确保生成完整、专业的插件结构。
