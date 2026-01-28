---
description: 生成高保真交互式原型（单个 HTML 文件）
---

# 高保真原型生成器

使用 Gemini AI 生成完整的高保真交互式原型，所有代码（HTML + Tailwind CSS + JavaScript）打包到单个 HTML 文件中，可直接在浏览器中打开预览。

## 参数

- `description`: 原型描述（必需）- 详细描述你想要的界面和功能
- `type`: 原型类型（可选）- landing-page, dashboard, form, app, website 等，默认 landing-page
- `features`: 额外特性（逗号分隔）- responsive, dark-mode, animations, interactive, forms
- `output`: 输出文件名（可选）- 默认为 `prototype-[timestamp].html`

## 执行步骤

1. **解析用户需求**
   - 理解原型的目的和目标用户
   - 识别所需的交互功能
   - 确定视觉风格和布局
   - 解析 type 和 features 参数

2. **使用 Gemini CLI 生成完整原型**

   构建详细的原型生成提示词并调用 gemini CLI：

   ```bash
   gemini -p "生成一个完整的高保真交互式原型，所有代码打包到单个 HTML 文件中。

   需求描述: [description]
   原型类型: [type]
   特性要求: [features]

   请生成包含以下内容的完整 HTML 文件：

   1. HTML5 文档结构
      - 语义化标签
      - 完整的 meta 标签（viewport、charset、description）
      - ARIA 可访问性标签

   2. 样式系统
      - 使用 Tailwind CSS CDN (v3.x)
      - 响应式设计（移动优先）
      - 暗色模式支持（如果 features 包含 dark-mode）
      - 现代化的 UI 设计

   3. JavaScript 功能
      - 原生 JavaScript（无外部依赖）
      - 完整的交互功能
      - 表单验证（如果适用）
      - 动画效果（如果 features 包含 animations）
      - 状态管理（如果需要）

   4. 最佳实践
      - 移动优先设计
      - 性能优化
      - 跨浏览器兼容
      - SEO 友好
      - WCAG 2.1 可访问性

   只输出完整的 HTML 代码，不要解释。"
   ```

3. **一次性保存原型文件**
   - 使用 Write 工具保存为单个 .html 文件
   - 文件名：[output] 或 `prototype-[timestamp].html`
   - 保存位置：当前目录或 `./prototypes/` 目录

4. **输出报告和预览**

   ```
   🎨 高保真原型生成完成！

   📦 原型信息:
   - 类型: [type]
   - 特性: [features]
   - 文件大小: [文件大小]

   📁 生成的文件:
   - [文件路径]

   🌐 预览原型:
   - 浏览器打开: file://[绝对路径]
   - 或双击文件直接打开

   ✨ 包含的功能:
   [列出实现的功能]

   💡 提示:
   - 所有资源已内联，无需网络连接即可预览
   - 使用 Tailwind CSS CDN，支持所有 Tailwind 类
   - JavaScript 功能完全可交互
   - 响应式设计，支持移动端和桌面端
   ```

```bash
# 生成基础落地页原型
/gemini-designer:prototype "一个 SaaS 产品的落地页，包含 hero section、功能介绍和定价表"

# 生成响应式仪表板
/gemini-designer:prototype "管理后台仪表板，包含侧边栏、数据卡片和图表" type=dashboard features=responsive,dark-mode

# 生成交互式表单
/gemini-designer:prototype "用户注册表单，包含实时验证和进度指示" type=form features=interactive,animations

# 生成完整的单页应用
/gemini-designer:prototype "待办事项应用，支持添加、删除、标记完成" type=app features=interactive,dark-mode output=todo-app.html
```

## 输出格式

```
🎨 高保真原型生成完成！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 原型信息:
- 类型: [原型类型]
- 特性: [特性列表]
- 文件大小: [文件大小]

📁 生成的文件:
- [文件路径]

🌐 预览原型:
- 浏览器打开: file://[绝对路径]
- 或双击文件直接打开

✨ 包含的功能:
- [功能1说明]
- [功能2说明]
- [功能3说明]

💡 提示:
- 所有资源已内联，无需网络连接即可预览
- 使用 Tailwind CSS CDN，支持所有 Tailwind 类
- JavaScript 功能完全可交互
- 响应式设计，支持移动端和桌面端
```

## 技术细节

生成的 HTML 文件包含：

1. **HTML 结构**
   - 语义化的 HTML5 标签
   - 完整的 meta 标签（viewport、charset）
   - ARIA 可访问性标签

2. **样式系统**
   - Tailwind CSS v3.x CDN
   - 自定义 CSS（如需要）
   - 响应式断点（sm, md, lg, xl）
   - 暗色模式支持（如启用）

3. **JavaScript 功能**
   - 原生 JavaScript（无依赖）
   - 事件监听和处理
   - DOM 操作
   - 表单验证
   - 动画和过渡效果
   - 状态管理（如需要）

4. **最佳实践**
   - 移动优先设计
   - 性能优化
   - 跨浏览器兼容
   - SEO 友好的结构
   - 可访问性（WCAG 2.1）

## 使用场景

### 快速原型验证
```bash
/gemini-designer:prototype "电商产品详情页，包含图片轮播、规格选择和购买按钮"
```

### 客户演示
```bash
/gemini-designer:prototype "企业官网首页，包含导航、banner、服务介绍和联系表单" features=responsive,animations
```

### 设计探索
```bash
/gemini-designer:prototype "创意作品集网站，网格布局，悬停效果" type=website features=animations,dark-mode
```

### 功能测试
```bash
/gemini-designer:prototype "多步骤表单向导，包含进度条和验证" type=form features=interactive
```
