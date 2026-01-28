#!/bin/bash

# Website Cloner Plugin 测试脚本

echo "🚀 启动 Claude Code 并加载 Website Cloner 插件..."
echo ""
echo "插件位置: $(pwd)/website-cloner-plugin"
echo ""
echo "使用方法："
echo "  1. 启动后输入: /website-cloner:clone https://example.com"
echo "  2. 等待克隆完成"
echo "  3. 在 cloned-sites/ 目录查看结果"
echo ""
echo "按 Ctrl+C 退出"
echo ""

# 启动 Claude Code 并加载插件
claude --plugin-dir ./website-cloner-plugin
