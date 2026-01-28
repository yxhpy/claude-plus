#!/bin/bash

# 西南交通大学峨眉校区网站本地预览启动脚本

echo "=========================================="
echo "  西南交通大学峨眉校区网站本地预览"
echo "=========================================="
echo ""
echo "正在启动本地服务器..."
echo ""

# 检查Python是否可用
if command -v python3 &> /dev/null; then
    echo "✅ 使用 Python3 启动服务器"
    echo "📍 访问地址: http://localhost:8000"
    echo "⚠️  按 Ctrl+C 停止服务器"
    echo ""
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "✅ 使用 Python 启动服务器"
    echo "📍 访问地址: http://localhost:8000"
    echo "⚠️  按 Ctrl+C 停止服务器"
    echo ""
    python -m SimpleHTTPServer 8000
else
    echo "❌ 错误: 未找到 Python"
    echo ""
    echo "请安装 Python 或使用以下替代方法："
    echo "1. 使用 Node.js: npx http-server -p 8000"
    echo "2. 直接打开: open index.html"
    exit 1
fi