#!/bin/bash
# Extract Resources from HTML
# 从 HTML 文件中提取 CSS、JS、图片等资源 URL
#
# Usage: ./extract-resources.sh <html-file> <output-dir>

set -e

if [ $# -lt 2 ]; then
    echo "❌ 用法: ./extract-resources.sh <html-file> <output-dir>"
    exit 1
fi

HTML_FILE="$1"
OUTPUT_DIR="$2"

echo "📖 读取 HTML 文件: $HTML_FILE"

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 提取 CSS URL
echo "🎨 提取 CSS 文件..."
grep -o 'href="[^"]*\.css[^"]*"' "$HTML_FILE" | \
    sed 's/href="//;s/"$//' | \
    sed 's|^//|https://|' > "$OUTPUT_DIR/css-urls.txt" || true

CSS_COUNT=$(wc -l < "$OUTPUT_DIR/css-urls.txt" | tr -d ' ')
echo "   找到 $CSS_COUNT 个 CSS 文件"

# 提取 JS URL
echo "📜 提取 JavaScript 文件..."
grep -o 'src="[^"]*\.js[^"]*"' "$HTML_FILE" | \
    sed 's/src="//;s/"$//' | \
    sed 's|^//|https://|' > "$OUTPUT_DIR/js-urls.txt" || true

JS_COUNT=$(wc -l < "$OUTPUT_DIR/js-urls.txt" | tr -d ' ')
echo "   找到 $JS_COUNT 个 JS 文件"

# 提取图片 URL（包括协议相对路径）
echo "🖼️  提取图片文件..."
{
    grep -o 'src="[^"]*\.\(jpg\|jpeg\|png\|gif\|webp\|svg\)[^"]*"' "$HTML_FILE" | \
        sed 's/src="//;s/"$//' || true
    grep -o 'src="//[^"]*"' "$HTML_FILE" | \
        grep -E '\.(jpg|jpeg|png|gif|webp|svg)' | \
        sed 's/src="//;s/"$//' || true
} | sed 's|^//|https://|' | sort -u > "$OUTPUT_DIR/image-urls.txt"

IMG_COUNT=$(wc -l < "$OUTPUT_DIR/image-urls.txt" | tr -d ' ')
echo "   找到 $IMG_COUNT 个图片文件"

# 提取字体 URL
echo "🔤 提取字体文件..."
grep -o 'url([^)]*\.\(woff\|woff2\|ttf\|eot\)[^)]*)' "$HTML_FILE" | \
    sed 's/url(//;s/)$//;s/["'\'']//g' | \
    sed 's|^//|https://|' > "$OUTPUT_DIR/font-urls.txt" || true

FONT_COUNT=$(wc -l < "$OUTPUT_DIR/font-urls.txt" | tr -d ' ')
echo "   找到 $FONT_COUNT 个字体文件"

echo ""
echo "✨ 提取完成！"
echo "📊 统计:"
echo "   CSS:  $CSS_COUNT"
echo "   JS:   $JS_COUNT"
echo "   图片: $IMG_COUNT"
echo "   字体: $FONT_COUNT"
echo ""
echo "📁 输出目录: $OUTPUT_DIR"
