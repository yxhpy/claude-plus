#!/bin/bash
# 插件更新自动化脚本
# 用法: ./update-plugin.sh <plugin-path> <new-version> [description]

set -e

PLUGIN_PATH="$1"
NEW_VERSION="$2"
NEW_DESC="$3"

if [ -z "$PLUGIN_PATH" ] || [ -z "$NEW_VERSION" ]; then
  echo "用法: $0 <plugin-path> <new-version> [description]"
  echo "示例: $0 ./plugins/my-plugin 1.1.0 '新功能描述'"
  exit 1
fi

PLUGIN_JSON="$PLUGIN_PATH/.claude-plugin/plugin.json"

if [ ! -f "$PLUGIN_JSON" ]; then
  echo "❌ 错误: 找不到 $PLUGIN_JSON"
  exit 1
fi

echo "📦 更新插件: $PLUGIN_PATH"
echo "🔄 新版本: $NEW_VERSION"

# 备份原文件
cp "$PLUGIN_JSON" "$PLUGIN_JSON.bak"
echo "✅ 已备份: $PLUGIN_JSON.bak"

# 更新版本号
jq --arg ver "$NEW_VERSION" '.version = $ver' "$PLUGIN_JSON" > "$PLUGIN_JSON.tmp"
mv "$PLUGIN_JSON.tmp" "$PLUGIN_JSON"
echo "✅ 版本号已更新"

# 更新描述（如果提供）
if [ -n "$NEW_DESC" ]; then
  jq --arg desc "$NEW_DESC" '.description = $desc' "$PLUGIN_JSON" > "$PLUGIN_JSON.tmp"
  mv "$PLUGIN_JSON.tmp" "$PLUGIN_JSON"
  echo "✅ 描述已更新"
fi

# 查找并更新 marketplace.json
MARKETPLACE_JSON=$(find "$PLUGIN_PATH/../.." -name "marketplace.json" 2>/dev/null | head -1)
if [ -n "$MARKETPLACE_JSON" ]; then
  PLUGIN_NAME=$(jq -r '.name' "$PLUGIN_JSON")
  cp "$MARKETPLACE_JSON" "$MARKETPLACE_JSON.bak"

  # 更新 marketplace 中的插件版本
  jq --arg name "$PLUGIN_NAME" --arg ver "$NEW_VERSION" \
    '(.plugins[] | select(.name == $name) | .version) = $ver' \
    "$MARKETPLACE_JSON" > "$MARKETPLACE_JSON.tmp"
  mv "$MARKETPLACE_JSON.tmp" "$MARKETPLACE_JSON"

  echo "✅ marketplace.json 已同步"
fi

# 验证 JSON 格式
if jq empty "$PLUGIN_JSON" 2>/dev/null; then
  echo "✅ JSON 格式验证通过"
else
  echo "❌ JSON 格式错误，已恢复备份"
  mv "$PLUGIN_JSON.bak" "$PLUGIN_JSON"
  exit 1
fi

echo ""
echo "🎉 更新完成！"
echo ""
echo "下一步："
echo "1. 测试插件: cd $PLUGIN_PATH && claude --plugin-dir ."
echo "2. 验证结构: ./validate.sh"
echo "3. 提交更改: git add . && git commit -m 'Update to v$NEW_VERSION'"
