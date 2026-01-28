---
description: 生成高质量的前端组件代码
---

# 组件生成器

使用 Gemini AI 生成符合最佳实践的前端组件。

## 参数
- `type`: 组件类型（button, form, modal, card, navbar, etc.）
- `framework`: 前端框架（react, vue, angular, svelte）默认 react
- `style`: 样式方案（tailwind, css-modules, styled-components, plain-css）默认 tailwind
- `features`: 额外特性（逗号分隔）：responsive, accessible, animated, dark-mode

## 执行步骤

1. **解析用户需求**
   - 确定组件类型和框架
   - 识别所需特性
   - 构建组件规格

2. **使用 Gemini CLI 生成代码**

   使用 `gemini` CLI 工具直接生成组件代码：

   ```bash
   gemini --yolo -p "生成一个 [type] 组件，使用 [framework] 和 [style]。
   要求：
   - 完整的 TypeScript 类型定义
   - [features] 特性支持
   - 符合 [framework] 最佳实践
   - 包含可访问性支持（ARIA 标签、键盘导航）
   - 清晰的代码注释和 Props 文档

   只输出代码，不要解释。"
   ```

3. **一次性创建文件**

   直接使用 Write 工具创建组件文件：
   - 在 `./components/[ComponentName]/` 目录创建组件
   - 生成主组件文件（.tsx/.vue/.svelte）
   - 生成类型定义文件（如果需要）
   - 创建 README.md 使用说明

4. **输出报告**

   ```
   🎨 组件生成完成！

   📦 组件信息:
   - 类型: [type]
   - 框架: [framework]
   - 样式: [style]
   - 特性: [features]

   📁 生成的文件:
   - components/[ComponentName]/[ComponentName].tsx
   - components/[ComponentName]/README.md

   ✨ 特性说明:
   [列出实现的特性]

   💡 使用方法:
   [简单的使用示例]
   ```

## 示例

```bash
# 生成基础按钮组件
/gemini-designer:generate button

# 生成 Vue 表单组件，带验证
/gemini-designer:generate form framework=vue features=validation,accessible

# 生成响应式导航栏，支持暗色模式
/gemini-designer:generate navbar framework=react style=tailwind features=responsive,dark-mode

# 生成动画卡片组件
/gemini-designer:generate card features=animated,accessible
```

## 优势

- ✅ 使用官方 Gemini CLI 工具
- ✅ 无需手动配置 API 密钥（gemini CLI 已处理）
- ✅ 一次性完成，无重复验证
- ✅ 更快的响应速度
- ✅ 更可靠的执行
