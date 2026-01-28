# 🚀 快速入门指南

## 5分钟上手 Website Cloner Plugin

### 第一步：测试插件

在项目根目录执行：

```bash
cd /Users/yxhpy/PycharmProjects/claude-plus
./website-cloner-plugin/test-plugin.sh
```

或者手动启动：

```bash
claude --plugin-dir ./website-cloner-plugin
```

### 第二步：克隆你的第一个网站

在 Claude Code 启动后，输入：

```
/website-cloner:clone https://example.com
```

### 第三步：查看结果

```bash
# 查看克隆的文件
ls -la cloned-sites/example.com/

# 启动本地服务器预览
cd cloned-sites/example.com
python -m http.server 8000
```

然后在浏览器中访问：`http://localhost:8000`

## 🎯 常用命令

### 克隆简单网站
```
/website-cloner:clone https://example.com
```

### 克隆复杂网站
```
/website-cloner:clone https://www.anthropic.com
```

### 克隆特定页面
```
/website-cloner:clone https://example.com/about
```

## 📋 检查清单

- [x] 插件已创建
- [x] 目录结构正确
- [x] 命令文件已配置
- [x] 技能文件已配置
- [x] 文档已完善

## ✅ 验证安装

运行以下命令验证插件是否正确安装：

```bash
# 1. 检查插件目录结构
ls -la website-cloner-plugin/

# 2. 检查必需文件
cat website-cloner-plugin/.claude-plugin/plugin.json

# 3. 启动测试
./website-cloner-plugin/test-plugin.sh
```

## 🎓 学习资源

- **README.md** - 完整功能说明
- **EXAMPLES.md** - 详细使用示例
- **PROJECT_STRUCTURE.md** - 项目结构说明

## 💡 提示

1. **首次使用**：建议先克隆简单的静态网站（如 example.com）
2. **大型网站**：克隆可能需要几分钟，请耐心等待
3. **本地预览**：务必使用 HTTP 服务器，不要直接打开 HTML 文件
4. **路径问题**：如果样式不正常，检查浏览器控制台的错误信息

## 🆘 遇到问题？

### 问题：命令未找到
**解决**：确保使用正确的命令格式：`/website-cloner:clone`

### 问题：URL 无法访问
**解决**：检查 URL 是否正确，是否包含 `https://`

### 问题：样式显示不正常
**解决**：使用 HTTP 服务器预览，不要直接打开文件

## 🎉 开始使用

现在你已经准备好了！运行测试脚本开始克隆你的第一个网站吧：

```bash
./website-cloner-plugin/test-plugin.sh
```

祝你使用愉快！🚀
