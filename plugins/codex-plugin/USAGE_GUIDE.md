# Codex Plugin - 完整使用指南

## 🎯 插件概述

Codex Plugin 是一个强大的 Claude Code 插件，集成了 Codex CLI 功能，提供：
- 🤖 **自动化任务执行**：非交互式运行 Codex 任务
- 🔍 **代码审查**：快速运行自动化代码审查
- 📝 **会话管理**：恢复和管理 Codex 会话
- ✅ **变更应用**：应用 Codex 生成的代码差异

## 📦 安装方法

### 方法 1：本地开发模式（推荐用于测试）

直接使用插件目录启动 Claude Code：

```bash
cd /Users/yxhpy/PycharmProjects/claude-plus
claude --plugin-dir ./codex-plugin
```

这种方式适合：
- 插件开发和调试
- 快速测试功能
- 不需要安装到系统

### 方法 2：通过本地市场安装

1. **添加本地市场**：
   ```bash
   /plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/marketplaces/codex-marketplace
   ```

2. **查看可用插件**：
   ```bash
   /plugin
   ```
   切换到 **Discover** 标签页，找到 `codex` 插件

3. **安装插件**：
   ```bash
   /plugin install codex@local-codex
   ```

### 方法 3：通过 GitHub 分发（推荐用于团队使用）

1. **将插件推送到 GitHub**：
   ```bash
   cd codex-plugin
   git init
   git add .
   git commit -m "Initial commit: Codex Plugin"
   git remote add origin https://github.com/your-username/codex-plugin.git
   git push -u origin main
   ```

2. **其他用户安装**：
   ```bash
   /plugin marketplace add your-username/codex-plugin
   /plugin install codex@your-username-codex-plugin
   ```

## 🚀 使用方法

### 1. 快速代码审查

运行快速代码审查，检查当前更改：

```bash
/codex:quick-review
```

指定审查重点：

```bash
# 安全审查
/codex:quick-review security

# 性能审查
/codex:quick-review performance

# 代码质量审查
/codex:quick-review quality
```

### 2. 执行 Codex 任务

非交互式执行 Codex 任务：

```bash
# 运行测试
/codex:exec run all unit tests

# 生成文档
/codex:exec update API documentation

# 分析代码
/codex:exec analyze code quality

# 修复问题
/codex:exec fix linting errors
```

### 3. 恢复会话

恢复之前的 Codex 会话：

```bash
# 显示会话选择器
/codex:resume

# 恢复最后一个会话
/codex:resume last

# 恢复特定会话
/codex:resume <session-id>
```

### 4. 应用更改

应用 Codex 生成的最新代码差异：

```bash
/codex:apply
```

## 💡 使用场景

### 场景 1：安全审查工作流

```bash
# 1. 进行代码更改
git add .

# 2. 运行安全审查
/codex:quick-review security

# 3. 如果发现问题，自动修复
/codex:exec fix security issues found in review

# 4. 应用修复
/codex:apply

# 5. 再次审查确认
/codex:quick-review security
```

### 场景 2：自动化测试

```bash
# 1. 非交互式运行所有测试
/codex:exec run all tests and report failures

# 2. 如果测试失败，分析原因
/codex:exec analyze test failures and suggest fixes

# 3. 应用建议的修复
/codex:apply

# 4. 重新运行测试
/codex:exec run all tests
```

### 场景 3：文档更新

```bash
# 1. 生成文档
/codex:exec update README with current API

# 2. 审查更改
/codex:quick-review

# 3. 如果满意，应用更改
/codex:apply

# 4. 提交更改
git add README.md
git commit -m "Update API documentation"
```

### 场景 4：代码重构

```bash
# 1. 执行重构任务
/codex:exec refactor authentication module for better testability

# 2. 审查重构结果
/codex:quick-review

# 3. 运行测试确保功能正常
/codex:exec run tests for authentication module

# 4. 应用更改
/codex:apply
```

## 🎨 Agent Skills（自动技能）

Claude 会在适当的时候自动使用这些技能：

### exec 技能
当您请求自动化任务执行时，Claude 可能会使用 `exec` 技能来非交互式运行 Codex。

**示例触发场景**：
- "帮我运行所有测试"
- "自动生成 API 文档"
- "分析代码质量问题"

### review 技能
当您请求代码审查时，Claude 可能会使用 `review` 技能来利用 Codex 的审查能力。

**示例触发场景**：
- "审查我的代码更改"
- "检查是否有安全问题"
- "评估代码质量"

## ⚙️ 配置

### Codex 配置

插件会读取 `~/.codex/config.toml` 中的 Codex 配置。您可以使用 `-c` 标志覆盖设置：

```bash
# 使用特定模型
/codex:exec -c model="o3" analyze this code

# 设置超时
/codex:exec -c timeout=300 run long task
```

### 安全设置

插件实现了安全最佳实践：

- ✅ **默认只读**：探索任务使用只读沙箱
- ✅ **渐进式权限**：仅在需要时升级到写入权限
- ✅ **无危险绕过**：除非明确请求，否则不使用不安全标志
- ✅ **清晰反馈**：始终报告执行的操作

## 📋 前置要求

### 必需
- **Claude Code**: 版本 1.0.33 或更高
- **Codex CLI**: 已安装并配置
- **认证**: 有效的 Codex 认证

### 验证安装

```bash
# 检查 Claude Code 版本
claude --version

# 检查 Codex 安装
codex --version

# 检查 Codex 路径
which codex

# 测试 Codex 认证
codex auth status
```

## 🐛 故障排除

### 问题 1：插件未加载

**症状**：`/codex:*` 命令不可用

**解决方案**：
```bash
# 1. 验证插件结构
ls -la codex-plugin/.claude-plugin/

# 2. 检查 plugin.json 是否有效
cat codex-plugin/.claude-plugin/plugin.json | jq

# 3. 重启 Claude Code
```

### 问题 2：命令未出现

**症状**：插件已加载但命令不显示

**解决方案**：
```bash
# 1. 重启 Claude Code
# 2. 检查可用命令
/help

# 3. 查看插件状态
/plugin
```

### 问题 3：Codex 未找到

**症状**：执行命令时提示 "codex: command not found"

**解决方案**：
```bash
# 1. 验证 Codex 已安装
codex --version

# 2. 检查 PATH
which codex
echo $PATH

# 3. 如果未安装，安装 Codex
# 参考 Codex 官方文档
```

### 问题 4：认证失败

**症状**：Codex 命令提示认证错误

**解决方案**：
```bash
# 1. 检查认证状态
codex auth status

# 2. 重新登录
codex auth login

# 3. 验证配置
cat ~/.codex/config.toml
```

### 问题 5：任务执行失败

**症状**：`/codex:exec` 命令失败

**解决方案**：
1. 检查任务描述是否清晰
2. 验证当前目录是否正确
3. 查看 Codex 日志：`~/.codex/logs/`
4. 尝试使用更详细的任务描述

## 🔧 开发和贡献

### 本地开发

```bash
# 克隆仓库
git clone <your-repo>
cd codex-plugin

# 使用插件目录模式测试
claude --plugin-dir .

# 测试命令
/codex:quick-review
/codex:exec echo test
```

### 添加新命令

1. 在 `commands/` 目录创建新的 `.md` 文件
2. 添加 frontmatter 和描述
3. 编写命令指令
4. 使用 `--plugin-dir` 测试

### 添加新技能

1. 在 `skills/` 目录创建新目录
2. 添加 `SKILL.md` 文件
3. 在 frontmatter 中包含名称和描述
4. 测试技能调用

### 验证插件

```bash
# 运行验证脚本
./validate.sh

# 检查插件结构
ls -la .claude-plugin/

# 验证 JSON 格式
cat .claude-plugin/plugin.json | jq
cat .claude-plugin/marketplace.json | jq
```

## 📚 命令参考

### 快速审查命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `/codex:quick-review` | 运行快速代码审查 | `/codex:quick-review` |
| `/codex:quick-review security` | 安全重点审查 | `/codex:quick-review security` |
| `/codex:quick-review performance` | 性能重点审查 | `/codex:quick-review performance` |

### 执行命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `/codex:exec <task>` | 执行 Codex 任务 | `/codex:exec run tests` |
| `/codex:exec -c <config> <task>` | 带配置执行 | `/codex:exec -c model="o3" analyze` |

### 会话命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `/codex:resume` | 显示会话选择器 | `/codex:resume` |
| `/codex:resume last` | 恢复最后会话 | `/codex:resume last` |
| `/codex:resume <id>` | 恢复特定会话 | `/codex:resume abc123` |

### 应用命令

| 命令 | 描述 | 示例 |
|------|------|------|
| `/codex:apply` | 应用最新差异 | `/codex:apply` |

## 🎓 最佳实践

### 1. 任务描述要清晰

❌ **不好**：
```bash
/codex:exec fix it
```

✅ **好**：
```bash
/codex:exec fix the authentication bug in login.js where users can't log in with special characters in password
```

### 2. 使用适当的审查重点

根据更改类型选择审查重点：
- 新功能 → `quality`
- 安全相关 → `security`
- 性能优化 → `performance`

### 3. 渐进式工作流

1. 先审查 (`/codex:quick-review`)
2. 再执行 (`/codex:exec`)
3. 最后应用 (`/codex:apply`)

### 4. 保存重要会话

对于复杂任务，使用 `/codex:resume` 保存和恢复会话。

## 📊 性能提示

- **小任务**：通常 10-30 秒完成
- **中等任务**：可能需要 1-3 分钟
- **大型任务**：建议分解为多个小任务

## 📝 版本历史

### v1.0.0 (2026-01-27)
- 初始版本发布
- Agent 技能：exec, review
- 用户命令：quick-review, exec, resume, apply
- 安全功能和沙箱集成
- 完整文档

## 📄 许可证

MIT License - 详见 LICENSE 文件

## 👥 作者

Codex Team

## 🔗 相关资源

- [Claude Code 官方文档](https://code.claude.com/docs)
- [Codex CLI 文档](https://codex.dev/docs)
- [插件开发指南](https://code.claude.com/docs/plugins)
- [插件市场创建指南](https://code.claude.com/docs/plugin-marketplaces)

## 💬 支持

- **问题报告**：在 GitHub 上报告 bug
- **功能请求**：提交 issue 或 PR
- **社区讨论**：加入 Claude Code Discord

---

**提示**：如果遇到问题，请确保：
1. Claude Code 版本 ≥ 1.0.33
2. Codex CLI 已正确安装和配置
3. 有有效的 Codex 认证
4. 插件已正确加载（运行 `/plugin` 检查）
