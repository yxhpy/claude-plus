---
description: 更新插件配置和内容。核心原则：能力优先，文档最少，脚本化优先
---

# 插件更新命令

更新现有插件："$ARGUMENTS"

## 核心原则 ⚠️

1. **能力优先** - 将经验转化为脚本，不是文档
2. **精简优先** - 删除冗余，保持简洁
3. **脚本化** - 自动化流程，不要手动步骤

## 执行步骤

### 1. 读取配置
```bash
# 读取插件和市场配置
Read: <plugin-path>/.claude-plugin/plugin.json
Read: <marketplace-path>/.claude-plugin/marketplace.json
```

### 2. 更新配置
- 递增版本号（次要功能 +0.1.0）
- 更新 description 反映新功能
- 同步 plugin.json 和 marketplace.json

### 3. 更新 skills/commands
- 精简内容，删除冗余
- 用脚本调用替代手动步骤
- 更新 description

### 4. 添加脚本（如需要）
- 封装新能力为脚本
- 放入 scripts/ 目录
- 集成到主流程

### 5. 清理
- 删除不必要的文档（CHANGELOG.md, EXPERIENCE.md 等）
- 只保留 README.md
- 简短更新版本历史

## 输出报告

```
✅ 插件更新完成

📦 <plugin-name> v<old> → v<new>

🔄 更新：
- 配置: description, version
- skills/commands: 精简 X 行
- scripts: 新增 X 个
- 文档: 删除 X 个冗余文件

💡 核心改进：<简述>
```

## 示例

**好的更新**：
- 添加自动化脚本
- 精简 skills/commands
- 删除冗余文档

**不好的更新**：
- 创建大量文档
- 保留冗长步骤
- 不添加脚本
