---
description: Update an existing plugin's configuration and content
---

# 插件更新命令

你需要帮助用户更新一个现有的 Claude Code 插件。

## 参数解析

用户输入格式：`/plugin-updater:update <plugin-path> <requirements>`

从用户输入中提取：
- **plugin-path**（必需）：插件目录路径，例如 `./marketplaces/codex-marketplace/plugins/codex-plugin`
- **requirements**（必需）：用户的更新需求描述

## 执行步骤

### 1. 验证插件路径

```bash
# 检查插件目录是否存在
if [ -d "<plugin-path>" ]; then
  echo "✅ 找到插件目录"
else
  echo "❌ 插件目录不存在"
  exit 1
fi
```

### 2. 读取现有配置

使用 Read 工具读取以下文件：
- `<plugin-path>/.claude-plugin/plugin.json`
- 查找对应的 marketplace.json（向上查找）
- `<plugin-path>/README.md`（如果存在）

### 3. 分析更新需求

根据用户的 requirements，确定需要更新的内容：

**常见更新类型**：
- **版本更新**：更新 version 字段
- **描述更新**：更新 description 字段
- **作者信息**：更新 author 字段
- **依赖更新**：更新 dependencies
- **命令添加**：在 commands/ 目录添加新命令
- **技能添加**：在 skills/ 目录添加新技能
- **文档更新**：更新 README.md
- **配置更新**：更新其他配置项

### 4. 更新 plugin.json

使用 Edit 工具更新 plugin.json：

```json
{
  "name": "<保持不变>",
  "description": "<根据需求更新>",
  "version": "<递增版本号>",
  "author": {
    "name": "<根据需求更新>"
  },
  "homepage": "<根据需求更新>",
  "repository": "<根据需求更新>",
  "license": "<保持不变或更新>"
}
```

**版本号规则**：
- 主要更新（破坏性变更）：1.0.0 → 2.0.0
- 次要更新（新功能）：1.0.0 → 1.1.0
- 补丁更新（bug 修复）：1.0.0 → 1.0.1

### 5. 更新 marketplace.json

如果插件属于某个 marketplace，同步更新 marketplace.json 中的插件信息：

**查找 marketplace.json**：
```bash
# 向上查找 marketplace.json
find <plugin-path>/../.. -name "marketplace.json"
```

**更新对应的插件条目**：
```json
{
  "plugins": [
    {
      "name": "<plugin-name>",
      "description": "<与 plugin.json 保持一致>",
      "version": "<与 plugin.json 保持一致>",
      "author": {"name": "<与 plugin.json 保持一致>"},
      "source": "./plugins/<plugin-name>-plugin"
    }
  ]
}
```

### 6. 根据需求更新插件内容

根据用户的具体需求，执行相应的更新操作：

#### 6.1 添加新命令
如果需求包含"添加命令"：
```bash
# 创建新命令文件
touch <plugin-path>/commands/<command-name>.md
```

命令文件模板：
```markdown
---
description: 命令描述
---

# 命令标题

命令实现内容...
```

#### 6.2 添加新技能
如果需求包含"添加技能"：
```bash
# 创建新技能目录和文件
mkdir -p <plugin-path>/skills/<skill-name>
touch <plugin-path>/skills/<skill-name>/SKILL.md
```

技能文件模板：
```markdown
---
name: skill-name
description: 技能描述，说明何时使用
---

# 技能实现内容
```

#### 6.3 更新文档
如果需求包含"更新文档"：
- 更新 README.md 中的版本号
- 添加新功能说明
- 更新使用示例
- 添加变更日志

### 7. 验证更新

更新完成后，验证插件结构：

```bash
cd <plugin-path>
# 验证 JSON 格式
cat .claude-plugin/plugin.json | jq
# 运行验证脚本（如果存在）
if [ -f "./validate.sh" ]; then
  ./validate.sh
fi
```

### 8. 输出更新报告

向用户报告更新结果：

```
✅ 插件更新成功！

📦 更新的插件：<plugin-name>

🔄 更新内容：
- plugin.json: <列出更新的字段>
- marketplace.json: <是否更新>
- 新增命令: <列出新命令>
- 新增技能: <列出新技能>
- 文档更新: <是否更新>

📋 版本变更：
- 旧版本: <old-version>
- 新版本: <new-version>

🚀 下一步：

1. 测试更新后的插件：
   cd <plugin-path>
   claude --plugin-dir .

2. 验证插件结构：
   ./validate.sh

3. 提交更改：
   git add .
   git commit -m "Update <plugin-name> to v<new-version>"

💡 更新详情：
<详细列出所有更新的内容>
```

## 错误处理

- **插件不存在**：提示用户检查路径
- **JSON 格式错误**：提示用户修复格式
- **版本冲突**：询问用户如何处理
- **权限问题**：提示用户检查文件权限

## 示例用法

```bash
# 更新插件版本和描述
/plugin-updater:update ./marketplaces/codex-marketplace/plugins/codex-plugin "更新描述为'增强的 Codex 集成'，版本升级到 1.1.0"

# 添加新命令
/plugin-updater:update ./plugins/my-plugin "添加一个名为 'format' 的新命令，用于格式化代码"

# 更新作者信息
/plugin-updater:update ./plugins/my-plugin "更新作者名称为 'New Author'"
```

## 最佳实践

1. **备份**：更新前建议备份原文件
2. **版本号**：遵循语义化版本规范
3. **同步更新**：确保 plugin.json 和 marketplace.json 保持一致
4. **验证**：更新后运行验证脚本
5. **测试**：更新后测试插件功能
6. **文档**：及时更新 README.md 和变更日志

开始更新插件吧！
