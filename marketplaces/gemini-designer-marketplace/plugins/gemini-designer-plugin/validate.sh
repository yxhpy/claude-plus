#!/bin/bash

echo "🔍 验证 Gemini Designer 插件结构..."
echo ""

PLUGIN_DIR="."
ERRORS=0

# 检查必需文件
echo "📁 检查必需文件..."

required_files=(
    ".claude-plugin/plugin.json"
    "commands/review.md"
    "commands/generate.md"
    "commands/optimize.md"
    "commands/prototype.md"
    "skills/design-review/SKILL.md"
    "skills/component-generator/SKILL.md"
    "skills/ui-optimizer/SKILL.md"
    "skills/prototype-generator/SKILL.md"
    "README.md"
    "LICENSE"
    ".gitignore"
)

for file in "${required_files[@]}"; do
    if [ -f "$PLUGIN_DIR/$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (缺失)"
        ((ERRORS++))
    fi
done

echo ""
echo "📋 验证 JSON 格式..."

# 验证 plugin.json
if command -v jq &> /dev/null; then
    if jq empty "$PLUGIN_DIR/.claude-plugin/plugin.json" 2>/dev/null; then
        echo "  ✅ plugin.json 格式正确"
    else
        echo "  ❌ plugin.json 格式错误"
        ((ERRORS++))
    fi
else
    echo "  ⚠️  未安装 jq，跳过 JSON 验证"
fi

echo ""
echo "🔑 检查 Gemini CLI 配置..."

# 检查 gemini CLI 是否安装
if command -v gemini &> /dev/null; then
    echo "  ✅ Gemini CLI 已安装"

    # 检查 API 密钥配置
    if gemini config list 2>/dev/null | grep -q "apiKey"; then
        echo "  ✅ API 密钥已配置"
    else
        echo "  ⚠️  API 密钥未配置"
        echo "     请运行: gemini config set apiKey YOUR_API_KEY"
    fi
else
    echo "  ⚠️  Gemini CLI 未安装"
    echo "     请运行: npm install -g @google/generative-ai-cli"
fi

echo ""
echo "📊 验证结果："
if [ $ERRORS -eq 0 ]; then
    echo "  ✅ 所有检查通过！"
    echo ""
    echo "🚀 下一步："
    echo "  1. 测试插件: claude --plugin-dir ."
    echo "  2. 使用命令: /gemini-designer:review current"
    exit 0
else
    echo "  ❌ 发现 $ERRORS 个错误"
    echo ""
    echo "请修复上述问题后重试"
    exit 1
fi
