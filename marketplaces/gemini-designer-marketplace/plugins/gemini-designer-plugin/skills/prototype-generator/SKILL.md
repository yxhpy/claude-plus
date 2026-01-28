---
name: prototype-generator
description: 当用户请求创建高保真原型、交互式演示或完整的单页面应用时自动触发。生成包含 HTML + Tailwind CSS + JavaScript 的单文件原型。
---

# 高保真原型生成器技能

自动识别用户的原型需求，调用 Gemini API 生成完整的交互式原型。

## 触发场景

当用户提到以下需求时自动触发：

- "创建一个原型"
- "生成一个演示页面"
- "做一个落地页"
- "帮我做一个完整的 HTML 页面"
- "生成一个可交互的界面"
- "创建一个单页应用"
- "做一个网站原型"

## 执行流程

### 1. 需求分析

从用户描述中提取：
- **原型类型**：landing-page, dashboard, form, app, website
- **核心功能**：用户期望的主要功能和交互
- **视觉风格**：现代、简约、专业、创意等
- **特殊要求**：响应式、暗色模式、动画等

### 2. 使用 Gemini CLI 生成原型

构建详细的原型生成提示词并调用 gemini CLI：

```bash
gemini -p "生成一个完整的高保真交互式原型，所有代码打包到单个 HTML 文件中。

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

### 3. 一次性保存原型文件

使用 Write 工具保存为单个 .html 文件：
- 文件名：`prototype-[timestamp].html` 或用户指定的名称
- 保存位置：当前目录或 `./prototypes/` 目录

### 4. 输出结果

向用户展示：

```
🎨 高保真原型生成完成！

📦 原型信息:
- 类型: [原型类型]
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

### HTML 模板结构

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

### 场景 1: 落地页原型

**用户输入**：
"创建一个 SaaS 产品的落地页，包含 hero section、功能介绍和定价表"

**生成内容**：
- Hero section 带背景渐变和 CTA 按钮
- 三栏功能介绍卡片
- 响应式定价表
- 页脚导航
- 平滑滚动动画

### 场景 2: 仪表板原型

**用户输入**：
"生成一个管理后台仪表板，包含侧边栏、数据卡片和图表"

**生成内容**：
- 可折叠的侧边栏导航
- 顶部搜索栏
- 数据统计卡片（带图标）
- 模拟图表（使用 CSS）
- 响应式布局（移动端汉堡菜单）

### 场景 3: 表单原型

**用户输入**：
"创建一个多步骤注册表单，包含进度条和实时验证"

**生成内容**：
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
