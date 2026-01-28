# Plugin Creator - 项目结构说明

## 📁 目录结构

```
plugin-creator-plugin/
├── .claude-plugin/              # 插件配置目录
│   ├── plugin.json             # 插件元数据
│   └── marketplace.json        # 市场配置
│
├── commands/                    # 用户命令目录
│   └── create.md               # 创建插件命令
│
├── skills/                      # Agent 技能目录
│   └── create/                 # 创建技能
│       └── SKILL.md           # 技能定义
│
├── README.md                    # 项目说明
├── QUICKSTART.md               # 快速开始
├── INSTALL.sh                  # 安装脚本
├── validate.sh                 # 验证脚本
├── .gitignore                  # Git 忽略文件
└── LICENSE                     # MIT 许可证
```

## 📄 文件说明

### 配置文件

#### `.claude-plugin/plugin.json`
插件元数据文件，包含：
- `name`: 插件名称
- `description`: 插件描述
- `version`: 版本号
- `author`: 作者信息
- `homepage`: 主页 URL
- `repository`: 仓库 URL
- `license`: 许可证类型

#### `.claude-plugin/marketplace.json`
市场配置文件，用于插件分发：
- `name`: 市场名称
- `description`: 市场描述
- `plugins`: 插件列表

### 命令文件

#### `commands/create.md`
创建插件的用户命令：
- 用户通过 `/plugin-creator:create` 调用
- 包含完整的插件生成逻辑
- 支持参数解析和验证
- 生成完整的插件结构

### 技能文件

#### `skills/create/SKILL.md`
创建插件的 Agent 技能：
- Claude 可以自动调用
- 当用户表达创建插件的意图时触发
- 与命令文件功能相同，但更智能

### 文档文件

#### `README.md`
完整的项目说明文档：
- 功能特性
- 安装方法
- 使用示例
- 配置选项
- 故障排除
- 开发指南

#### `QUICKSTART.md`
5分钟快速上手指南：
- 快速安装
- 基本使用
- 常用命令
- 实用技巧

### 工具脚本

#### `INSTALL.sh`
安装指南脚本：
- 展示 3 种安装方法
- 提供使用示例
- 包含测试步骤

#### `validate.sh`
插件验证脚本：
- 检查目录结构
- 验证配置文件
- 检查 JSON 格式
- 验证文件权限

### 其他文件

#### `.gitignore`
Git 忽略规则：
- node_modules/
- .DS_Store
- *.log
- .env
- 等等

#### `LICENSE`
MIT 许可证文件

## 🔧 开发指南

### 添加新命令

1. 在 `commands/` 目录创建新的 `.md` 文件
2. 添加 frontmatter：
   ```markdown
   ---
   description: 命令描述
   ---
   ```
3. 编写命令逻辑
4. 测试命令

### 添加新技能

1. 在 `skills/` 目录创建新的子目录
2. 创建 `SKILL.md` 文件
3. 添加 frontmatter：
   ```markdown
   ---
   name: skill-name
   description: 技能描述
   ---
   ```
4. 编写技能逻辑
5. 测试技能

### 更新配置

修改 `.claude-plugin/plugin.json`：
- 更新版本号
- 修改描述
- 添加关键词

### 测试插件

```bash
# 验证结构
./validate.sh

# 本地测试
claude --plugin-dir .

# 测试命令
/plugin-creator:create test-plugin
```

## 📚 生成的插件结构

当使用 Plugin Creator 创建新插件时，会生成以下结构：

```
<plugin-name>-plugin/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── commands/
│   └── example.md
├── skills/
│   └── example/
│       └── SKILL.md
├── README.md
├── USAGE_GUIDE.md
├── QUICKSTART.md
├── INSTALL.sh
├── validate.sh
├── .gitignore
├── LICENSE
└── PROJECT_STRUCTURE.md
```

## 🎯 最佳实践

### 1. 保持结构清晰
- 命令放在 `commands/` 目录
- 技能放在 `skills/` 目录
- 文档放在根目录

### 2. 使用描述性命名
- 命令文件：`action-name.md`
- 技能目录：`skill-name/`
- 清晰的描述

### 3. 完整的文档
- 每个命令都有说明
- 每个技能都有文档
- README 保持更新

### 4. 版本控制
- 使用语义化版本
- 记录变更历史
- 标记重要版本

### 5. 测试验证
- 运行 validate.sh
- 本地测试所有功能
- 确保文档准确

## 🔍 故障排除

### 插件未加载
```bash
# 检查结构
./validate.sh

# 检查 JSON
cat .claude-plugin/plugin.json | jq
```

### 命令不可用
- 检查命令文件是否存在
- 验证 frontmatter 格式
- 重启 Claude Code

### 技能未触发
- 检查技能文件位置
- 验证 frontmatter
- 确保描述清晰

## 📖 参考资源

- [Claude Code 插件文档](https://code.claude.com/docs/plugins)
- [插件市场指南](https://code.claude.com/docs/plugin-marketplaces)
- [插件参考](https://code.claude.com/docs/plugins-reference)

---

**提示**: 保持插件结构简洁清晰，遵循最佳实践，可以让插件更易于维护和分享。
