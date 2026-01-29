---
description: 更新插件配置和内容。能力优先文档最少，脚本化自动化
---

# 插件更新命令

更新现有插件："$ARGUMENTS"

## 用法

```bash
/plugin-updater:update <plugin-path> <requirements>
```

**参数**：
- `plugin-path`: 插件目录路径
- `requirements`: 更新需求描述

## 更新类型

1. **配置更新** - 版本/描述/作者/主页
2. **内容更新** - 添加命令/技能/脚本
3. **精简优化** - 删除冗余文档，精简代码

## 示例

```bash
# 更新版本和描述
/plugin-updater:update ./plugins/my-plugin "版本升级到 1.1.0，描述改为'增强功能'"

# 添加新命令
/plugin-updater:update ./plugins/my-plugin "添加 format 命令用于代码格式化"

# 精简优化
/plugin-updater:update ./plugins/my-plugin "精简 SKILL.md，删除冗余文档"
```

## 核心原则

✅ 能力优先 - 脚本 > 文档
✅ 精简优先 - 删除冗余
✅ 脚本化 - 自动化流程
