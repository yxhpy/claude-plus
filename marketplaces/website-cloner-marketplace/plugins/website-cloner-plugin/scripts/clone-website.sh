#!/bin/bash
# Complete Website Cloning Workflow
# 完整的网站克隆流程
#
# Usage: ./clone-website.sh <URL>

set -e

if [ $# -lt 1 ]; then
    echo "❌ 用法: ./clone-website.sh <URL>"
    echo "   示例: ./clone-website.sh https://example.com"
    exit 1
fi

URL="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 提取域名
DOMAIN=$(echo "$URL" | sed -E 's|https?://||' | sed 's|/.*||' | sed 's|:.*||')
OUTPUT_DIR="cloned-sites/$DOMAIN"

echo "🌐 克隆网站: $URL"
echo "📁 输出目录: $OUTPUT_DIR"
echo ""

# 创建目录结构
echo "📂 创建目录结构..."
mkdir -p "$OUTPUT_DIR"/{css,js,images,fonts,assets}

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 错误: 未找到 Node.js"
    echo "   请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

# 检查 Puppeteer
if [ ! -d "/tmp/node_modules/puppeteer" ]; then
    echo "📦 安装 Puppeteer..."
    (cd /tmp && npm install puppeteer)
fi

# 阶段 1: 使用 Puppeteer 渲染页面
echo ""
echo "🚀 阶段 1: 使用 Puppeteer 渲染页面"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
node "$SCRIPT_DIR/clone-with-puppeteer.js" "$URL" "$OUTPUT_DIR"

# 阶段 2: 格式化 HTML
echo ""
echo "🔄 阶段 2: 格式化 HTML"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$OUTPUT_DIR/index-full.html" ]; then
    cp "$OUTPUT_DIR/index-full.html" "$OUTPUT_DIR/index-full-minified.html"
    node "$SCRIPT_DIR/format-html.js" "$OUTPUT_DIR/index-full-minified.html" "$OUTPUT_DIR/index-full.html"
fi

# 阶段 3: 提取资源 URL
echo ""
echo "🔍 阶段 3: 提取资源 URL"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
bash "$SCRIPT_DIR/extract-resources.sh" "$OUTPUT_DIR/index-full.html" "$OUTPUT_DIR"

# 阶段 4: 下载图片
echo ""
echo "📥 阶段 4: 下载图片（前 30 个）"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$OUTPUT_DIR/image-urls.txt" ]; then
    node "$SCRIPT_DIR/download-images.js" "$OUTPUT_DIR/image-urls.txt" "$OUTPUT_DIR/images" 30
fi

# 阶段 5: 下载 CSS
echo ""
echo "🎨 阶段 5: 下载 CSS 文件"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$OUTPUT_DIR/css-urls.txt" ]; then
    count=0
    while IFS= read -r url; do
        count=$((count+1))
        filename=$(basename "${url%%\?*}" | sed 's/@.*//')
        echo "[$count] 下载: $filename"
        curl -s -L "$url" -o "$OUTPUT_DIR/css/$filename" || echo "   失败"
        [ $count -ge 10 ] && break
    done < "$OUTPUT_DIR/css-urls.txt"
fi

# 阶段 6: 下载 JS
echo ""
echo "📜 阶段 6: 下载 JavaScript 文件"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$OUTPUT_DIR/js-urls.txt" ]; then
    count=0
    while IFS= read -r url; do
        count=$((count+1))
        filename=$(basename "${url%%\?*}" | sed 's/@.*//')
        echo "[$count] 下载: $filename"
        curl -s -L "$url" -o "$OUTPUT_DIR/js/$filename" || echo "   失败"
        [ $count -ge 10 ] && break
    done < "$OUTPUT_DIR/js-urls.txt"
fi

# 生成 README
echo ""
echo "📝 生成 README..."
cat > "$OUTPUT_DIR/README.md" << EOF
# $DOMAIN 网站克隆

## 克隆信息
- **源网站**: $URL
- **克隆时间**: $(date '+%Y-%m-%d %H:%M:%S')
- **克隆方法**: Puppeteer 无头浏览器 + 自动滚动

## 文件说明
- \`index-full.html\` - 完整格式化的 HTML（推荐使用）
- \`index-full-minified.html\` - 压缩版本
- \`screenshot.png\` - 页面截图
- \`css/\` - 样式文件
- \`js/\` - JavaScript 文件
- \`images/\` - 图片资源

## 本地预览
\`\`\`bash
python3 -m http.server 8000
# 访问 http://localhost:8000/index-full.html
\`\`\`

## 注意事项
- 动态功能（API 调用、用户登录等）无法工作
- 仅供学习和研究使用
EOF

# 统计信息
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ 克隆完成！"
echo ""
echo "📊 统计信息:"
echo "   位置: $OUTPUT_DIR"
echo "   大小: $(du -sh "$OUTPUT_DIR" | cut -f1)"
echo "   HTML: $(find "$OUTPUT_DIR" -name "*.html" | wc -l | tr -d ' ') 个"
echo "   CSS:  $(find "$OUTPUT_DIR/css" -type f 2>/dev/null | wc -l | tr -d ' ') 个"
echo "   JS:   $(find "$OUTPUT_DIR/js" -type f 2>/dev/null | wc -l | tr -d ' ') 个"
echo "   图片: $(find "$OUTPUT_DIR/images" -type f 2>/dev/null | wc -l | tr -d ' ') 个"
echo ""
echo "🚀 本地预览:"
echo "   cd $OUTPUT_DIR"
echo "   python3 -m http.server 8000"
echo ""
