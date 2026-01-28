# Gemini Designer - 快速开始

## 5 分钟上手指南

### 1. 配置 API 密钥

创建环境变量文件：

```bash
# Windows
mkdir %USERPROFILE%\.gemini
notepad %USERPROFILE%\.gemini\.env

# Linux/Mac
mkdir -p ~/.gemini
nano ~/.gemini/.env
```

添加以下内容：

```bash
GEMINI_API_KEY=your_api_key_here
GEMINI_MODEL=gemini-2.0-flash-exp
GEMINI_TEMPERATURE=0.7
```

获取 API 密钥：https://makersuite.google.com/app/apikey

### 2. 加载插件

```bash
cd C:\project\claude-plus\claude-plus
claude --plugin-dir ./gemini-designer-marketplace/plugins/gemini-designer-plugin
```

### 3. 试用功能

#### 设计审查

```bash
# 审查当前目录的前端文件
/gemini-designer:review current

# 审查特定组件
/gemini-designer:review src/components/Button.tsx
```

#### 生成组件

```bash
# 生成一个按钮组件
/gemini-designer:generate button

# 生成可访问的模态框
/gemini-designer:generate modal features=accessible,animated
```

#### 性能优化

```bash
# 优化组件性能
/gemini-designer:optimize src/components/DataTable.tsx focus=performance
```

#### 生成高保真原型

```bash
# 生成落地页原型
/gemini-designer:prototype "SaaS 产品落地页，包含 hero section、功能介绍和定价表"

# 生成仪表板原型
/gemini-designer:prototype "管理后台仪表板" type=dashboard features=responsive,dark-mode
```

### 4. 自动技能

插件会自动响应你的需求：

```
你: "帮我看看这个登录表单的设计"
Claude: [自动调用 design-review 技能]

你: "我需要一个导航栏组件"
Claude: [自动调用 component-generator 技能]

你: "这个页面加载很慢"
Claude: [自动调用 ui-optimizer 技能]

你: "创建一个原型页面"
Claude: [自动调用 prototype-generator 技能]
```

## 常见使用场景

### 场景 1: 新项目开发

```bash
# 1. 生成基础组件
/gemini-designer:generate button framework=react style=tailwind features=accessible
/gemini-designer:generate form framework=react features=validation,accessible
/gemini-designer:generate navbar framework=react features=responsive,dark-mode

# 2. 审查设计
/gemini-designer:review src/components

# 3. 优化性能
/gemini-designer:optimize src focus=bundle-size
```

### 场景 2: 代码审查

```bash
# 审查可访问性
/gemini-designer:review src/pages focus=accessibility

# 审查用户体验
/gemini-designer:review src/components/Checkout.tsx focus=usability
```

### 场景 3: 性能调优

```bash
# 分析性能瓶颈
/gemini-designer:optimize src/pages/Dashboard.tsx focus=performance

# 减少包体积
/gemini-designer:optimize src focus=bundle-size
```

### 场景 4: 快速原型设计

```bash
# 生成落地页原型
/gemini-designer:prototype "电商产品详情页，包含图片轮播、规格选择和购买按钮"

# 生成交互式应用
/gemini-designer:prototype "待办事项应用，支持添加、删除、标记完成" type=app features=interactive,dark-mode

# 生成表单原型
/gemini-designer:prototype "多步骤注册表单，包含进度条和验证" type=form features=interactive,animations
```

## 提示和技巧

1. **明确需求**：提供详细的组件描述会得到更好的结果
2. **使用 features**：通过 features 参数添加特定功能
3. **迭代改进**：生成后可以要求 Gemini 进一步优化
4. **关注可访问性**：始终包含 accessible 特性

## 故障排除

### 问题：API 密钥错误

```
错误: GEMINI_API_KEY 未设置
```

**解决**：检查 `~/.gemini/.env` 文件是否存在且包含正确的 API 密钥。

### 问题：插件未加载

```
错误: 命令不可用
```

**解决**：确保使用正确的路径加载插件：
```bash
claude --plugin-dir ./gemini-designer-marketplace/plugins/gemini-designer-plugin
```

### 问题：生成的代码不符合预期

**解决**：提供更详细的需求描述，或使用 features 参数指定具体特性。

## 下一步

- 阅读完整文档：`README.md`
- 查看命令详解：`commands/` 目录
- 了解技能机制：`skills/` 目录
- 自定义配置：编辑 `.env` 文件

## 获取帮助

- GitHub Issues: https://github.com/claude-plus/claude-plus/issues
- 文档：README.md
- 验证插件：`./validate.sh`
