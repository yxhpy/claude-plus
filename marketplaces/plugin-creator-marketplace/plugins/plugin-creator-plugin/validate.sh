#!/bin/bash

echo "🔍 验证 Plugin Creator 插件结构..."
echo ""

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查计数
PASSED=0
FAILED=0

# 检查函数
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $1 (缺失)"
        ((FAILED++))
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $1/ (缺失)"
        ((FAILED++))
    fi
}

check_json() {
    if [ -f "$1" ]; then
        if jq empty "$1" 2>/dev/null; then
            echo -e "${GREEN}✓${NC} $1 (JSON 格式正确)"
            ((PASSED++))
        else
            echo -e "${YELLOW}⚠${NC} $1 (JSON 格式可能有问题)"
            ((FAILED++))
        fi
    else
        echo -e "${RED}✗${NC} $1 (缺失)"
        ((FAILED++))
    fi
}

echo "📁 检查目录结构..."
check_dir ".claude-plugin"
check_dir "commands"
check_dir "skills"
check_dir "skills/create"
echo ""

echo "⚙️  检查配置文件..."
check_json ".claude-plugin/plugin.json"
echo ""

echo "📝 检查命令文件..."
check_file "commands/create.md"
echo ""

echo "🎨 检查技能文件..."
check_file "skills/create/SKILL.md"
echo ""

echo "📚 检查文档文件..."
check_file "README.md"
check_file "QUICKSTART.md"
check_file "INSTALL.sh"
check_file "LICENSE"
check_file ".gitignore"
echo ""

echo "🔧 检查脚本权限..."
if [ -x "INSTALL.sh" ]; then
    echo -e "${GREEN}✓${NC} INSTALL.sh (可执行)"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} INSTALL.sh (不可执行，运行: chmod +x INSTALL.sh)"
fi
echo ""

# 总结
echo "================================"
echo "验证结果："
echo -e "${GREEN}通过: $PASSED${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "${RED}失败: $FAILED${NC}"
    echo ""
    echo "❌ 验证未通过，请检查缺失的文件"
    exit 1
else
    echo -e "${RED}失败: $FAILED${NC}"
    echo ""
    echo "✅ 验证通过！插件结构正确"
    echo ""
    echo "🚀 下一步："
    echo "  1. 测试插件: claude --plugin-dir ."
    echo "  2. 创建新插件: /plugin-creator:create my-plugin"
    echo "  3. 查看文档: cat README.md"
    exit 0
fi
