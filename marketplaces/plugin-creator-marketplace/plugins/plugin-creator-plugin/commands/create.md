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
使用 Bash 工具创建符合官方规范的 marketplace 结构：

```bash
# 创建 marketplace 目录结构（插件在 marketplace 内部）
mkdir -p "<plugin-name>-marketplace/.claude-plugin"
mkdir -p "<plugin-name>-marketplace/plugins/<plugin-name>-plugin/.claude-plugin"
mkdir -p "<plugin-name>-marketplace/plugins/<plugin-name>-plugin/commands"
mkdir -p "<plugin-name>-marketplace/plugins/<plugin-name>-plugin/skills"
```

**重要**: 根据 Claude Code 官方规范，插件必须位于 marketplace 目录内部，不允许使用 `..` 进行路径遍历。

### 4. 生成配置文件

#### 4.1 创建 plugin.json
使用 Write 工具在插件目录创建 `.claude-plugin/plugin.json`：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/.claude-plugin/plugin.json`

```json
{
  "name": "<plugin-name>",
  "description": "<plugin-description>",
  "version": "1.0.0",
  "author": {
    "name": "<author-name>"
  },
  "homepage": "https://github.com/<username>/<plugin-name>-marketplace",
  "repository": "https://github.com/<username>/<plugin-name>-marketplace",
  "license": "MIT"
}
```

#### 4.2 创建 marketplace.json
使用 Write 工具在 marketplace 目录创建 `.claude-plugin/marketplace.json`：

**路径**: `<plugin-name>-marketplace/.claude-plugin/marketplace.json`

**重要**: 根据官方规范，source 字段必须指向 marketplace 内部的 plugins 目录，不允许使用 `..` 路径遍历。

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
      "homepage": "https://github.com/<username>/<plugin-name>-marketplace",
      "source": "./plugins/<plugin-name>-plugin",
      "license": "MIT"
    }
  ]
}
```

### 5. 创建示例命令
在 `commands/` 目录创建一个示例命令文件 `example.md`：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/commands/example.md`

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

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/skills/example/SKILL.md`

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
创建一个完整的 README.md，整合所有必要信息：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/README.md`

**内容结构**：
```markdown
# <Plugin Name>

<plugin-description>

## 快速开始

### 安装

**方法 1: 直接加载（推荐开发使用）**
```bash
claude --plugin-dir ./path/to/<plugin-name>-marketplace/plugins/<plugin-name>-plugin
```

**方法 2: 通过 Marketplace 安装**
```bash
/plugin marketplace add ./path/to/<plugin-name>-marketplace
/plugin install <plugin-name>@<plugin-name>-marketplace
```

### 基本使用

```bash
/<plugin-name>:example [参数]
```

## 功能特性

- 示例命令：`/<plugin-name>:example`
- 自动技能：Claude 会在适当时候自动调用

## 命令列表

### `/<plugin-name>:example`
示例命令描述

**用法**：
```bash
/<plugin-name>:example <参数>
```

## 技能

插件包含以下 Agent 技能，Claude 会自动调用：

- **example**: 示例技能描述

## 项目结构

```
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
```

## 开发

### 验证插件

```bash
cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
./validate.sh
```

### 测试插件

```bash
claude --plugin-dir .
```

## 故障排除

### 插件未加载
- 检查 plugin.json 格式是否正确
- 运行 `./validate.sh` 验证结构

### 命令不可用
- 确认插件已正确安装
- 检查命令文件是否存在

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License
```

#### 7.2 .gitignore
创建 .gitignore 文件：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/.gitignore`

```
node_modules/
.DS_Store
*.log
.env
```

#### 7.3 LICENSE
创建 MIT 许可证文件：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/LICENSE`

```
MIT License

Copyright (c) <current-year> <author-name>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### 8. 创建验证脚本
创建 `validate.sh` 脚本来验证插件结构：

**路径**: `<plugin-name>-marketplace/plugins/<plugin-name>-plugin/validate.sh`

```bash
#!/bin/bash
echo "验证插件结构..."
# 检查必需文件
# 验证 JSON 格式
# 检查文档完整性
```

### 9. 输出结果

向用户报告：

```
✅ 插件创建成功！

📦 生成的目录结构：
<plugin-name>-marketplace/
├── .claude-plugin/
│   └── marketplace.json
└── plugins/
    └── <plugin-name>-plugin/
        ├── .claude-plugin/plugin.json
        ├── commands/example.md
        ├── skills/example/SKILL.md
        ├── README.md
        ├── validate.sh
        ├── .gitignore
        └── LICENSE
        ├── validate.sh
        ├── .gitignore
        └── LICENSE

📋 插件信息：
- 名称: <plugin-name>
- 描述: <plugin-description>
- 版本: 1.0.0

🚀 下一步：

1. 测试插件（推荐）：
   cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
   claude --plugin-dir .

2. 或通过市场安装：
   /plugin marketplace add ./<plugin-name>-marketplace
   /plugin install <plugin-name>@<plugin-name>-marketplace

3. 自定义插件：
   - 编辑 plugins/<plugin-name>-plugin/commands/ 中的命令
   - 编辑 plugins/<plugin-name>-plugin/skills/ 中的技能
   - 更新 README.md 文档

4. 验证插件：
   cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
   ./validate.sh

5. 使用插件：
   /<plugin-name>:example

💡 提示：
- 插件位于 marketplace 内部（符合官方规范）
- source 路径使用 ./plugins/<plugin-name>-plugin
- 不允许使用 .. 进行路径遍历
- 使用 --plugin-dir 方式最简单
- 在 commands/ 目录添加更多命令
- 在 skills/ 目录添加更多技能
- README.md 包含完整的使用说明
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
3. **完整文档**：在 README.md 中提供完整的使用说明
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
