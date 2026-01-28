#!/bin/bash

echo "🔍 验证 plugin-updater 插件结构..."
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 错误计数
errors=0
warnings=0

# 检查必需文件
echo "📁 检查必需文件..."

required_files=(
  ".claude-plugin/plugin.json"
  "commands/update.md"
  "skills/update/SKILL.md"
  "README.md"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    echo -e "${GREEN}✓${NC} $file"
  else
    echo -e "${RED}✗${NC} $file (缺失)"
    ((errors++))
  fi
done

echo ""

# 验证 plugin.json 格式
echo "🔧 验证 plugin.json 格式..."

if [ -f ".claude-plugin/plugin.json" ]; then
  if command -v jq &> /dev/null; then
    if jq empty .claude-plugin/plugin.json 2>/dev/null; then
      echo -e "${GREEN}✓${NC} JSON 格式正确"

      # 检查必需字段
      required_fields=("name" "description" "version" "author")
      for field in "${required_fields[@]}"; do
        if jq -e ".$field" .claude-plugin/plugin.json > /dev/null 2>&1; then
          echo -e "${GREEN}✓${NC} 字段 '$field' 存在"
        else
          echo -e "${RED}✗${NC} 字段 '$field' 缺失"
          ((errors++))
        fi
      done
    else
      echo -e "${RED}✗${NC} JSON 格式错误"
      ((errors++))
    fi
  else
    echo -e "${YELLOW}⚠${NC} jq 未安装，跳过 JSON 验证"
    ((warnings++))
  fi
else
  echo -e "${RED}✗${NC} plugin.json 不存在"
  ((errors++))
fi

echo ""

# 检查 SKILL.md 格式
echo "🎯 验证 SKILL.md 格式..."

if [ -f "skills/update/SKILL.md" ]; then
  if grep -q "^name:" skills/update/SKILL.md; then
    echo -e "${GREEN}✓${NC} SKILL.md 包含 'name' 字段"
  else
    echo -e "${RED}✗${NC} SKILL.md 缺少 'name' 字段"
    ((errors++))
  fi

  if grep -q "^description:" skills/update/SKILL.md; then
    echo -e "${GREEN}✓${NC} SKILL.md 包含 'description' 字段"
  else
    echo -e "${RED}✗${NC} SKILL.md 缺少 'description' 字段"
    ((errors++))
  fi
else
  echo -e "${RED}✗${NC} SKILL.md 不存在"
  ((errors++))
fi

echo ""

# 检查命令文件
echo "📝 验证命令文件..."

if [ -f "commands/update.md" ]; then
  if grep -q "^description:" commands/update.md; then
    echo -e "${GREEN}✓${NC} update.md 包含 description"
  else
    echo -e "${YELLOW}⚠${NC} update.md 缺少 description（可选）"
    ((warnings++))
  fi
else
  echo -e "${RED}✗${NC} update.md 不存在"
  ((errors++))
fi

echo ""

# 总结
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $errors -eq 0 ]; then
  echo -e "${GREEN}✅ 验证通过！${NC}"
  echo "插件结构完整，可以使用。"
  exit 0
else
  echo -e "${RED}❌ 验证失败！${NC}"
  echo "发现 $errors 个错误，$warnings 个警告"
  echo "请修复错误后重试。"
  exit 1
fi
