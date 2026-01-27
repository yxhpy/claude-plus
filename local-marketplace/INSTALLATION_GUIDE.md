# Claude Code 插件永久安装指南

## 问题总结

直接将插件复制到 `~/.claude/plugins/` 目录**不会自动加载**。Claude Code 需要通过 marketplace 系统来安装插件。

## 正确的安装方法

### 方法 1：通过本地 Marketplace（推荐用于开发）

#### 1. 创建独立的 marketplace 目录

```bash
mkdir -p /path/to/local-marketplace/.claude-plugin
```

#### 2. 创建 marketplace.json

文件位置：`/path/to/local-marketplace/.claude-plugin/marketplace.json`

**关键要点：**
- 必须包含 `owner` 字段（必需）
- `source` 必须是相对路径字符串，以 `./` 开头
- 不能使用 `id`、`displayName` 等无效字段

```json
{
  "name": "local-marketplace",
  "owner": {
    "name": "Your Name"
  },
  "metadata": {
    "description": "Local marketplace for development plugins",
    "version": "1.0.0"
  },
  "plugins": [
    {
      "name": "your-plugin",
      "source": "./plugins",
      "description": "Plugin description",
      "version": "1.0.0",
      "author": {
        "name": "Author Name"
      },
      "license": "MIT",
      "category": "development"
    }
  ]
}
```

#### 3. 创建插件符号链接

```bash
cd /path/to/local-marketplace
ln -s /path/to/your-plugin ./plugins
```

#### 4. 添加到 Claude Code 设置

编辑 `~/.claude/settings.json`：

```json
{
  "enabledPlugins": {
    "your-plugin@local-marketplace": true
  },
  "extraKnownMarketplaces": {
    "local-marketplace": {
      "source": {
        "source": "directory",
        "path": "/path/to/local-marketplace"
      }
    }
  }
}
```

#### 5. 重启 Claude Code

```bash
claude
```

验证：
```
/help
```

### 方法 2：使用 --plugin-dir（临时加载）

适合快速测试：

```bash
claude --plugin-dir /path/to/your-plugin
```

## 常见错误

### ❌ 错误 1：直接复制到 ~/.claude/plugins/
```bash
cp -r plugin ~/.claude/plugins/  # 不会自动加载
```

### ❌ 错误 2：marketplace.json 缺少 owner 字段
```json
{
  "name": "marketplace",
  "plugins": [...]  // 缺少 owner - 会报错
}
```

### ❌ 错误 3：source 使用了无效格式
```json
"source": ".."  // 错误：不能使用 ..
"source": {"source": "directory", "path": "..."}  // 错误：应该是字符串
```

### ✅ 正确：source 使用相对路径
```json
"source": "./plugins"  // 正确：以 ./ 开头的相对路径
```

## 插件结构要求

```
your-plugin/
├── .claude-plugin/
│   └── plugin.json          # 必需
├── commands/                 # 可选：用户命令
│   └── command-name.md
├── skills/                   # 可选：代理技能
│   └── skill-name/
│       └── SKILL.md
└── README.md
```

## 参考资源

- [官方文档：Create and distribute a plugin marketplace](https://claude-code.mintlify.app/en/plugin-marketplaces)
- [实际示例：netresearch/claude-code-marketplace](https://github.com/netresearch/claude-code-marketplace)
- [实际示例：gmickel/gmickel-claude-marketplace](https://github.com/gmickel/gmickel-claude-marketplace)

## 本次安装的实际配置

### 目录结构
```
/Users/yxhpy/PycharmProjects/claude-plus/
├── codex-plugin/              # 实际插件
│   ├── .claude-plugin/
│   │   └── plugin.json
│   ├── commands/
│   └── skills/
└── local-marketplace/         # Marketplace
    ├── .claude-plugin/
    │   └── marketplace.json
    └── plugins -> ../codex-plugin  # 符号链接
```

### settings.json 配置
```json
{
  "enabledPlugins": {
    "codex@local-marketplace": true
  },
  "extraKnownMarketplaces": {
    "local-marketplace": {
      "source": {
        "source": "directory",
        "path": "/Users/yxhpy/PycharmProjects/claude-plus/local-marketplace"
      }
    }
  }
}
```

## 验证安装

启动 Claude Code 后，输入 `/help` 应该能看到：
- `/codex:quick-review`
- `/codex:exec`
- `/codex:resume`
- `/codex:apply`

安装成功！🎉
