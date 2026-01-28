---
description: 对当前 UI/UX 设计进行专业审查，提供改进建议
---

# UI/UX 设计审查

使用 Gemini AI 对当前的 UI/UX 设计进行专业审查。

## 参数
- `target`: 要审查的目标（文件路径、组件名称或 "current" 表示当前工作目录）
- `focus`: 审查重点（可选）：accessibility, performance, usability, aesthetics

## 执行步骤

1. **读取目标文件**
   - 如果用户指定了文件路径，使用 Read 工具读取该文件
   - 如果是 "current"，使用 Glob 工具扫描当前目录的前端文件（.jsx, .tsx, .vue, .html, .css）

2. **使用 Gemini CLI 进行审查**

   构建审查提示词并调用 gemini CLI：

   ```bash
   gemini --yolo -p "作为资深 UI/UX 设计师，审查以下代码：

   [代码内容]

   从以下角度进行专业审查：
   - 可访问性 (Accessibility): ARIA 标签、键盘导航、屏幕阅读器支持
   - 用户体验 (UX): 交互流程、反馈机制、错误处理
   - 视觉设计 (UI): 布局、颜色、字体、间距、一致性
   - 响应式设计: 移动端适配、断点设计
   - 性能: 渲染性能、动画流畅度

   重点关注: [focus]

   请提供：
   1. 优点列表
   2. 问题和改进建议（包含代码示例）
   3. 各维度评分（1-10分）
   4. 总结和优先改进建议"
   ```

3. **一次性输出审查报告**
   - 直接显示 Gemini 的审查结果
   - 格式化输出，便于阅读
   - 无需多次验证

## 示例

```bash
# 审查当前目录的所有前端文件
/gemini-designer:review current

# 审查特定组件
/gemini-designer:review src/components/LoginForm.tsx

# 重点审查可访问性
/gemini-designer:review src/components/Modal.tsx focus=accessibility
```

## 输出格式

```
🎨 UI/UX 设计审查报告
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 审查目标: [文件路径]
🎯 审查重点: [focus 或 "全面审查"]

✅ 优点:
- [列出设计优点]

⚠️ 问题和建议:

1. [问题类别]
   问题: [具体问题描述]
   建议: [改进建议]
   示例代码: [如果适用]

2. ...

📊 评分:
- 可访问性: [评分]/10
- 用户体验: [评分]/10
- 视觉设计: [评分]/10
- 响应式: [评分]/10
- 性能: [评分]/10

💡 总结:
[总体评价和优先改进建议]
```
