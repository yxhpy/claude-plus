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
        │   ├── example.md            # 示例命令 1
        │   ├── help.md               # 帮助命令
        │   └── config.md             # 配置命令
        ├── skills/
        │   ├── example/
        │   │   └── SKILL.md          # 示例技能 1
        │   ├── auto-task/
        │   │   └── SKILL.md          # 自动任务技能
        │   └── helper/
        │       └── SKILL.md          # 辅助技能
        ├── tests/
        │   ├── test-commands.sh      # 命令测试
        │   ├── test-skills.sh        # 技能测试
        │   └── test-integration.sh   # 集成测试
        ├── README.md
        ├── CHANGELOG.md              # 变更日志
        ├── CONTRIBUTING.md           # 贡献指南
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

**3.1 commands/help.md**
帮助命令，显示插件使用说明

**3.2 commands/config.md**
配置命令，管理插件配置

**4. skills/example/SKILL.md**
示例技能文件，包含 frontmatter 和技能定义

**4.1 skills/auto-task/SKILL.md**
自动任务技能，演示 Claude 自动调用

**4.2 skills/helper/SKILL.md**
辅助技能，提供通用功能

**5. tests/ 目录**
完整的测试文件集：

**5.1 tests/test-commands.sh**
```bash
#!/bin/bash
# 测试所有命令是否正常工作
echo "Testing commands..."
# 测试命令加载
# 测试命令执行
echo "✅ Commands test passed"
```

**5.2 tests/test-skills.sh**
```bash
#!/bin/bash
# 测试所有技能是否正常工作
echo "Testing skills..."
# 验证 SKILL.md 格式
# 测试技能加载
echo "✅ Skills test passed"
```

**5.3 tests/test-integration.sh**
```bash
#!/bin/bash
# 集成测试
echo "Running integration tests..."
# 测试插件整体功能
# 测试与 Claude Code 的集成
echo "✅ Integration test passed"
```

**6. README.md**
完整的项目说明文档，包含：
- 插件概述和功能特性
- 安装方法
- 使用示例
- 命令和技能列表
- 项目结构
- 开发和测试指南
- 故障排除
- 贡献指南

**7. CHANGELOG.md**
变更日志文档：
```markdown
# Changelog

## [1.0.0] - YYYY-MM-DD
### Added
- Initial release
- Basic functionality

### Changed
- N/A

### Fixed
- N/A
```

**8. CONTRIBUTING.md**
贡献指南文档：
```markdown
# Contributing Guide

## How to Contribute
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## Development Setup
...

## Testing
...

## Code Style
...
```

**9. validate.sh**
插件验证脚本

**10. .gitignore**
Git 忽略文件

**11. LICENSE**
MIT 许可证

### 4. 示例命令和技能模板

#### commands/example.md 模板
```markdown
---
description: 示例命令，演示基本功能
---

# 示例命令

这是一个示例命令，用于演示插件的基本功能。

## 使用方法

\`\`\`bash
/<plugin-name>:example [参数]
\`\`\`

## 参数说明

- `参数`: 可选参数说明

## 示例

\`\`\`bash
/<plugin-name>:example test
\`\`\`

## 实现

当用户调用此命令时，执行以下操作：
1. 解析参数
2. 执行核心逻辑
3. 返回结果
```

#### commands/help.md 模板
```markdown
---
description: 显示插件帮助信息
---

# 帮助命令

显示 <plugin-name> 插件的完整使用说明。

## 可用命令

- `/<plugin-name>:example` - 示例命令
- `/<plugin-name>:help` - 显示帮助
- `/<plugin-name>:config` - 管理配置

## 可用技能

- `example` - 示例技能（自动调用）
- `auto-task` - 自动任务处理
- `helper` - 辅助功能

## 更多信息

查看 README.md 获取详细文档。
```

#### commands/config.md 模板
```markdown
---
description: 管理插件配置
---

# 配置命令

管理 <plugin-name> 插件的配置选项。

## 使用方法

\`\`\`bash
/<plugin-name>:config [action] [key] [value]
\`\`\`

## 操作

- `get <key>` - 获取配置值
- `set <key> <value>` - 设置配置值
- `list` - 列出所有配置
- `reset` - 重置为默认配置

## 示例

\`\`\`bash
/<plugin-name>:config set debug true
/<plugin-name>:config get debug
/<plugin-name>:config list
\`\`\`
```

#### skills/example/SKILL.md 模板
```markdown
---
name: example
description: 示例技能，当用户需要执行示例任务时自动调用
---

# 示例技能

这是一个示例技能，演示如何创建可被 Claude 自动调用的技能。

## 触发条件

当用户的请求包含以下关键词时，此技能会被自动调用：
- "示例"
- "演示"
- "测试"

## 功能

1. 解析用户输入
2. 执行示例任务
3. 返回结果

## 实现

\`\`\`
步骤 1: 分析用户需求
步骤 2: 执行核心逻辑
步骤 3: 格式化输出
\`\`\`
```

#### skills/auto-task/SKILL.md 模板
```markdown
---
name: auto-task
description: 自动任务处理技能，当检测到需要自动化处理的任务时调用
---

# 自动任务技能

自动检测并处理常见任务，无需用户显式调用。

## 触发条件

- 检测到重复性任务
- 用户请求自动化操作
- 需要批量处理

## 功能

1. 任务识别
2. 自动执行
3. 结果报告

## 示例场景

- 批量文件处理
- 自动化测试
- 定期任务执行
```

#### skills/helper/SKILL.md 模板
```markdown
---
name: helper
description: 辅助功能技能，提供通用的辅助功能支持
---

# 辅助技能

提供通用的辅助功能，支持其他命令和技能。

## 功能

1. 数据验证
2. 格式转换
3. 错误处理
4. 日志记录

## 使用场景

- 输入验证
- 数据格式化
- 错误恢复
- 调试支持
```

### 5. 文档内容模板

#### README.md 模板
创建一个完整的 README.md，整合所有必要信息：

```markdown
# <Plugin Name>

<简短描述>

## ✨ 功能特性

- 功能 1
- 功能 2
- 功能 3

## 📦 安装

### 方法 1：通过 Marketplace（推荐）
\`\`\`bash
/plugin marketplace add <user>/<plugin-name>-marketplace
/plugin install <plugin-name>@<plugin-name>-marketplace
\`\`\`

### 方法 2：本地测试
\`\`\`bash
cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
claude --plugin-dir .
\`\`\`

## 🚀 快速开始

### 基本用法
\`\`\`bash
/<plugin-name>:example
\`\`\`

### 查看帮助
\`\`\`bash
/<plugin-name>:help
\`\`\`

## 📖 命令列表

| 命令 | 描述 |
|------|------|
| `/<plugin-name>:example` | 示例命令 |
| `/<plugin-name>:help` | 显示帮助 |
| `/<plugin-name>:config` | 管理配置 |

## 🤖 技能列表

| 技能 | 描述 | 触发方式 |
|------|------|----------|
| `example` | 示例技能 | 自动 |
| `auto-task` | 自动任务 | 自动 |
| `helper` | 辅助功能 | 自动 |

## 📁 项目结构

\`\`\`
<plugin-name>-marketplace/
├── .claude-plugin/marketplace.json
└── plugins/<plugin-name>-plugin/
    ├── .claude-plugin/plugin.json
    ├── commands/
    ├── skills/
    ├── tests/
    └── README.md
\`\`\`

## 🧪 测试

### 运行所有测试
\`\`\`bash
cd tests
./test-commands.sh
./test-skills.sh
./test-integration.sh
\`\`\`

### 验证插件结构
\`\`\`bash
./validate.sh
\`\`\`

## 🔧 开发

### 修改插件
1. 编辑相关文件
2. 运行测试
3. 验证结构
4. 提交更改

### 添加新命令
\`\`\`bash
touch commands/new-command.md
\`\`\`

### 添加新技能
\`\`\`bash
mkdir -p skills/new-skill
touch skills/new-skill/SKILL.md
\`\`\`

## 🐛 故障排除

### 插件未加载
- 检查 plugin.json 格式
- 验证目录结构
- 查看 Claude Code 日志

### 命令不工作
- 确认命令文件存在
- 检查 frontmatter 格式
- 验证命令语法

### 技能未触发
- 检查 SKILL.md 的 description
- 确认 name 字段正确
- 验证技能逻辑

## 🤝 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md)

## 📝 变更日志

查看 [CHANGELOG.md](CHANGELOG.md)

## 📄 许可证

MIT License - 查看 [LICENSE](LICENSE)

## 🔗 相关链接

- [Claude Code 文档](https://docs.anthropic.com/claude/docs)
- [插件开发指南](https://github.com/...)
- [问题反馈](https://github.com/.../issues)
\`\`\`

#### CHANGELOG.md 模板
\`\`\`markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - YYYY-MM-DD

### Added
- Initial release
- Basic command: example
- Basic skill: example
- Complete documentation

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A
\`\`\`

#### CONTRIBUTING.md 模板
\`\`\`markdown
# Contributing to <Plugin Name>

Thank you for your interest in contributing!

## How to Contribute

### Reporting Bugs
1. Check if the bug already exists in Issues
2. Create a new issue with detailed description
3. Include steps to reproduce
4. Provide system information

### Suggesting Features
1. Check if the feature is already requested
2. Create a new issue with [Feature Request] tag
3. Describe the use case
4. Explain expected behavior

### Submitting Pull Requests

#### Setup Development Environment
\`\`\`bash
git clone <repository>
cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
\`\`\`

#### Development Workflow
1. Fork the repository
2. Create a feature branch: \`git checkout -b feature/my-feature\`
3. Make your changes
4. Run tests: \`./tests/test-*.sh\`
5. Validate: \`./validate.sh\`
6. Commit: \`git commit -m "Add: my feature"\`
7. Push: \`git push origin feature/my-feature\`
8. Create Pull Request

#### Commit Message Guidelines
- Use present tense: "Add feature" not "Added feature"
- Use imperative mood: "Move cursor to..." not "Moves cursor to..."
- Prefix with type: Add, Fix, Update, Remove, Refactor
- Keep first line under 50 characters
- Add detailed description if needed

#### Code Style
- Follow existing code patterns
- Add comments for complex logic
- Update documentation
- Include tests for new features

#### Testing
\`\`\`bash
# Test commands
./tests/test-commands.sh

# Test skills
./tests/test-skills.sh

# Integration tests
./tests/test-integration.sh

# Validate structure
./validate.sh
\`\`\`

## Code Review Process
1. Maintainers review PRs
2. Address feedback
3. Tests must pass
4. Documentation must be updated
5. PR is merged

## Community Guidelines
- Be respectful
- Be constructive
- Help others
- Follow code of conduct

## Questions?
Open an issue or contact maintainers.

Thank you for contributing! 🎉
\`\`\`

#### validate.sh 模板
```bash
#!/bin/bash

echo "🔍 验证插件结构..."

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0

# 检查必需文件
echo "📁 检查必需文件..."
required_files=(
  ".claude-plugin/plugin.json"
  "README.md"
  "LICENSE"
  ".gitignore"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    echo -e "${GREEN}✓${NC} $file"
  else
    echo -e "${RED}✗${NC} $file (缺失)"
    ((ERRORS++))
  fi
done

# 验证 JSON 格式
echo ""
echo "📋 验证 JSON 格式..."
if command -v jq &> /dev/null; then
  if jq empty .claude-plugin/plugin.json 2>/dev/null; then
    echo -e "${GREEN}✓${NC} plugin.json 格式正确"
  else
    echo -e "${RED}✗${NC} plugin.json 格式错误"
    ((ERRORS++))
  fi
else
  echo -e "${YELLOW}⚠${NC} jq 未安装，跳过 JSON 验证"
fi

# 检查命令文件
echo ""
echo "📝 检查命令文件..."
if [ -d "commands" ]; then
  cmd_count=$(find commands -name "*.md" | wc -l)
  echo -e "${GREEN}✓${NC} 找到 $cmd_count 个命令文件"
else
  echo -e "${YELLOW}⚠${NC} commands 目录不存在"
fi

# 检查技能文件
echo ""
echo "🤖 检查技能文件..."
if [ -d "skills" ]; then
  skill_count=$(find skills -name "SKILL.md" | wc -l)
  echo -e "${GREEN}✓${NC} 找到 $skill_count 个技能文件"

  # 验证 SKILL.md 格式
  for skill in $(find skills -name "SKILL.md"); do
    if grep -q "^name:" "$skill" && grep -q "^description:" "$skill"; then
      echo -e "${GREEN}✓${NC} $skill 格式正确"
    else
      echo -e "${RED}✗${NC} $skill 缺少 name 或 description"
      ((ERRORS++))
    fi
  done
else
  echo -e "${YELLOW}⚠${NC} skills 目录不存在"
fi

# 检查测试文件
echo ""
echo "🧪 检查测试文件..."
if [ -d "tests" ]; then
  test_count=$(find tests -name "*.sh" | wc -l)
  echo -e "${GREEN}✓${NC} 找到 $test_count 个测试文件"
else
  echo -e "${YELLOW}⚠${NC} tests 目录不存在"
fi

# 总结
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN}✅ 验证通过！插件结构正确。${NC}"
  exit 0
else
  echo -e "${RED}❌ 发现 $ERRORS 个错误，请修复后重试。${NC}"
  exit 1
fi
```

#### tests/test-commands.sh 模板
```bash
#!/bin/bash

echo "🧪 测试命令..."

# 检查命令文件是否存在
if [ ! -d "commands" ]; then
  echo "❌ commands 目录不存在"
  exit 1
fi

# 测试每个命令文件
for cmd in commands/*.md; do
  if [ -f "$cmd" ]; then
    echo "✓ 测试 $cmd"
    # 检查 frontmatter
    if grep -q "^---" "$cmd"; then
      echo "  ✓ Frontmatter 存在"
    else
      echo "  ✗ Frontmatter 缺失"
      exit 1
    fi
  fi
done

echo "✅ 所有命令测试通过"
exit 0
```

#### tests/test-skills.sh 模板
```bash
#!/bin/bash

echo "🧪 测试技能..."

# 检查技能目录是否存在
if [ ! -d "skills" ]; then
  echo "❌ skills 目录不存在"
  exit 1
fi

# 测试每个技能
for skill in skills/*/SKILL.md; do
  if [ -f "$skill" ]; then
    echo "✓ 测试 $skill"
    # 检查必需字段
    if grep -q "^name:" "$skill" && grep -q "^description:" "$skill"; then
      echo "  ✓ 必需字段存在"
    else
      echo "  ✗ 缺少 name 或 description"
      exit 1
    fi
  fi
done

echo "✅ 所有技能测试通过"
exit 0
```

#### tests/test-integration.sh 模板
```bash
#!/bin/bash

echo "🧪 运行集成测试..."

# 运行所有测试
./tests/test-commands.sh || exit 1
./tests/test-skills.sh || exit 1

# 验证插件结构
./validate.sh || exit 1

echo "✅ 集成测试通过"
exit 0
```

### 6. 生成报告

完成后向用户报告：
- 生成的目录结构
- 插件信息（名称、描述、版本）
- 生成的文件列表（包括测试文件）
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
    ├── commands/
    │   ├── example.md
    │   ├── help.md
    │   └── config.md
    ├── skills/
    │   ├── example/SKILL.md
    │   ├── auto-task/SKILL.md
    │   └── helper/SKILL.md
    ├── tests/
    │   ├── test-commands.sh
    │   ├── test-skills.sh
    │   └── test-integration.sh
    ├── README.md
    ├── CHANGELOG.md
    ├── CONTRIBUTING.md
    ├── validate.sh
    ├── .gitignore
    └── LICENSE

📋 插件信息：
- 名称: <plugin-name>
- 描述: <description>
- 版本: 1.0.0
- 命令数: 3 (example, help, config)
- 技能数: 3 (example, auto-task, helper)
- 测试文件: 3

🚀 快速使用：

1. 直接测试（推荐）：
   cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
   claude --plugin-dir .

2. 运行测试：
   cd <plugin-name>-marketplace/plugins/<plugin-name>-plugin
   ./tests/test-integration.sh

3. 验证结构：
   ./validate.sh

4. 通过市场安装：
   /plugin marketplace add ./<plugin-name>-marketplace
   /plugin install <plugin-name>@<plugin-name>-marketplace

📚 文档说明：
- README.md: 完整的使用文档
- CHANGELOG.md: 版本变更记录
- CONTRIBUTING.md: 贡献指南
- USAGE_GUIDE.md: 详细使用指南
- QUICKSTART.md: 快速入门

🧪 测试指南：
- test-commands.sh: 测试所有命令
- test-skills.sh: 测试所有技能
- test-integration.sh: 运行完整测试套件

💡 下一步：
1. 根据需求修改命令和技能
2. 更新 README.md 中的具体内容
3. 运行测试确保一切正常
4. 提交到 Git 仓库
5. 发布到 GitHub
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
2. **完整性**：生成所有必需文件（plugin.json, marketplace.json, README.md, CHANGELOG.md, CONTRIBUTING.md, validate.sh, .gitignore, LICENSE）
3. **文档质量**：确保 README.md 清晰完整，包含所有必要信息
4. **可执行权限**：为所有 .sh 文件设置执行权限
5. **JSON 格式**：确保所有 JSON 文件格式正确
6. **测试文件**：生成完整的测试套件（test-commands.sh, test-skills.sh, test-integration.sh）
7. **多样性**：提供多个示例命令和技能，展示不同用法
8. **文档完整**：包含 CHANGELOG.md 和 CONTRIBUTING.md

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
