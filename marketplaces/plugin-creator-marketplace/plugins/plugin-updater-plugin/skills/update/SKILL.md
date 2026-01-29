---
name: update
description: 自动更新插件配置和内容。核心原则：能力优先文档最少，将经验转化为脚本和自动化能力，精简 skills/commands，删除冗余文档。
---

# 插件更新技能

## 核心原则 ⚠️

1. **能力优先** - 将经验转化为脚本，不是文档
2. **精简优先** - 删除冗余，保持简洁
3. **脚本化** - 自动化流程，不要手动步骤

## 执行流程

### 1. 解析需求
从用户输入提取：
- 插件路径（必需）
- 更新类型（版本/描述/命令/技能/脚本）
- 具体内容

### 2. 读取配置
```bash
Read: <plugin-path>/.claude-plugin/plugin.json
Read: <marketplace-path>/.claude-plugin/marketplace.json
```

### 3. 执行更新

**配置更新**：
- 递增版本号（主要/次要/补丁）
- 更新 description/author/homepage
- 同步 plugin.json 和 marketplace.json

**内容更新**：
- 添加命令：`commands/<name>.md`
- 添加技能：`skills/<name>/SKILL.md`（必须包含 name 和 description）
- 添加脚本：`scripts/<name>.sh`

**精简优化**：
- 删除冗余文档（CHANGELOG.md, EXPERIENCE.md 等）
- 精简 skills/commands 内容
- 用脚本调用替代手动步骤

### 4. 验证
```bash
cat .claude-plugin/plugin.json | jq  # 验证 JSON
./validate.sh                        # 验证结构（如存在）
```

### 5. 报告

```
✅ 插件更新完成

📦 <plugin-name> v<old> → v<new>

🔄 更新：
- 配置: <列出更新字段>
- 内容: <列出新增/修改内容>
- 精简: <列出删除内容>

💡 核心改进：<简述>
```

## 版本规则

- 主要变更（破坏性）：1.0.0 → 2.0.0
- 次要变更（新功能）：1.0.0 → 1.1.0
- 补丁变更（修复）：1.0.0 → 1.0.1

## 错误处理

- 路径不存在 → 提示检查路径
- JSON 格式错误 → 提供修复建议
- 权限不足 → 提示检查权限
