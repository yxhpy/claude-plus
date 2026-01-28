---
name: component-generator
description: 当用户请求创建或生成前端组件时自动调用。适用于生成 React、Vue、Angular 等框架的 UI 组件。
---

# 自动组件生成技能

当 Claude 检测到用户需要生成前端组件时，自动调用此技能。

## 触发场景

- 用户说"帮我创建一个按钮组件"
- 用户请求"生成一个表单"
- 用户提到"我需要一个导航栏"
- 用户询问"如何实现一个模态框"
- 用户描述组件需求

## 执行流程

1. **理解需求**
   - 识别组件类型（button, form, modal, card, etc.）
   - 确定技术栈（React, Vue, Angular, etc.）
   - 识别特殊要求（响应式、可访问性、动画等）

2. **使用 Gemini CLI 生成代码**

   直接调用 gemini CLI 工具生成组件：

   ```bash
   gemini --yolo -p "生成一个 [组件类型] 组件，使用 [框架]。

   要求：
   - 完整的 TypeScript 类型定义
   - 符合 [框架] 最佳实践
   - 可访问性支持（ARIA 标签、键盘导航）
   - [特殊要求]
   - 清晰的代码注释和 Props 文档

   只输出代码，不要解释。"
   ```

3. **一次性创建文件**
   - 使用 Write 工具在 `./components/[ComponentName]/` 目录创建组件文件
   - 生成主组件文件（.tsx/.vue/.svelte）
   - 生成类型定义文件（如果需要）
   - 创建 README.md 使用说明

4. **输出报告**
   ```
   🎨 组件生成完成！

   📦 组件信息:
   - 类型: [组件类型]
   - 框架: [框架名称]
   - 特性: [特性列表]

   📁 生成的文件:
   - components/[ComponentName]/[ComponentName].tsx
   - components/[ComponentName]/README.md

   ✨ 特性说明:
   [列出实现的特性]

   💡 使用方法:
   [简单的使用示例]
   ```

## 示例对话

**用户**: "帮我创建一个可访问的模态框组件，使用 React 和 Tailwind"

**Claude**: 我来生成一个符合可访问性标准的模态框组件。

[使用 gemini CLI 生成组件代码]
[使用 Write 工具创建文件]

🎨 组件生成完成！

我已经创建了一个功能完整的模态框组件，包含：

✨ 特性：
- 完整的键盘导航支持（ESC 关闭）
- ARIA 标签和角色
- 焦点陷阱（Focus Trap）
- 背景滚动锁定
- 平滑的进入/退出动画
- 响应式设计

📁 生成的文件：
- components/Modal/Modal.tsx
- components/Modal/README.md

[显示代码...]

## 优势

- ✅ 使用官方 Gemini CLI 工具
- ✅ 一次性完成，无重复验证
- ✅ 更快的响应速度
- ✅ 更可靠的执行
