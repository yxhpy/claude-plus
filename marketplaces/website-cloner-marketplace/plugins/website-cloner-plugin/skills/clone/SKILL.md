---
name: clone
description: 高保真克隆网站，使用通用脚本工具集和 Puppeteer 无头浏览器渲染完整内容，支持动态网站、懒加载图片和 SPA 应用。使用方式：/website-cloner:clone <网站URL>
---

# 网站克隆技能（脚本化版本）

你是一个专业的网站克隆工具。使用插件提供的通用脚本工具集，支持现代动态网站的完整克隆。

## 输入参数
- `$ARGUMENTS`: 要克隆的网站URL（例如：https://example.com）

## 🎯 核心优势

本插件提供了一套完整的通用脚本工具集，位于 `scripts/` 目录：

1. **clone-with-puppeteer.js** - Puppeteer 渲染引擎
2. **format-html.js** - HTML 格式化工具
3. **download-images.js** - 批量图片下载器
4. **extract-resources.sh** - 资源 URL 提取器
5. **clone-website.sh** - 一键完整克隆流程 ⭐

## 🚀 推荐使用方法

### 方法 1: 一键克隆（推荐）

使用完整流程脚本，自动执行所有步骤：

```bash
# 定位到脚本目录
PLUGIN_DIR="marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin"
cd "$PLUGIN_DIR/scripts"

# 执行克隆
./clone-website.sh <URL>
```

**示例**：
```bash
./clone-website.sh https://www.bilibili.com
```

这个脚本会自动：
- ✅ 创建目录结构
- ✅ 使用 Puppeteer 渲染页面
- ✅ 格式化 HTML
- ✅ 提取资源 URL
- ✅ 下载图片、CSS、JS
- ✅ 生成 README 文档
- ✅ 显示统计信息

### 方法 2: 使用 Bash 工具直接调用

```bash
bash marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin/scripts/clone-website.sh "$ARGUMENTS"
```

## 📋 克隆流程详解

当用户请求克隆网站时，执行以下步骤：

### 步骤 1: 定位插件脚本目录

```bash
PLUGIN_DIR="marketplaces/website-cloner-marketplace/plugins/website-cloner-plugin"
SCRIPT_DIR="$PLUGIN_DIR/scripts"
```

### 步骤 2: 执行一键克隆脚本

```bash
bash "$SCRIPT_DIR/clone-website.sh" "$ARGUMENTS"
```

## 🛠️ 脚本工具说明

### 1. clone-with-puppeteer.js
**功能**: 使用 Puppeteer 渲染完整页面

**特性**:
- 自动滚动触发懒加载
- 提取所有图片 URL
- 保存完整 HTML
- 生成页面截图

**用法**:
```bash
node scripts/clone-with-puppeteer.js <URL> <output-dir>
```

### 2. format-html.js
**功能**: 格式化压缩的 HTML

**特性**:
- 添加换行符
- IDE 友好格式
- 显示统计信息

**用法**:
```bash
node scripts/format-html.js <input> <output>
```

### 3. download-images.js
**功能**: 批量下载图片

**特性**:
- 支持限制数量
- 跳过已存在文件
- 显示进度

**用法**:
```bash
node scripts/download-images.js <urls-file> <output-dir> [limit]
```

### 4. extract-resources.sh
**功能**: 提取资源 URL

**特性**:
- 提取 CSS、JS、图片、字体
- 处理协议相对路径
- 生成分类列表

**用法**:
```bash
bash scripts/extract-resources.sh <html-file> <output-dir>
```

### 5. clone-website.sh ⭐
**功能**: 完整克隆流程

**特性**:
- 一键执行所有步骤
- 自动安装依赖
- 生成完整报告

**用法**:
```bash
bash scripts/clone-website.sh <URL>
```

## 📊 输出报告模板

克隆完成后，向用户报告：

```
✨ 网站克隆完成！

📊 统计信息：
- 源网站: <URL>
- 保存位置: cloned-sites/<域名>/
- 总大小: X MB
- HTML文件: 3 个
- CSS文件: X 个
- JavaScript文件: X 个
- 图片文件: X 个

📁 文件结构：
cloned-sites/<域名>/
├── index-full.html         # 完整格式化版本 ⭐
├── index-full-minified.html # 压缩版本
├── screenshot.png          # 页面截图
├── README.md              # 使用说明
├── css/                    # 样式文件
├── js/                     # JavaScript
├── images/                 # 图片资源
└── *-urls.txt             # 资源 URL 列表

🚀 本地预览：
cd cloned-sites/<域名>
python3 -m http.server 8000
访问: http://localhost:8000/index-full.html

⚠️  注意事项：
- 动态功能（API 调用、用户登录等）无法工作
- 仅下载了主要资源（图片限制 30 个）
- 适合学习网页结构和前端开发参考
```

## 🔧 自定义配置

### 修改图片下载数量

编辑 `clone-website.sh`，修改限制参数：
```bash
node "$SCRIPT_DIR/download-images.js" "$OUTPUT_DIR/image-urls.txt" "$OUTPUT_DIR/images" 50
```

### 修改滚动速度

编辑 `clone-with-puppeteer.js`：
```javascript
const distance = 100; // 每次滚动距离
```

### 添加更多资源类型

编辑 `extract-resources.sh`，添加新的提取规则。

## 📚 脚本文档

详细的脚本使用说明请参考：
- `scripts/README.md` - 完整的脚本文档
- 每个脚本文件头部的注释

## 🎯 最佳实践

1. ✅ 优先使用 `clone-website.sh` 一键克隆
2. ✅ 检查 `scripts/README.md` 了解详细用法
3. ✅ 根据需要调整下载限制
4. ✅ 保留多个 HTML 版本以备不同用途
5. ✅ 使用本地服务器预览（不要直接打开 HTML）

## 使用示例

```bash
# 克隆 Bilibili
/website-cloner:clone https://www.bilibili.com

# 克隆其他网站
/website-cloner:clone https://example.com
```

## 版权声明

克隆的网站内容仅供个人学习和研究使用，请勿用于商业用途或公开分发。
