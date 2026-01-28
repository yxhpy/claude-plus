# Plugin Updater

Update existing Claude Code plugins - modify plugin.json, marketplace.json, and plugin content based on user requirements.

## 快速开始

### 安装

**方法 1: 直接加载（推荐开发使用）**
```bash
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-updater-plugin
```

**方法 2: 通过 Marketplace 安装**
```bash
/plugin marketplace add ./marketplaces/plugin-creator-marketplace
/plugin install plugin-updater@plugin-creator-marketplace
```

### 基本使用

```bash
/plugin-updater:update <plugin-path> <requirements>
```

## 功能特性

- 更新插件配置文件（plugin.json, marketplace.json）
- 修改插件元数据（版本、描述、作者等）
- 添加新命令和技能到现有插件
- 自动同步 plugin.json 和 marketplace.json
- 智能版本号管理（语义化版本）
- 自动验证更新后的插件结构

## 命令列表

### `/plugin-updater:update`
更新现有插件的配置和内容

**用法**：
```bash
/plugin-updater:update <plugin-path> <requirements>
```

**参数**：
- `plugin-path`: 插件目录路径（例如：`./marketplaces/codex-marketplace/plugins/codex-plugin`）
- `requirements`: 更新需求描述

**示例**：

```bash
# 更新版本和描述
/plugin-updater:update ./plugins/my-plugin "更新版本到 1.1.0，描述改为'增强功能'"

# 添加新命令
/plugin-updater:update ./plugins/my-plugin "添加一个名为 format 的命令，用于代码格式化"

# 更新作者信息
/plugin-updater:update ./plugins/my-plugin "更新作者名称为 John Doe"

# 添加新技能
/plugin-updater:update ./plugins/my-plugin "添加一个自动检测代码质量的技能"
```

## 技能

插件包含以下 Agent 技能，Claude 会自动调用：

- **update**: 当用户请求更新插件配置、添加功能或修改元数据时自动调用

## 更新类型

### 1. 配置更新
- 版本号（遵循语义化版本规范）
- 描述信息
- 作者信息
- 主页和仓库链接
- 许可证信息
- 关键词

### 2. 内容更新
- 添加新命令（commands/ 目录）
- 添加新技能（skills/ 目录）
- 更新文档（README.md 等）
- 修改现有命令或技能

### 3. 同步更新
- 自动同步 plugin.json 和 marketplace.json
- 确保版本号一致性
- 保持配置信息同步

## 版本号规则

遵循语义化版本规范（Semantic Versioning）：

- **主版本号（Major）**：破坏性变更
  - 例如：1.0.0 → 2.0.0
  - 不兼容的 API 变更

- **次版本号（Minor）**：新功能
  - 例如：1.0.0 → 1.1.0
  - 向后兼容的新功能

- **补丁版本号（Patch）**：Bug 修复
  - 例如：1.0.0 → 1.0.1
  - 向后兼容的问题修复

## 项目结构

```
plugin-updater-plugin/
├── .claude-plugin/
│   └── plugin.json              # 插件配置
├── commands/
│   └── update.md                # 更新命令
├── skills/
│   └── update/
│       └── SKILL.md             # 自动更新技能
├── README.md                    # 本文档
├── validate.sh                  # 验证脚本
├── .gitignore
└── LICENSE
```

## 工作流程

1. **读取现有配置**
   - 读取 plugin.json
   - 查找对应的 marketplace.json
   - 读取相关文档

2. **分析更新需求**
   - 解析用户的更新要求
   - 确定需要修改的内容
   - 计算新的版本号

3. **执行更新操作**
   - 更新 plugin.json
   - 同步 marketplace.json
   - 添加/修改命令或技能
   - 更新文档

4. **验证和报告**
   - 验证 JSON 格式
   - 检查文件结构
   - 生成更新报告

## 开发

### 验证插件

```bash
cd marketplaces/plugin-creator-marketplace/plugins/plugin-updater-plugin
./validate.sh
```

### 测试插件

```bash
claude --plugin-dir .
```

### 运行示例

```bash
# 测试更新命令
/plugin-updater:update ./plugins/test-plugin "更新版本到 1.1.0"
```

## 故障排除

### 插件未加载
- 检查 plugin.json 格式是否正确
- 运行 `./validate.sh` 验证结构
- 确认路径正确

### 命令不可用
- 确认插件已正确安装
- 检查命令文件是否存在
- 验证命令文件格式

### 更新失败
- 检查目标插件路径是否存在
- 确认有文件写入权限
- 验证 JSON 格式是否正确

### 版本冲突
- 检查当前版本号
- 确认版本递增规则
- 手动指定版本号

## 最佳实践

1. **更新前备份**：重要更新前备份原文件
2. **遵循规范**：使用语义化版本规范
3. **保持同步**：确保 plugin.json 和 marketplace.json 一致
4. **及时验证**：更新后运行验证脚本
5. **充分测试**：更新后测试插件功能
6. **更新文档**：及时更新 README.md 和变更日志

## 使用场景

### 场景 1：版本升级
当你修复了 bug 或添加了新功能，需要更新版本号：
```bash
/plugin-updater:update ./plugins/my-plugin "修复了登录 bug，版本升级到 1.0.1"
```

### 场景 2：添加功能
当你想给插件添加新的命令或技能：
```bash
/plugin-updater:update ./plugins/my-plugin "添加一个 format 命令用于代码格式化"
```

### 场景 3：修改元数据
当你需要更新插件的描述、作者等信息：
```bash
/plugin-updater:update ./plugins/my-plugin "更新描述为'强大的代码格式化工具'，作者改为 John Doe"
```

### 场景 4：批量更新
当你需要同时更新多个配置项：
```bash
/plugin-updater:update ./plugins/my-plugin "版本升级到 2.0.0，更新描述，添加新的 lint 命令"
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License
