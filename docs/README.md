# 文档目录说明

本目录包含两类文档，通过子目录区分：

## 📁 目录结构

```
docs/
├── official/          # 官方 Claude Code 文档
│   ├── plugins.md
│   ├── quickstart.md
│   ├── cli-reference.md
│   └── ...           # 其他官方文档
│
├── custom/            # 自定义创建的文档
│   └── codex-cli-reference.md
│
└── README.md          # 本文件
```

## 📚 文档分类

### 官方文档 (`official/`)

这些是从 Claude Code 官方网站下载的文档，包含：

- **插件系统**: `plugins.md`, `plugins-reference.md`, `plugin-marketplaces.md`
- **快速入门**: `quickstart.md`, `setup.md`
- **功能指南**: `skills.md`, `hooks.md`, `mcp.md`
- **CLI 参考**: `cli-reference.md`, `interactive-mode.md`
- **集成**: `vs-code.md`, `jetbrains.md`, `github-actions.md`
- **配置**: `settings.md`, `model-config.md`
- **其他**: 完整的官方文档集

**来源**: https://code.claude.com/docs/

**用途**:
- 学习 Claude Code 的官方功能
- 参考标准文档格式
- 了解最新特性和最佳实践

### 自定义文档 (`custom/`)

这些是基于实际项目需求创建的文档：

#### 1. `codex-cli-reference.md`
- **内容**: Codex CLI 工具的完整参考文档
- **包含**: 所有命令、标志、选项、使用示例
- **用途**: 学习和使用 Codex CLI 工具

### 开发插件
1. 阅读 `official/plugins.md` 和 `official/plugins-reference.md`
2. 查看 `official/skills.md` 了解技能系统
3. 参考项目中的 `marketplaces/codex-marketplace/plugins/codex-plugin/` 示例

### 使用 Codex
1. 阅读 `custom/codex-cli-reference.md`
2. 参考项目中的 `marketplaces/codex-marketplace/plugins/codex-plugin/` 示例

## 📖 相关文档

### 插件目录
- `marketplaces/codex-marketplace/plugins/codex-plugin/README.md` - 插件完整文档
- `marketplaces/codex-marketplace/plugins/codex-plugin/QUICKSTART.md` - 快速入门

## 🔗 快速链接

| 文档 | 路径 | 用途 |
|------|------|------|
| Codex CLI 参考 | `custom/codex-cli-reference.md` | 学习 Codex 命令 |
| 官方插件文档 | `official/plugins.md` | 了解插件系统 |
| 官方快速入门 | `official/quickstart.md` | 开始使用 Claude Code |
| 官方 CLI 参考 | `official/cli-reference.md` | Claude Code 命令参考 |

## 📝 维护说明

### 更新官方文档
```bash
# 下载最新官方文档
./download_docs.sh

# 文档会自动放入 official/ 目录
```

### 添加自定义文档
```bash
# 将新文档放入 custom/ 目录
cp my-new-doc.md docs/custom/
```

## 🎓 学习路径

### 初学者
1. `official/quickstart.md` - 快速入门
2. `official/how-claude-code-works.md` - 工作原理
3. `custom/codex-cli-reference.md` - Codex 使用

### 插件开发者
1. `official/plugins.md` - 插件系统
2. `official/skills.md` - 技能开发
3. `official/plugins-reference.md` - 完整参考

### 高级用户
1. `official/hooks.md` - 钩子系统
2. `official/mcp.md` - MCP 集成
3. `official/settings.md` - 高级配置

---

**文档组织日期**: 2026-01-27
**目的**: 清晰区分官方文档和自定义文档，便于查找和维护
