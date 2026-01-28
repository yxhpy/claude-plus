# Claude Plus 插件项目

这个项目包含三个强大的 Claude Code 插件，用于扩展 Claude 的功能。

## 📦 插件列表

### 1. Plugin Creator（元插件）⭐ 新增
**功能**：快速创建 Claude Code 插件的脚手架工具

- 🚀 一条命令生成完整插件结构
- 📦 自动生成标准配置文件
- 📝 自动生成完整文档
- ⚙️ 包含示例命令和技能
- ✅ 提供验证和安装脚本

**安装**：
```bash
claude --plugin-dir ./plugins/plugin-creator-plugin
```

**使用**：
```bash
/plugin-creator:create my-plugin "插件描述"
```

**详细文档**：
- [README](./plugins/plugin-creator-plugin/README.md)
- [快速开始](./plugins/plugin-creator-plugin/QUICKSTART.md)
- [项目结构](./plugins/plugin-creator-plugin/PROJECT_STRUCTURE.md)

---

### 2. Website Cloner Plugin
**功能**：高保真克隆和还原网站

- 🎯 完整复制 HTML、CSS、JavaScript
- 📦 自动下载所有静态资源
- 🔗 智能路径修正
- 📁 结构化输出
- 🚀 即开即用

**安装**：
```bash
claude --plugin-dir ./plugins/website-cloner-plugin
```

**使用**：
```bash
/website-cloner:clone https://example.com
```

**详细文档**：
- [README](./plugins/website-cloner-plugin/README.md)
- [使用指南](./plugins/website-cloner-plugin/USAGE_GUIDE.md)
- [快速开始](./plugins/website-cloner-plugin/QUICKSTART.md)

---

### 3. Codex Plugin
**功能**：Codex CLI 集成

- 🤖 自动化任务执行
- 🔍 快速代码审查
- 📝 会话管理
- ✅ 变更应用

**安装**：
```bash
claude --plugin-dir ./plugins/codex-plugin
```

**使用**：
```bash
/codex:quick-review
/codex:exec run all tests
/codex:resume
/codex:apply
```

**详细文档**：
- [README](./plugins/codex-plugin/README.md)
- [使用指南](./plugins/codex-plugin/USAGE_GUIDE.md)
- [快速开始](./plugins/codex-plugin/QUICKSTART.md)

---

## 🚀 快速开始

### 方法 1：同时使用所有插件

```bash
# 启动 Claude Code 并加载所有插件
cd /Users/yxhpy/PycharmProjects/claude-plus
claude --plugin-dir ./plugins/plugin-creator-plugin \
       --plugin-dir ./plugins/website-cloner-plugin \
       --plugin-dir ./plugins/codex-plugin
```

### 方法 2：通过本地市场安装

```bash
# 添加市场
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/marketplaces/plugin-creator-plugin
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/marketplaces/website-cloner-plugin
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/marketplaces/codex-plugin

# 安装插件
/plugin install plugin-creator@plugin-creator-marketplace
/plugin install website-cloner@website-cloner-marketplace
/plugin install codex@local-codex
```

### 方法 3：从 GitHub 安装

```bash
# 添加市场
/plugin marketplace add your-username/plugin-creator-plugin
/plugin marketplace add your-username/website-cloner-plugin
/plugin marketplace add your-username/codex-plugin

# 安装插件
/plugin install plugin-creator@your-username-plugin-creator-plugin
/plugin install website-cloner@your-username-website-cloner-plugin
/plugin install codex@your-username-codex-plugin
```

---

## 📁 项目结构

```
claude-plus/
├── plugin-creator-plugin/         # 插件创建器（元插件）⭐ 新增
│   ├── .claude-plugin/
│   │   ├── plugin.json
│   │   └── marketplace.json
│   ├── commands/
│   │   └── create.md
│   ├── skills/
│   │   └── create/
│   │       └── SKILL.md
│   ├── README.md
│   ├── QUICKSTART.md
│   ├── INSTALL.sh
│   ├── validate.sh
│   ├── .gitignore
│   ├── LICENSE
│   └── PROJECT_STRUCTURE.md
│
├── website-cloner-plugin/         # 网站克隆插件
│   ├── .claude-plugin/
│   │   ├── plugin.json
│   │   └── marketplace.json
│   ├── commands/
│   │   └── clone.md
│   ├── skills/
│   │   └── clone/
│   │       └── SKILL.md
│   ├── README.md
│   ├── USAGE_GUIDE.md
│   ├── QUICKSTART.md
│   ├── INSTALL.sh
│   └── ...
│
├── codex-plugin/                  # Codex 集成插件
│   ├── .claude-plugin/
│   │   ├── plugin.json
│   │   └── marketplace.json
│   ├── commands/
│   │   ├── quick-review.md
│   │   ├── exec.md
│   │   ├── resume.md
│   │   └── apply.md
│   ├── skills/
│   │   ├── exec/
│   │   └── review/
│   ├── README.md
│   ├── USAGE_GUIDE.md
│   ├── QUICKSTART.md
│   ├── INSTALL.sh
│   └── ...
│
└── docs/                          # 文档
    └── official/
        └── discover-plugins.md
```

---

## 🎯 使用场景

### 场景 1：创建新插件（使用 Plugin Creator）⭐

```bash
# 1. 加载 Plugin Creator
claude --plugin-dir ./plugins/plugin-creator-plugin

# 2. 创建新插件
/plugin-creator:create my-awesome-plugin "一个很棒的插件"

# 3. 测试新插件
cd my-awesome-plugin-plugin
./validate.sh
claude --plugin-dir .
```

### 场景 2：克隆网站进行学习

```bash
# 1. 克隆一个网站
/website-cloner:clone https://example.com

# 2. 审查克隆的代码
/codex:quick-review

# 3. 在本地预览
cd cloned-sites/example.com
python -m http.server 8000
```

### 场景 3：自动化开发工作流

```bash
# 1. 执行测试
/codex:exec run all unit tests

# 2. 如果失败，分析问题
/codex:exec analyze test failures

# 3. 应用修复
/codex:apply

# 4. 再次测试
/codex:exec run all tests
```

### 场景 4：完整的插件开发流程

```bash
# 1. 使用 Plugin Creator 创建插件
/plugin-creator:create test-runner "自动运行测试的插件"

# 2. 编辑生成的文件
cd test-runner-plugin
# 编辑 commands/ 和 skills/

# 3. 使用 Codex 审查代码
/codex:quick-review

# 4. 验证插件
./validate.sh

# 5. 测试插件
claude --plugin-dir .
```

---

## 🔧 开发指南

### 创建新插件（推荐方式）

使用 Plugin Creator 快速创建：

```bash
# 1. 加载 Plugin Creator
claude --plugin-dir ./plugins/plugin-creator-plugin

# 2. 创建插件
/plugin-creator:create my-plugin "插件描述"

# 3. 自定义插件
cd my-plugin-plugin
# 编辑 commands/ 和 skills/
# 更新文档

# 4. 验证和测试
./validate.sh
claude --plugin-dir .
```

### 手动创建插件

如果需要手动创建，参考现有插件的结构：

```bash
# 复制模板
cp -r plugin-creator-plugin my-new-plugin

# 修改配置
# 编辑 .claude-plugin/plugin.json
# 编辑 .claude-plugin/marketplace.json

# 添加功能
# 在 commands/ 添加命令
# 在 skills/ 添加技能

# 更新文档
# 编辑 README.md 等
```

### 测试插件

```bash
# 验证结构
cd my-plugin-plugin
./validate.sh

# 本地测试
claude --plugin-dir .

# 测试命令
/my-plugin:command-name
```

### 发布插件

```bash
# 初始化 Git 仓库
cd my-plugin-plugin
git init
git add .
git commit -m "Initial commit: My Plugin"

# 推送到 GitHub
git remote add origin https://github.com/username/my-plugin-plugin.git
git push -u origin main

# 其他用户可以安装
/plugin marketplace add username/my-plugin-plugin
/plugin install my-plugin@username-my-plugin-plugin
```

---

## 📚 文档资源

### Plugin Creator
- [完整 README](./plugins/plugin-creator-plugin/README.md)
- [快速开始](./plugins/plugin-creator-plugin/QUICKSTART.md)
- [项目结构](./plugins/plugin-creator-plugin/PROJECT_STRUCTURE.md)

### Website Cloner Plugin
- [完整使用指南](./plugins/website-cloner-plugin/USAGE_GUIDE.md)
- [快速开始](./plugins/website-cloner-plugin/QUICKSTART.md)
- [使用示例](./plugins/website-cloner-plugin/EXAMPLES.md)
- [合规说明](./plugins/website-cloner-plugin/COMPLIANCE.md)

### Codex Plugin
- [完整使用指南](./plugins/codex-plugin/USAGE_GUIDE.md)
- [快速开始](./plugins/codex-plugin/QUICKSTART.md)
- [安装说明](./plugins/codex-plugin/INSTALL.md)
- [结构说明](./plugins/codex-plugin/STRUCTURE.md)

### Claude Code 官方文档
- [插件开发](https://code.claude.com/docs/plugins)
- [插件市场](https://code.claude.com/docs/plugin-marketplaces)
- [插件参考](https://code.claude.com/docs/plugins-reference)

---

## 🐛 故障排除

### 插件未加载

```bash
# 检查 Claude Code 版本
claude --version

# 验证插件结构
cd <plugin-name>-plugin
./validate.sh

# 检查配置文件
cat .claude-plugin/plugin.json | jq
cat .claude-plugin/marketplace.json | jq
```

### 命令不可用

```bash
# 重启 Claude Code
# 检查可用命令
/help

# 查看插件状态
/plugin
```

### 市场添加失败

```bash
# 使用绝对路径
/plugin marketplace add /Users/yxhpy/PycharmProjects/claude-plus/<plugin-name>-plugin

# 或使用相对路径
cd /Users/yxhpy/PycharmProjects/claude-plus
/plugin marketplace add ./<plugin-name>-plugin
```

---

## 📊 性能建议

### Plugin Creator
- 插件生成：10-30 秒
- 生成文件：约 12 个
- 磁盘空间：50-100 KB

### Website Cloner
- 小型网站（< 10 MB）：1-2 分钟
- 中型网站（10-50 MB）：5-10 分钟
- 大型网站（> 50 MB）：建议分批克隆

### Codex Plugin
- 快速审查：10-30 秒
- 中等任务：1-3 分钟
- 复杂任务：建议分解为多个小任务

---

## 📝 版本历史

### Plugin Creator v1.0.0 (2026-01-28) ⭐ 新增
- 初始版本发布
- 支持快速创建插件结构
- 自动生成配置文件和文档
- 包含示例命令和技能

### Website Cloner Plugin v1.0.0 (2026-01-28)
- 初始版本发布
- 支持 HTML、CSS、JS 克隆
- 自动资源下载和路径修正

### Codex Plugin v1.0.0 (2026-01-27)
- 初始版本发布
- Agent 技能：exec, review
- 用户命令：quick-review, exec, resume, apply

---

## 📄 许可证

所有插件均采用 MIT License

---

## 👥 作者

- **Plugin Creator**: Claude Plus Team
- **Website Cloner Plugin**: Claude Plus Team
- **Codex Plugin**: Codex Team

---

## 🔗 相关链接

- [Claude Code 官网](https://code.claude.com)
- [Claude Code GitHub](https://github.com/anthropics/claude-code)
- [插件开发文档](https://code.claude.com/docs/plugins)

---

## 💡 贡献

欢迎贡献！请：
1. Fork 仓库
2. 创建功能分支
3. 提交 Pull Request

---

**提示**：使用 Plugin Creator 可以快速创建新插件，大大提高开发效率！🚀
