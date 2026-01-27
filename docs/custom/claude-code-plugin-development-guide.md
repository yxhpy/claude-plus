# Claude Code 插件开发实战指南

> 基于实际开发 Codex 插件的经验总结

本指南记录了开发 Claude Code 插件过程中遇到的实际问题和解决方案，帮助你避免常见陷阱。

## 核心经验教训

### 1. 使用 `skills/` 目录，不是 `commands/`

**❌ 错误做法：**
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── commands/           # 错误！
    ├── hello.md
    └── review.md
```

**✅ 正确做法：**
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/             # 正确！
    ├── hello/
    │   └── SKILL.md
    └── review/
        └── SKILL.md
```

**原因：** Claude Code 2.x 版本使用 `skills/` 目录结构，每个技能是一个包含 `SKILL.md` 的文件夹。

### 2. plugin.json 格式要求

**❌ 错误的 repository 格式：**
```json
{
  "name": "my-plugin",
  "repository": {
    "type": "git",
    "url": "https://github.com/user/repo"
  }
}
```

**✅ 正确的 repository 格式：**
```json
{
  "name": "my-plugin",
  "repository": "https://github.com/user/repo"
}
```

**验证方法：**
```bash
claude plugin validate ./my-plugin
```

### 3. SKILL.md 必需字段

**❌ 缺少 name 字段：**
```yaml
---
description: Do something useful
---
```

**✅ 包含所有必需字段：**
```yaml
---
name: my-skill
description: Do something useful. Use when the user asks for X.
---
```

**必需字段：**
- `name`: 技能名称（与目录名一致）
- `description`: 技能描述（说明何时使用）

### 4. 技能类型：用户调用 vs 代理调用

#### 用户调用技能
用户使用 `/plugin-name:skill-name` 显式调用。

**示例：**
```yaml
---
name: quick-review
description: Quick code review using Codex. Use when the user explicitly asks for a code review.
---

# Quick Review

Run a fast code review on current changes.

## What to do
1. Check git status
2. Run codex review
3. Present findings
```

**使用：**
```
/codex:quick-review
```

#### 代理调用技能
Claude 根据上下文自动调用。

**示例：**
```yaml
---
name: review
description: Perform code review. Use when analyzing code quality, security, or best practices.
---

# Code Review Skill

You are a code review specialist...
```

**使用：**
```
用户: "Can you review my code for security issues?"
Claude: [自动使用 review 技能]
```

## 开发流程最佳实践

### 1. 创建插件结构

```bash
# 创建基本结构
mkdir -p my-plugin/.claude-plugin
mkdir -p my-plugin/skills/my-skill

# 创建清单
cat > my-plugin/.claude-plugin/plugin.json << 'EOF'
{
  "name": "my-plugin",
  "description": "My awesome plugin",
  "version": "1.0.0",
  "author": {
    "name": "Your Name"
  }
}
EOF

# 创建技能
cat > my-plugin/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: Does something useful. Use when the user asks for help with X.
---

# My Skill

Instructions for Claude on how to use this skill...
EOF
```

### 2. 验证插件

**始终先验证：**
```bash
claude plugin validate ./my-plugin
```

**期望输出：**
```
✔ Validation passed
```

**如果有错误：**
```
✘ Found 1 error:
  ❯ repository: Invalid input: expected string, received object
```

立即修复错误，然后重新验证。

### 3. 测试插件

**快速测试：**
```bash
# 测试特定技能
claude --plugin-dir ./my-plugin -p "/my-plugin:my-skill" --print

# 交互式测试
claude --plugin-dir ./my-plugin
```

**验证技能加载：**
```bash
# 在 Claude Code 中
/help

# 应该看到
/my-plugin:my-skill - Does something useful
```

### 4. 调试技巧

#### 问题：技能不出现

**检查清单：**
1. ✅ 目录结构正确？`skills/skill-name/SKILL.md`
2. ✅ SKILL.md 有 name 字段？
3. ✅ plugin.json 格式正确？
4. ✅ 运行了 `claude plugin validate`？

**调试命令：**
```bash
# 检查结构
find my-plugin -name "SKILL.md"

# 验证 JSON
cat my-plugin/.claude-plugin/plugin.json | python3 -m json.tool

# 官方验证
claude plugin validate ./my-plugin
```

#### 问题：技能加载但不工作

**检查：**
1. description 是否清楚说明何时使用？
2. 技能内容是否给出明确指令？
3. 是否需要外部命令（如 codex）已安装？

**测试：**
```bash
# 直接测试技能
claude --plugin-dir ./my-plugin -p "/my-plugin:skill-name" --print
```

## 常见错误和解决方案

### 错误 1: "repository: Invalid input"

**原因：** repository 字段使用了对象格式

**解决：**
```json
// 改为字符串
"repository": "https://github.com/user/repo"
```

### 错误 2: 技能不出现在 /help 中

**原因：** 使用了 `commands/` 而不是 `skills/`

**解决：**
```bash
# 重组结构
mkdir -p skills/my-skill
mv commands/my-skill.md skills/my-skill/SKILL.md
rmdir commands
```

### 错误 3: "Missing 'name' field"

**原因：** SKILL.md frontmatter 缺少 name

**解决：**
```yaml
---
name: skill-name  # 添加这一行
description: ...
---
```

### 错误 4: 技能加载但 Claude 不使用

**原因：** description 不够清楚

**解决：**
```yaml
# ❌ 不清楚
description: Review code

# ✅ 清楚
description: Perform code review. Use when the user asks to analyze code quality, security, or best practices.
```

## 插件开发检查清单

### 创建阶段
- [ ] 创建 `.claude-plugin/plugin.json`
- [ ] 设置正确的 name, description, version
- [ ] repository 使用字符串格式
- [ ] 创建 `skills/` 目录
- [ ] 每个技能有自己的目录
- [ ] 每个 SKILL.md 有 name 和 description

### 验证阶段
- [ ] 运行 `claude plugin validate`
- [ ] 修复所有错误和警告
- [ ] 检查目录结构
- [ ] 验证 JSON 格式

### 测试阶段
- [ ] 使用 `--plugin-dir` 加载插件
- [ ] 测试每个技能命令
- [ ] 验证技能出现在 `/help` 中
- [ ] 测试代理自动调用（如适用）

### 发布阶段
- [ ] 编写 README.md
- [ ] 添加使用示例
- [ ] 记录依赖项
- [ ] 提供安装说明

## 实用工具脚本

### 验证脚本

```bash
#!/bin/bash
# validate-plugin.sh

PLUGIN_DIR=$1

if [ -z "$PLUGIN_DIR" ]; then
    echo "Usage: $0 <plugin-directory>"
    exit 1
fi

echo "🔍 Validating plugin structure..."

# Check manifest
if [ ! -f "$PLUGIN_DIR/.claude-plugin/plugin.json" ]; then
    echo "❌ Missing plugin.json"
    exit 1
fi

# Check skills directory
if [ ! -d "$PLUGIN_DIR/skills" ]; then
    echo "❌ Missing skills/ directory"
    exit 1
fi

# Validate with Claude
echo "🔍 Running official validation..."
claude plugin validate "$PLUGIN_DIR"

if [ $? -eq 0 ]; then
    echo "✅ Plugin is valid!"
else
    echo "❌ Validation failed"
    exit 1
fi
```

### 快速测试脚本

```bash
#!/bin/bash
# test-plugin.sh

PLUGIN_DIR=$1
SKILL=$2

if [ -z "$PLUGIN_DIR" ] || [ -z "$SKILL" ]; then
    echo "Usage: $0 <plugin-dir> <skill-name>"
    exit 1
fi

PLUGIN_NAME=$(cat "$PLUGIN_DIR/.claude-plugin/plugin.json" | python3 -c "import sys, json; print(json.load(sys.stdin)['name'])")

echo "🧪 Testing /$PLUGIN_NAME:$SKILL..."
claude --plugin-dir "$PLUGIN_DIR" -p "/$PLUGIN_NAME:$SKILL" --print
```

## 参考资源

### 官方文档
- [Claude Code 插件文档](https://code.claude.com/docs/plugins)
- [技能开发指南](https://code.claude.com/docs/skills)

### 验证命令
```bash
# 验证插件
claude plugin validate <path>

# 列出已安装插件
claude plugin list

# 安装插件
claude plugin install <plugin>
```

### 示例插件结构

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json          # 清单文件
├── skills/                   # 技能目录
│   ├── hello/               # 用户调用技能
│   │   └── SKILL.md
│   └── auto-review/         # 代理调用技能
│       └── SKILL.md
├── README.md                 # 文档
└── validate.sh              # 验证脚本
```

## 总结

### 关键要点

1. **使用 `skills/` 目录** - 不是 `commands/`
2. **验证是关键** - 始终运行 `claude plugin validate`
3. **repository 是字符串** - 不是对象
4. **SKILL.md 需要 name** - 必需字段
5. **description 要清楚** - 说明何时使用技能

### 开发流程

```
创建结构 → 验证 → 测试 → 修复 → 重新验证 → 发布
```

### 最重要的命令

```bash
# 验证插件
claude plugin validate ./my-plugin

# 测试插件
claude --plugin-dir ./my-plugin

# 测试特定技能
claude --plugin-dir ./my-plugin -p "/my-plugin:skill" --print
```

遵循这些经验教训，你可以避免常见陷阱，快速开发出可靠的 Claude Code 插件！🚀
