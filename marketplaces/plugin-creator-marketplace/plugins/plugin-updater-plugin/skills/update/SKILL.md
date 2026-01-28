---
name: update
description: Automatically update plugin configurations and content when users request modifications to existing plugins. Use when users want to update plugin.json, marketplace.json, add commands/skills, or modify plugin metadata.
---

# 插件更新技能

这是一个 Agent 技能，当用户请求更新现有插件时，Claude 会自动调用此技能。

## 何时使用

当用户请求以下操作时，自动使用此技能：
- 更新插件的版本号
- 修改插件描述或元数据
- 添加新的命令或技能到现有插件
- 更新 plugin.json 或 marketplace.json
- 修改插件配置
- 更新插件文档

## 执行步骤

### 1. 识别目标插件

从用户输入中提取：
- 插件路径或名称
- 更新需求描述

### 2. 读取现有配置

使用 Read 工具读取：
- `<plugin-path>/.claude-plugin/plugin.json`
- 对应的 `marketplace.json`（如果存在）
- `README.md` 和其他文档

### 3. 分析更新需求

理解用户想要：
- 更新哪些字段
- 添加什么功能
- 修改什么内容
- 版本如何变更

### 4. 执行更新操作

根据需求类型执行相应操作：

**配置更新**：
- 使用 Edit 工具更新 plugin.json
- 同步更新 marketplace.json
- 确保版本号一致

**内容更新**：
- 添加新命令文件到 commands/
- 添加新技能文件到 skills/
- 更新文档文件

**版本管理**：
- 根据变更类型递增版本号
- 主要变更：x.0.0
- 次要变更：0.x.0
- 补丁变更：0.0.x

### 5. 验证更新

- 验证 JSON 格式正确性
- 检查文件结构完整性
- 确保配置一致性

### 6. 报告结果

向用户清晰报告：
- 更新了哪些文件
- 版本如何变更
- 添加了什么功能
- 下一步建议操作

## 示例场景

**场景 1：版本更新**
```
用户：更新 codex-plugin 到版本 1.2.0
技能：读取配置 → 更新版本号 → 同步 marketplace → 报告结果
```

**场景 2：添加命令**
```
用户：给 my-plugin 添加一个 format 命令
技能：创建命令文件 → 更新文档 → 递增版本 → 报告结果
```

**场景 3：修改描述**
```
用户：更新 plugin-creator 的描述
技能：读取配置 → 更新描述 → 同步 marketplace → 报告结果
```

## 注意事项

1. **备份意识**：提醒用户重要更新前备份
2. **版本规范**：遵循语义化版本规范
3. **配置同步**：确保 plugin.json 和 marketplace.json 一致
4. **验证测试**：更新后建议用户测试
5. **文档更新**：同步更新相关文档

## 错误处理

- 插件路径不存在：提示用户检查路径
- JSON 格式错误：提供修复建议
- 权限不足：提示检查文件权限
- 版本冲突：询问用户如何处理
