---
name: prototype-generator
description: 当用户请求创建高保真原型、交互式演示或完整的单页/多页应用时自动触发。默认生成多页面结构，按页面拆分成独立的 HTML 文件，保持规范的目录结构。
---

# 高保真原型生成器技能

自动识别用户的原型需求，调用 Gemini API 生成完整的交互式原型。支持单页和多页两种模式，默认使用多页模式以保持规范的目录结构。

## 触发场景

当用户提到以下需求时自动触发：

- "创建一个原型"
- "生成一个演示页面"
- "做一个落地页"
- "帮我做一个完整的 HTML 页面"
- "生成一个可交互的界面"
- "创建一个单页应用"
- "做一个网站原型"
- "生成一个多页面网站"
- "创建一个完整的网站"

## 执行流程

### 1. 需求分析

从用户描述中提取：
- **原型类型**：landing-page, dashboard, form, app, website
- **生成模式**：判断是否需要多页面（默认多页）
  - 多页面：网站、应用、多个页面的原型
  - 单页面：简单落地页、单个表单、快速演示
- **核心功能**：用户期望的主要功能和交互
- **视觉风格**：现代、简约、专业、创意等
- **特殊要求**：响应式、暗色模式、动画等

### 2. 确定生成模式

**自动判断规则**：
- 用户提到"网站"、"多个页面"、"完整的" → 多页模式
- 用户提到"单页"、"落地页"、"表单" → 可选单页模式
- 默认：多页模式（更规范）

### 2. 使用 Gemini CLI 生成原型

根据模式构建不同的提示词：

#### 多页模式（默认）

```bash
gemini --yolo -p "生成一个完整的多页面原型，按照规范的目录结构组织。

需求描述: [用户的描述]
原型类型: [类型]
特性要求: [特性列表]

请生成以下目录结构的所有文件：

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
   - 引用共享的 CSS 和 JS 文件：
     <link rel=\"stylesheet\" href=\"./assets/css/styles.css\">
     <script src=\"./assets/js/main.js\"></script>

2. 页面内容
   - 符合页面主题的完整内容
   - 统一的导航栏（链接到其他页面）
   - 统一的页脚

3. 样式系统（assets/css/styles.css）
   - 使用 Tailwind CSS CDN (v3.x)
   - 共享的自定义样式
   - 响应式设计（移动优先）
   - 暗色模式支持（如果需要）

4. JavaScript 功能（assets/js/main.js）
   - 原生 JavaScript（无外部依赖）
   - 导航交互和高亮
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

#### 单页模式

```bash
gemini --yolo -p "生成一个完整的高保真交互式原型，所有代码打包到单个 HTML 文件中。

需求描述: [用户的描述]
原型类型: [类型]
特性要求: [特性列表]

请生成包含以下内容的完整 HTML 文件：

1. HTML5 文档结构
   - 语义化标签
   - 完整的 meta 标签（viewport、charset、description）
   - ARIA 可访问性标签

2. 样式系统
   - 使用 Tailwind CSS CDN (v3.x)
   - 响应式设计（移动优先）
   - 暗色模式支持（如果需要）
   - 现代化的 UI 设计

3. JavaScript 功能
   - 原生 JavaScript（无外部依赖）
   - 完整的交互功能
   - 表单验证（如果适用）
   - 动画效果（如果需要）
   - 状态管理（如果需要）

4. 最佳实践
   - 移动优先设计
   - 性能优化
   - 跨浏览器兼容
   - SEO 友好
   - WCAG 2.1 可访问性

只输出完整的 HTML 代码，不要解释。"
```

### 3. 解析和保存文件

#### 多页模式

1. 解析 Gemini 输出，按 `=== FILE: [path] ===` 分隔各个文件
2. 创建目录结构：
   ```bash
   mkdir -p prototype-[name]/assets/css
   mkdir -p prototype-[name]/assets/js
   ```
3. 使用 Write 工具保存每个文件到对应路径
4. 确保所有文件路径正确，相对引用正确

#### 单页模式

使用 Write 工具保存为单个 .html 文件：
- 文件名：`prototype-[timestamp].html` 或用户指定的名称
- 保存位置：当前目录或 `./prototypes/` 目录

### 4. 输出结果

#### 多页模式输出

向用户展示：

```
🎨 多页面原型生成完成！

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
在浏览器中打开 index.html 或使用本地服务器：
cd prototype-[name] && python -m http.server 8000

✨ 页面列表:
- index.html: [页面功能说明]
- [page2].html: [页面功能说明]

💡 使用提示:
- 所有页面使用统一的样式和导航
- 支持页面间跳转
- 可以直接编辑各个文件进行调整
```

#### 单页模式输出

```
🎨 高保真原型生成完成！

📦 原型信息:
- 类型: [原型类型]
- 模式: 单页面
- 特性: [特性列表]
- 文件大小: [文件大小]

📁 生成的文件:
- [文件路径]

🌐 预览原型:
在浏览器中打开文件即可预览

✨ 包含的功能:
- [列出主要功能]

💡 使用提示:
- 双击文件直接在浏览器中打开
- 所有资源已内联，无需网络连接
- 可以直接编辑 HTML 文件进行调整
```

## 技术实现

### 多页模式目录结构

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

### HTML 模板结构（多页模式）

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

### HTML 模板结构（单页模式）

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[原型标题]</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* 自定义样式（如需要） */
    </style>
</head>
<body class="bg-gray-50">
    <!-- 原型内容 -->

    <script>
        // JavaScript 交互代码
    </script>
</body>
</html>
```

### Tailwind CSS 配置

如需自定义配置，可以内联配置：

```html
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    primary: '#3B82F6',
                    secondary: '#10B981',
                }
            }
        }
    }
</script>
```

### JavaScript 最佳实践

```javascript
// 使用 DOMContentLoaded 确保 DOM 加载完成
document.addEventListener('DOMContentLoaded', function() {
    // 初始化代码

    // 事件监听
    document.getElementById('btn').addEventListener('click', function() {
        // 处理逻辑
    });

    // 表单验证
    const form = document.getElementById('form');
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        // 验证逻辑
    });
});
```

## 示例场景

### 场景 1: 多页面企业网站

**用户输入**：
"创建一个企业官网，包含首页、关于我们、服务介绍和联系我们页面"

**生成内容**：
- index.html: Hero section、公司简介、核心服务预览
- about.html: 公司历史、团队介绍、企业文化
- services.html: 详细的服务列表和说明
- contact.html: 联系表单、地图、联系方式
- assets/css/styles.css: 统一的品牌样式
- assets/js/main.js: 导航交互、表单验证
- README.md: 网站说明和使用指南

### 场景 2: 单页落地页

**用户输入**：
"创建一个 SaaS 产品的落地页，包含 hero section、功能介绍和定价表"

**生成内容**（单页模式）：
- Hero section 带背景渐变和 CTA 按钮
- 三栏功能介绍卡片
- 响应式定价表
- 页脚导航
- 平滑滚动动画

### 场景 3: 多页面仪表板

**用户输入**：
"生成一个管理后台，包含仪表板、用户管理、设置页面"

**生成内容**：
- index.html (dashboard): 数据统计卡片、图表
- users.html: 用户列表、搜索、分页
- settings.html: 配置选项、表单
- 统一的侧边栏导航（所有页面）
- 响应式布局（移动端汉堡菜单）

### 场景 4: 单页表单

**用户输入**：
"创建一个多步骤注册表单，包含进度条和实时验证"

**生成内容**（单页模式）：
- 步骤进度指示器
- 表单字段验证（邮箱、密码强度）
- 下一步/上一步按钮
- 错误提示信息
- 成功提交动画

## 环境配置

确保 Gemini API 已配置：

```bash
# ~/.gemini/.env
GEMINI_API_KEY=your_api_key_here
GEMINI_MODEL=gemini-2.0-flash-exp
GEMINI_TEMPERATURE=0.7
```

## 调用 API 脚本

使用 `scripts/gemini-api.sh` 调用 Gemini API：

```bash
#!/bin/bash

# 加载环境变量
source ~/.gemini/.env

# 调用 API
curl -X POST "https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${GEMINI_API_KEY}" \
  -H 'Content-Type: application/json' \
  -d '{
    "contents": [{
      "parts": [{
        "text": "'"$PROMPT"'"
      }]
    }],
    "generationConfig": {
      "temperature": '"${GEMINI_TEMPERATURE}"',
      "maxOutputTokens": 8192
    }
  }'
```

## 质量保证

生成的原型应满足：

1. **功能完整性**
   - 所有描述的功能都已实现
   - 交互逻辑正确无误
   - 表单验证有效

2. **视觉质量**
   - 现代化的设计风格
   - 合理的颜色搭配
   - 适当的间距和排版

3. **响应式设计**
   - 移动端（< 640px）
   - 平板端（640px - 1024px）
   - 桌面端（> 1024px）

4. **可访问性**
   - 语义化 HTML 标签
   - ARIA 标签
   - 键盘导航支持
   - 足够的颜色对比度

5. **性能**
   - 最小化的 JavaScript
   - 优化的 CSS 类
   - 快速加载时间

## 故障处理

### API 调用失败

```javascript
try {
    const response = await callGeminiAPI(prompt);
    if (!response.ok) {
        throw new Error('API 调用失败');
    }
} catch (error) {
    console.error('生成原型失败:', error);
    // 提供降级方案或错误提示
}
```

### HTML 格式错误

如果生成的 HTML 不完整：
1. 检查 API 响应是否被截断
2. 增加 maxOutputTokens 参数
3. 简化原型需求，分步生成

### 样式不生效

确保：
1. Tailwind CSS CDN 正确加载
2. 类名拼写正确
3. 没有 CSS 冲突

## 最佳实践

1. **明确需求**：鼓励用户提供详细的描述
2. **渐进增强**：先生成基础版本，再添加高级功能
3. **测试验证**：生成后在浏览器中测试
4. **文档说明**：在 HTML 中添加注释说明关键部分
5. **可维护性**：代码结构清晰，易于后续修改
