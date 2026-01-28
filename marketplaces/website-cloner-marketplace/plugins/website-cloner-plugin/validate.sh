#!/bin/bash
# 插件验证脚本 - 基于 Claude Code 插件开发指南

PLUGIN_DIR="$(dirname "$0")"

echo "🔍 验证 Website Cloner Plugin..."
echo ""

# 1. 检查必需文件
echo "📋 检查必需文件..."
if [ ! -f "$PLUGIN_DIR/.claude-plugin/plugin.json" ]; then
    echo "❌ 缺少 .claude-plugin/plugin.json"
    exit 1
fi
echo "✅ plugin.json 存在"

if [ ! -d "$PLUGIN_DIR/skills" ]; then
    echo "❌ 缺少 skills/ 目录"
    exit 1
fi
echo "✅ skills/ 目录存在"

# 2. 检查 SKILL.md 文件
echo ""
echo "📋 检查技能文件..."
SKILL_COUNT=$(find "$PLUGIN_DIR/skills" -name "SKILL.md" | wc -l)
if [ $SKILL_COUNT -eq 0 ]; then
    echo "❌ 未找到 SKILL.md 文件"
    exit 1
fi
echo "✅ 找到 $SKILL_COUNT 个技能文件"

# 3. 验证 JSON 格式
echo ""
echo "📋 验证 JSON 格式..."
if ! python3 -m json.tool "$PLUGIN_DIR/.claude-plugin/plugin.json" > /dev/null 2>&1; then
    echo "❌ plugin.json 格式错误"
    exit 1
fi
echo "✅ JSON 格式正确"

# 4. 检查 repository 格式
echo ""
echo "📋 检查 repository 格式..."
REPO_TYPE=$(python3 -c "import json; data=json.load(open('$PLUGIN_DIR/.claude-plugin/plugin.json')); print(type(data.get('repository', '')).__name__)" 2>/dev/null)
if [ "$REPO_TYPE" != "str" ]; then
    echo "⚠️  repository 应该是字符串格式，当前是: $REPO_TYPE"
else
    echo "✅ repository 格式正确（字符串）"
fi

# 5. 运行官方验证
echo ""
echo "📋 运行官方验证..."
if claude plugin validate "$PLUGIN_DIR"; then
    echo ""
    echo "🎉 所有检查通过！插件验证成功！"
    echo ""
    echo "📦 插件信息："
    python3 -c "import json; data=json.load(open('$PLUGIN_DIR/.claude-plugin/plugin.json')); print(f\"  名称: {data['name']}\n  版本: {data['version']}\n  描述: {data['description']}\")"
    echo ""
    echo "🚀 测试插件："
    echo "  claude --plugin-dir $PLUGIN_DIR"
    echo ""
    echo "🎯 使用技能："
    echo "  /website-cloner:clone https://example.com"
else
    echo ""
    echo "❌ 官方验证失败，请检查错误信息"
    exit 1
fi
