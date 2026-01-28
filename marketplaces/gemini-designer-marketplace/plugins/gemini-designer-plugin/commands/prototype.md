---
description: 生成高保真交互式原型（支持单页或多页结构）
---

# 高保真原型生成器

使用 Gemini AI 生成完整的高保真交互式原型。支持两种模式：
- **单页模式**：所有代码（HTML + Tailwind CSS + JavaScript）打包到单个 HTML 文件中
- **多页模式**：按页面拆分成多个 HTML 文件，保持规范的目录结构

## 参数

- `description`: 原型描述（必需）- 详细描述你想要的界面和功能
- `type`: 原型类型（可选）- landing-page, dashboard, form, app, website 等，默认 landing-page
- `mode`: 生成模式（可选）- single（单页模式）或 multi（多页模式），默认 multi
- `features`: 额外特性（逗号分隔）- responsive, dark-mode, animations, interactive, forms
- `output`: 输出目录名（可选）- 默认为 `prototype-[timestamp]`

## 执行步骤

1. **解析用户需求**
   - 理解原型的目的和目标用户
   - 识别所需的交互功能
   - 确定视觉风格和布局
   - 解析 type、mode 和 features 参数
   - 识别是否需要多个页面（如：网站、应用等）

2. **确定生成模式**

   **多页模式（默认，推荐）**：
   - 适用于：完整网站、多页面应用、复杂原型
   - 目录结构：
     ```
     prototype-[name]/
     ├── index.html          # 首页/主页面
     ├── about.html          # 关于页面（如需要）
     ├── contact.html        # 联系页面（如需要）
     ├── [other-pages].html  # 其他页面
     ├── assets/
     │   ├── css/
     │   │   └── styles.css  # 共享样式（可选）
     │   └── js/
     │       └── main.js     # 共享脚本（可选）
     └── README.md           # 原型说明文档
     ```

   **单页模式**：
   - 适用于：简单落地页、单页应用、快速演示
   - 输出：单个 HTML 文件，所有代码内联

3. **使用 Gemini CLI 生成原型**

   根据模式构建不同的提示词：

   ### 多页模式提示词

   ```bash
   gemini --yolo -p "生成一个完整的多页面原型，按照规范的目录结构组织。

   需求描述: [description]
   原型类型: [type]
   特性要求: [features]

   请生成以下目录结构：

   prototype-[name]/
   ├── index.html          # 主页面
   ├── [page2].html        # 其他必要页面
   ├── [page3].html        # 其他必要页面
   ├── assets/
   │   ├── css/
   │   │   └── styles.css  # 共享样式
   │   └── js/
   │       └── main.js     # 共享脚本
   └── README.md

   每个 HTML 文件要求：

   1. HTML5 文档结构
      - 语义化标签
      - 完整的 meta 标签（viewport、charset、description）
      - ARIA 可访问性标签
      - 引用共享的 CSS 和 JS 文件

   2. 页面内容
      - 符合页面主题的完整内容
      - 导航栏（链接到其他页面）
      - 页脚（在所有页面保持一致）

   3. 样式系统（assets/css/styles.css）
      - 使用 Tailwind CSS CDN (v3.x)
      - 共享的自定义样式
      - 响应式设计（移动优先）
      - 暗色模式支持（如果 features 包含 dark-mode）

   4. JavaScript 功能（assets/js/main.js）
      - 原生 JavaScript（无外部依赖）
      - 导航交互
      - 共享的功能函数
      - 页面特定的交互（可内联在各页面）

   5. README.md
      - 原型说明
      - 页面列表和功能描述
      - 使用方法
      - 技术栈说明

   请为每个文件输出完整代码，使用以下格式：

   === FILE: index.html ===
   [完整的 HTML 代码]

   === FILE: about.html ===
   [完整的 HTML 代码]

   === FILE: assets/css/styles.css ===
   [完整的 CSS 代码]

   === FILE: assets/js/main.js ===
   [完整的 JavaScript 代码]

   === FILE: README.md ===
   [完整的 README 内容]
   "
   ```

   ### 单页模式提示词

   ```bash
   gemini --yolo -p "生成一个完整的高保真交互式原型，所有代码打包到单个 HTML 文件中。

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

4. **解析和保存文件**

   ### 多页模式

   - 解析 Gemini 输出，按 `=== FILE: [path] ===` 分隔
   - 创建目录结构：
     ```bash
     mkdir -p prototype-[name]/assets/css
     mkdir -p prototype-[name]/assets/js
     ```
   - 使用 Write 工具保存每个文件到对应路径
   - 确保所有文件路径正确，相对引用正确

   ### 单页模式

   - 使用 Write 工具保存为单个 .html 文件
   - 文件名：[output] 或 `prototype-[timestamp].html`
   - 保存位置：当前目录或 `./prototypes/` 目录

5. **输出报告和预览**

   ### 多页模式输出

   ```
   🎨 多页面原型生成完成！

   📦 原型信息:
   - 类型: [type]
   - 模式: 多页面结构
   - 特性: [features]
   - 页面数量: [页面数量]

   📁 生成的目录结构:
   prototype-[name]/
   ├── index.html          # 主页面
   ├── [page2].html        # [页面说明]
   ├── [page3].html        # [页面说明]
   ├── assets/
   │   ├── css/
   │   │   └── styles.css  # 共享样式
   │   └── js/
   │       └── main.js     # 共享脚本
   └── README.md           # 原型说明

   🌐 预览原型:
   - 在浏览器中打开: file://[绝对路径]/index.html
   - 或使用本地服务器:
     cd prototype-[name]
     python -m http.server 8000
     # 访问 http://localhost:8000

   ✨ 包含的页面和功能:
   - index.html: [功能说明]
   - [page2].html: [功能说明]
   - [page3].html: [功能说明]

   💡 提示:
   - 所有页面使用统一的样式和导航
   - 支持页面间跳转
   - 响应式设计，支持移动端和桌面端
   - 可以直接编辑各个文件进行调整
   ```

   ### 单页模式输出

   ```
   🎨 高保真原型生成完成！

   📦 原型信息:
   - 类型: [type]
   - 模式: 单页面
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

## 使用示例

```bash
# 生成多页面网站原型（默认模式）
/gemini-designer:prototype "一个企业官网，包含首页、关于我们、服务介绍和联系我们页面"

# 生成单页落地页原型
/gemini-designer:prototype "一个 SaaS 产品的落地页，包含 hero section、功能介绍和定价表" mode=single

# 生成多页面仪表板应用
/gemini-designer:prototype "管理后台系统，包含仪表板、用户管理、设置页面" type=dashboard features=responsive,dark-mode

# 生成单页交互式表单
/gemini-designer:prototype "用户注册表单，包含实时验证和进度指示" type=form mode=single features=interactive,animations

# 生成完整的多页面应用
/gemini-designer:prototype "电商网站，包含首页、商品列表、商品详情、购物车和结账页面" type=website features=interactive,responsive output=ecommerce-prototype
```

## 输出格式

### 多页模式输出

```
🎨 多页面原型生成完成！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 原型信息:
- 类型: [原型类型]
- 模式: 多页面结构
- 特性: [特性列表]
- 页面数量: [数量]

📁 目录结构:
prototype-[name]/
├── index.html
├── [其他页面].html
├── assets/
│   ├── css/styles.css
│   └── js/main.js
└── README.md

🌐 预览原型:
- 浏览器打开: file://[绝对路径]/index.html
- 本地服务器: cd prototype-[name] && python -m http.server 8000

✨ 页面列表:
- index.html: [页面功能说明]
- [page2].html: [页面功能说明]
- [page3].html: [页面功能说明]

💡 提示:
- 所有页面使用统一的样式和导航
- 支持页面间跳转
- 响应式设计，支持移动端和桌面端
- 可以直接编辑各个文件进行调整
```

### 单页模式输出

```
🎨 高保真原型生成完成！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📦 原型信息:
- 类型: [原型类型]
- 模式: 单页面
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

### 多页模式结构

**目录组织**：
```
prototype-[name]/
├── index.html              # 主页面（必需）
├── [page-name].html        # 其他页面
├── assets/
│   ├── css/
│   │   └── styles.css      # 共享样式
│   └── js/
│       └── main.js         # 共享脚本
└── README.md               # 原型说明
```

**HTML 文件结构**：
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[页面标题]</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="./assets/css/styles.css">
</head>
<body>
    <!-- 导航栏（所有页面一致） -->
    <nav>
        <a href="index.html">首页</a>
        <a href="about.html">关于</a>
        <a href="contact.html">联系</a>
    </nav>

    <!-- 页面内容 -->
    <main>
        <!-- 页面特定内容 -->
    </main>

    <!-- 页脚（所有页面一致） -->
    <footer>
        <!-- 页脚内容 -->
    </footer>

    <script src="./assets/js/main.js"></script>
    <script>
        // 页面特定的 JavaScript（如需要）
    </script>
</body>
</html>
```

**共享样式文件（assets/css/styles.css）**：
```css
/* 全局样式 */
:root {
    --primary-color: #3B82F6;
    --secondary-color: #10B981;
}

/* 导航栏样式 */
nav {
    /* 统一的导航样式 */
}

/* 页脚样式 */
footer {
    /* 统一的页脚样式 */
}

/* 其他共享样式 */
```

**共享脚本文件（assets/js/main.js）**：
```javascript
// 全局功能
document.addEventListener('DOMContentLoaded', function() {
    // 导航高亮当前页面
    const currentPage = window.location.pathname.split('/').pop();
    document.querySelectorAll('nav a').forEach(link => {
        if (link.getAttribute('href') === currentPage) {
            link.classList.add('active');
        }
    });

    // 其他共享功能
});
```

### 单页模式结构

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

### 多页面网站原型
```bash
# 企业官网
/gemini-designer:prototype "企业官网，包含首页、关于我们、服务、案例、联系我们页面"

# 电商网站
/gemini-designer:prototype "电商网站，包含首页、商品列表、商品详情、购物车、结账页面" type=website features=interactive,responsive

# 博客网站
/gemini-designer:prototype "个人博客，包含首页、文章列表、文章详情、关于页面" type=website features=responsive,dark-mode
```

### 单页应用原型
```bash
# 快速落地页
/gemini-designer:prototype "SaaS 产品落地页，包含 hero、功能、定价、FAQ" mode=single

# 简单表单
/gemini-designer:prototype "用户注册表单，包含实时验证" type=form mode=single features=interactive

# 单页仪表板
/gemini-designer:prototype "数据仪表板，包含图表和统计卡片" type=dashboard mode=single features=dark-mode
```

### 复杂应用原型
```bash
# 管理后台系统
/gemini-designer:prototype "管理后台，包含仪表板、用户管理、内容管理、设置页面" type=dashboard features=responsive,dark-mode,interactive

# 在线学习平台
/gemini-designer:prototype "在线课程平台，包含课程列表、课程详情、学习进度、个人中心" type=app features=interactive,responsive
```
