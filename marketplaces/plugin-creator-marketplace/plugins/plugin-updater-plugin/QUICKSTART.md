# Plugin Updater - 快速开始

## 5 分钟上手指南

### 1. 加载插件

```bash
# 方法 1: 直接加载（最简单）
claude --plugin-dir ./marketplaces/plugin-creator-marketplace/plugins/plugin-updater-plugin

# 方法 2: 通过 marketplace
/plugin marketplace add ./marketplaces/plugin-creator-marketplace
/plugin install plugin-updater@plugin-creator-marketplace
```

### 2. 基本用法

```bash
/plugin-updater:update <插件路径> <更新需求>
```

### 3. 常见示例

#### 更新版本号
```bash
/plugin-updater:update ./plugins/my-plugin "升级版本到 1.1.0"
```

#### 修改描述
```bash
/plugin-updater:update ./plugins/my-plugin "更新描述为'强大的代码工具'"
```

#### 添加新命令
```bash
/plugin-updater:update ./plugins/my-plugin "添加一个 format 命令用于代码格式化"
```

#### 添加新技能
```bash
/plugin-updater:update ./plugins/my-plugin "添加自动检测代码质量的技能"
```

#### 批量更新
```bash
/plugin-updater:update ./plugins/my-plugin "版本升级到 2.0.0，更新描述，添加 lint 命令"
```

### 4. 自动调用

Claude 会在以下情况自动使用此插件：
- 你说"更新 xxx 插件"
- 你说"给 xxx 插件添加功能"
- 你说"修改 xxx 插件的配置"

### 5. 验证更新

```bash
cd <插件目录>
./validate.sh
```

## 版本号规则

- **主版本（x.0.0）**：破坏性变更
- **次版本（0.x.0）**：新功能
- **补丁版本（0.0.x）**：Bug 修复

## 更新流程

1. 读取现有配置
2. 分析更新需求
3. 更新 plugin.json
4. 同步 marketplace.json
5. 添加/修改内容
6. 验证并报告

## 注意事项

- 重要更新前建议备份
- 更新后运行验证脚本
- 确保 plugin.json 和 marketplace.json 同步
- 遵循语义化版本规范

## 获取帮助

查看完整文档：
```bash
cat README.md
```

## 快速测试

```bash
# 1. 进入插件目录
cd marketplaces/plugin-creator-marketplace/plugins/plugin-updater-plugin

# 2. 验证结构
./validate.sh

# 3. 测试加载
claude --plugin-dir .

# 4. 尝试更新（示例）
/plugin-updater:update ./plugins/test-plugin "测试更新"
```

就这么简单！开始使用 Plugin Updater 吧！
