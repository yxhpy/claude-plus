---
description: 快速创建一个新的 Claude Code 插件，自动生成标准结构、配置文件和文档模板
---

# 插件创建命令

你需要帮助用户创建一个新的 Claude Code 插件："$ARGUMENTS"

## 执行步骤

### 1. 解析参数
从 `$ARGUMENTS` 中提取：
- **插件名称**（必需）：例如 "my-plugin"
- **插件描述**（可选）：如果用户提供了描述
- **作者名称**（可选）：默认使用 "Your Name"

如果用户只提供了插件名称，询问他们想要创建什么类型的插件。

### 2. 验证插件名称
- 检查名称是否符合规范（小写字母、数字、连字符）
- 确保名称不与现有插件冲突
- 验证目标目录不存在

### 3. 创建目录结构
使用 Bash 工具创建标准插件结构和独立的 marketplace 目录：

```bash
# 创建插件目录
mkdir -p "<plugin-name>-plugin/.claude-plugin"
mkdir -p "<plugin-name>-plugin/commands"
mkdir -p "<plugin-name>-plugin/skills"

# 创建独立的 marketplace 目录
mkdir -p "<plugin-name>-marketplace/.claude-plugin"
```

### 4. 生成配置文件

#### 4.1 创建 plugin.json
使用 Write 工具在插件目录创建 `.claude-plugin/plugin.json`：

```json
{
  "name": "<plugin-name>",
  "description": "<plugin-description>",
  "version": "1.0.0",
  "author": {
    "name": "<author-name>"
  },
  "homepage": "https://github.com/<username>/<plugin-name>-plugin",
  "repository": "https://github.com/<username>/<plugin-name>-plugin",
  "license": "MIT"
}
```

#### 4.2 创建 marketplace.json
使用 Write 工具在独立的 marketplace 目录创建 `.claude-plugin/marketplace.json`：

**重要**: Marketplace 应该是独立的目录，不在插件目录中。

```json
{
  "name": "<plugin-name>-marketplace",
  "owner": {
    "name": "<author-name>"
  },
  "metadata": {
    "description": "<plugin-name> 插件市场",
    "version": "1.0.0"
  },
  "plugins": [
    {
      "name": "<plugin-name>",
      "description": "<plugin-description>",
      "version": "1.0.0",
      "author": {
        "name": "<author-name>"
      },
      "homepage": "https://github.com/<username>/<plugin-name>-plugin",
      "source": "./<plugin-name>-plugin",
      "license": "MIT"
    }
  ]
}
```

### 5. 创建示例命令
在 `commands/` 目录创建一个示例命令文件 `example.md`：

```markdown
---
description: 示例命令描述
---

# 示例命令

这是一个示例命令。用户运行 /<plugin-name>:example 时会触发此命令。

## 参数
- $ARGUMENTS: 用户提供的参数

## 执行步骤
1. 解析用户输入
2. 执行相应操作
3. 返回结果

## 示例
用户输入：/<plugin-name>:example hello world
你应该：处理 "hello world" 参数并返回结果
```

### 6. 创建示例技能
在 `skills/` 目录创建一个示例技能 `skills/example/SKILL.md`：

```markdown
---
name: example
description: 示例技能描述
---

# 示例技能

这是一个 Agent 技能，Claude 会在适当的时候自动调用。

## 何时使用
当用户请求 [描述场景] 时，使用此技能。

## 执行步骤
1. 分析用户需求
2. 执行相应操作
3. 返回结果
```

### 7. 生成文档文件

#### 7.1 README.md
创建完整的 README.md，包含：
- 插件概述
- 功能特性
- 安装方法（3种方式）
- 使用示例
- 命令列表
- 技能说明
- 配置选项
- 故障排除
- 贡献指南
- 许可证信息

#### 7.2 USAGE_GUIDE.md
创建详细的使用指南，包含：
- 完整的安装步骤
- 所有命令的详细说明
- 使用场景和示例
- 最佳实践
- 性能建议
- 故障排除

#### 7.3 QUICKSTART.md
创建快速开始指南：
- 5分钟快速上手
- 最常用的命令
- 简单示例

#### 7.4 INSTALL.sh
创建可执行的安装脚本：
```bash
#!/bin/bash
echo "🚀 <Plugin Name> 安装指南"
# ... 安装说明
```

#### 7.5 .gitignore
创建 .gitignore 文件：
```
node_modules/
.DS_Store
*.log
.env
```

#### 7.6 LICENSE
创建 MIT 许可证文件

### 8. 创建验证脚本
创建 `validate.sh` 脚本来验证插件结构：

```bash
#!/bin/bash
echo "验证插件结构..."
# 检查必需文件
# 验证 JSON 格式
# 检查文档完整性
```

### 9. 生成项目总结
创建 `PROJECT_STRUCTURE.md` 文档，说明：
- 目录结构
- 文件说明
- 开发指南
- 测试方法

### 10. 输出结果

向用户报告：

```
✅ 插件创建成功！

📦 生成的目录：
- 插件目录: ./<plugin-name>-plugin/
- 市场目录: ./<plugin-name>-marketplace/

📋 插件信息：
- 名称: <plugin-name>
- 描述: <plugin-description>
- 版本: 1.0.0

📁 插件目录文件：
✓ <plugin-name>-plugin/.claude-plugin/plugin.json
✓ <plugin-name>-plugin/commands/example.md
✓ <plugin-name>-plugin/skills/example/SKILL.md
✓ <plugin-name>-plugin/README.md
✓ <plugin-name>-plugin/USAGE_GUIDE.md
✓ <plugin-name>-plugin/QUICKSTART.md
✓ <plugin-name>-plugin/INSTALL.sh
✓ <plugin-name>-plugin/validate.sh
✓ <plugin-name>-plugin/.gitignore
✓ <plugin-name>-plugin/LICENSE
✓ <plugin-name>-plugin/PROJECT_STRUCTURE.md

📁 市场目录文件：
✓ <plugin-name>-marketplace/.claude-plugin/marketplace.json

🚀 下一步：

1. 测试插件（推荐）：
   cd <plugin-name>-plugin
   claude --plugin-dir .

2. 或通过市场安装：
   /plugin marketplace add ./<plugin-name>-marketplace
   /plugin install <plugin-name>@<plugin-name>-marketplace

3. 自定义插件：
   - 编辑 commands/ 中的命令
   - 编辑 skills/ 中的技能
   - 更新 README.md 文档

4. 验证插件：
   cd <plugin-name>-plugin
   ./validate.sh

5. 使用插件：
   /<plugin-name>:example

📚 文档：
- README.md - 项目概述
- USAGE_GUIDE.md - 详细使用指南
- QUICKSTART.md - 快速开始
- PROJECT_STRUCTURE.md - 项目结构说明

💡 提示：
- 插件和市场是分离的（符合官方规范）
- 使用 --plugin-dir 方式最简单
- 在 commands/ 目录添加更多命令
- 在 skills/ 目录添加更多技能
- 更新文档以反映实际功能
- 运行 ./validate.sh 验证结构
```

## 错误处理

如果遇到问题：
- **名称无效**：提示用户使用有效的插件名称（小写、连字符）
- **目录已存在**：询问是否覆盖或使用不同名称
- **权限问题**：提示用户检查目录写入权限

## 最佳实践

1. **命名规范**：使用描述性的名称，如 "code-formatter"、"test-runner"
2. **清晰描述**：在 plugin.json 中提供清晰的插件描述
3. **完整文档**：确保所有文档文件都已生成
4. **示例代码**：提供有用的示例命令和技能
5. **验证脚本**：生成验证脚本帮助用户检查插件结构

## 模板变量

在生成文件时，替换以下变量：
- `<plugin-name>`: 插件名称
- `<plugin-description>`: 插件描述
- `<author-name>`: 作者名称
- `<username>`: GitHub 用户名（如果提供）
- `<current-date>`: 当前日期

开始创建插件吧！记住要生成完整的文件结构和文档。
