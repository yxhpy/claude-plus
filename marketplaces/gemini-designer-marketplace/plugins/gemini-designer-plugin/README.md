# Gemini Designer

高级 UI/UX 和前端工程师插件，集成 Gemini API（使用 --yolo 模式）提供设计审查、组件生成和前端优化建议。

## 功能特性

🎨 **UI/UX 设计审查**
- 专业的设计评估和反馈
- 可访问性检查（WCAG 标准）
- 用户体验分析
- 视觉设计评价
- 响应式设计检查

⚡ **组件生成器**
- 支持 React、Vue、Angular、Svelte
- 生成符合最佳实践的代码
- 内置可访问性支持
- TypeScript 类型定义
- 多种样式方案（Tailwind、CSS Modules、Styled-components）

🚀 **性能优化**
- 代码性能分析
- 包体积优化建议
- 渲染性能改进
- 用户体验提升
- 具体的优化代码示例

🎯 **高保真原型生成**
- 生成完整的交互式原型（单个 HTML 文件）
- 集成 Tailwind CSS 和 JavaScript
- 支持落地页、仪表板、表单等多种类型
- 响应式设计和暗色模式
- 可直接在浏览器中预览

## 快速开始

### 前置要求

1. **安装 Gemini CLI**

本插件使用 Google 的 Gemini CLI 工具来调用 Gemini API。

**安装方法**：
```bash
npm install -g @google/generative-ai-cli
# 或
yarn global add @google/generative-ai-cli
```

**配置 API 密钥**：
```bash
gemini config set apiKey YOUR_API_KEY
```

获取 API 密钥：https://makersuite.google.com/app/apikey

**验证安装**：
```bash
gemini --version
gemini "Hello, Gemini!"  # 测试 API 调用
```

**重要说明**：本插件使用 `gemini --yolo` 模式来执行所有命令，这样可以跳过确认提示，实现更流畅的自动化体验。

### 安装

**方法 1: 直接加载（推荐开发使用）**

```bash
claude --plugin-dir ./gemini-designer-marketplace/plugins/gemini-designer-plugin
```

**方法 2: 通过 Marketplace 安装**

```bash
/plugin marketplace add ./gemini-designer-marketplace
/plugin install gemini-designer@gemini-designer-marketplace
```

### 基本使用

```bash
# UI/UX 设计审查
/gemini-designer:review current
/gemini-designer:review src/components/LoginForm.tsx

# 生成组件
/gemini-designer:generate button
/gemini-designer:generate modal framework=react style=tailwind

# 性能优化
/gemini-designer:optimize src/components
/gemini-designer:optimize src/pages/Dashboard.tsx focus=performance

# 生成高保真原型
/gemini-designer:prototype "SaaS 产品落地页，包含 hero section 和定价表"
/gemini-designer:prototype "管理后台仪表板" type=dashboard features=responsive,dark-mode
```

## 命令详解

### `/gemini-designer:review` - 设计审查

对 UI/UX 设计进行专业审查。

**语法**：
```bash
/gemini-designer:review <target> [focus=<aspect>]
```

**参数**：
- `target`: 文件路径或 "current"（当前目录）
- `focus`: 审查重点（可选）
  - `accessibility` - 可访问性
  - `performance` - 性能
  - `usability` - 可用性
  - `aesthetics` - 美学

**示例**：
```bash
# 审查当前目录所有前端文件
/gemini-designer:review current

# 审查特定组件
/gemini-designer:review src/components/Modal.tsx

# 重点审查可访问性
/gemini-designer:review src/components/Form.tsx focus=accessibility
```

### `/gemini-designer:generate` - 组件生成

生成高质量的前端组件代码。

**语法**：
```bash
/gemini-designer:generate <type> [framework=<name>] [style=<method>] [features=<list>]
```

**参数**：
- `type`: 组件类型（button, form, modal, card, navbar, etc.）
- `framework`: 前端框架（react, vue, angular, svelte）默认 react
- `style`: 样式方案（tailwind, css-modules, styled-components, plain-css）默认 tailwind
- `features`: 额外特性（逗号分隔）
  - `responsive` - 响应式设计
  - `accessible` - 可访问性
  - `animated` - 动画效果
  - `dark-mode` - 暗色模式支持

**示例**：
```bash
# 生成基础按钮
/gemini-designer:generate button

# 生成 Vue 表单组件
/gemini-designer:generate form framework=vue features=validation,accessible

# 生成响应式导航栏
/gemini-designer:generate navbar framework=react style=tailwind features=responsive,dark-mode
```

### `/gemini-designer:optimize` - 性能优化

优化现有 UI 代码的性能和用户体验。

**语法**：
```bash
/gemini-designer:optimize <target> [focus=<aspect>]
```

**参数**：
- `target`: 文件路径或目录
- `focus`: 优化重点（可选）
  - `performance` - 运行时性能
  - `bundle-size` - 包体积
  - `accessibility` - 可访问性
  - `ux` - 用户体验

**示例**：
```bash
# 优化整个组件目录
/gemini-designer:optimize src/components

# 优化特定文件的性能
/gemini-designer:optimize src/pages/Dashboard.tsx focus=performance

# 优化包体积
/gemini-designer:optimize src focus=bundle-size
```

### `/gemini-designer:prototype` - 高保真原型生成

生成完整的交互式原型，所有代码打包到单个 HTML 文件中。

**语法**：
```bash
/gemini-designer:prototype "<description>" [type=<type>] [features=<list>] [output=<filename>]
```

**参数**：
- `description`: 原型描述（必需）- 详细描述你想要的界面和功能
- `type`: 原型类型（可选）- landing-page, dashboard, form, app, website 等
- `features`: 额外特性（逗号分隔）
  - `responsive` - 响应式设计
  - `dark-mode` - 暗色模式支持
  - `animations` - 动画效果
  - `interactive` - 交互功能
  - `forms` - 表单验证
- `output`: 输出文件名（可选）- 默认为 `prototype-[timestamp].html`

**示例**：
```bash
# 生成基础落地页
/gemini-designer:prototype "SaaS 产品落地页，包含 hero section、功能介绍和定价表"

# 生成响应式仪表板
/gemini-designer:prototype "管理后台仪表板，包含侧边栏、数据卡片和图表" type=dashboard features=responsive,dark-mode

# 生成交互式表单
/gemini-designer:prototype "用户注册表单，包含实时验证和进度指示" type=form features=interactive,animations

# 生成完整应用
/gemini-designer:prototype "待办事项应用，支持添加、删除、标记完成" type=app features=interactive,dark-mode output=todo-app.html
```

## Agent 技能

插件包含以下自动技能，Claude 会在适当时候自动调用：

### `design-review`
当用户询问设计反馈或界面改进时自动触发。

**触发场景**：
- "这个设计怎么样？"
- "帮我看看这个界面"
- "UI 有什么问题"

### `component-generator`
当用户请求创建前端组件时自动触发。

**触发场景**：
- "帮我创建一个按钮组件"
- "生成一个表单"
- "我需要一个导航栏"

### `ui-optimizer`
当用户提到性能问题或需要优化时自动触发。

**触发场景**：
- "这个页面加载很慢"
- "优化这个组件的性能"
- "如何减少包体积"

### `prototype-generator`
当用户请求创建高保真原型、交互式演示或完整的单页面应用时自动触发。

**触发场景**：
- "创建一个原型"
- "生成一个演示页面"
- "做一个落地页"
- "帮我做一个完整的 HTML 页面"
- "生成一个可交互的界面"

## 项目结构

```
gemini-designer-marketplace/
├── .claude-plugin/
│   └── marketplace.json
└── plugins/
    └── gemini-designer-plugin/
        ├── .claude-plugin/
        │   └── plugin.json
        ├── commands/
        │   ├── review.md          # 设计审查命令
        │   ├── generate.md        # 组件生成命令
        │   ├── optimize.md        # 性能优化命令
        │   └── prototype.md       # 高保真原型生成命令
        ├── skills/
        │   ├── design-review/
        │   │   └── SKILL.md       # 自动设计审查
        │   ├── component-generator/
        │   │   └── SKILL.md       # 自动组件生成
        │   ├── ui-optimizer/
        │   │   └── SKILL.md       # 自动性能优化
        │   └── prototype-generator/
        │       └── SKILL.md       # 自动原型生成
        ├── README.md
        ├── validate.sh
        ├── .gitignore
        └── LICENSE
```

## 开发

### 验证插件

```bash
cd gemini-designer-marketplace/plugins/gemini-designer-plugin
./validate.sh
```

### 测试插件

```bash
claude --plugin-dir .
```

### 自定义配置

Gemini CLI 配置文件位于 `~/.gemini/config.json`。

查看当前配置：
```bash
gemini config list
```

修改模型或其他参数：
```bash
gemini config set model gemini-2.0-flash-exp
gemini config set temperature 0.7
```

## 使用场景

### 场景 1: 设计审查

```bash
# 你正在开发一个登录表单
/gemini-designer:review src/components/LoginForm.tsx

# Gemini 会分析并提供：
# - 可访问性问题（缺少 ARIA 标签）
# - UX 改进（添加密码显示/隐藏）
# - 视觉设计建议（改进错误提示样式）
# - 响应式问题（移动端布局）
```

### 场景 2: 快速生成组件

```bash
# 你需要一个可访问的模态框
/gemini-designer:generate modal features=accessible,animated

# Gemini 会生成：
# - 完整的 React 组件代码
# - TypeScript 类型定义
# - 键盘导航支持
# - ARIA 标签
# - 焦点陷阱
# - 平滑动画
```

### 场景 3: 性能优化

```bash
# 你的数据表格渲染很慢
/gemini-designer:optimize src/components/DataTable.tsx focus=performance

# Gemini 会提供：
# - 虚拟滚动实现
# - React.memo 优化
# - 数据结构改进
# - 预期性能提升数据
```

## 故障排除

### Gemini CLI 未安装

```
错误: gemini: command not found
```

**解决方案**：
1. 安装 Gemini CLI：`npm install -g @google/generative-ai-cli`
2. 验证安装：`gemini --version`

### API 密钥错误

```
错误: API key not configured
```

**解决方案**：
1. 配置 API 密钥：`gemini config set apiKey YOUR_API_KEY`
2. 验证配置：`gemini config list`
3. 测试 API：`gemini "Hello"`

### 插件未加载

```
错误: 命令不可用
```

**解决方案**：
1. 验证插件结构：`./validate.sh`
2. 检查 plugin.json 格式：`cat .claude-plugin/plugin.json | jq`
3. 使用正确路径加载：`claude --plugin-dir ./gemini-designer-marketplace/plugins/gemini-designer-plugin`

### API 调用失败

```
错误: API 请求失败
```

**解决方案**：
1. 检查网络连接
2. 验证 API 密钥有效性：`gemini "test"`
3. 检查 API 配额限制
4. 查看 Gemini CLI 日志：`gemini --debug "test"`

## 最佳实践

1. **设计审查**：
   - 在提交代码前运行审查
   - 重点关注可访问性
   - 定期审查关键页面

2. **组件生成**：
   - 明确指定框架和样式方案
   - 使用 features 参数添加必要特性
   - 生成后根据需求调整

3. **性能优化**：
   - 先诊断再优化
   - 关注用户体验影响最大的部分
   - 测量优化效果

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License
