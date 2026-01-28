# Website Cloner Scripts

这个目录包含了网站克隆插件使用的所有通用脚本。

## 📁 脚本列表

### 1. `clone-with-puppeteer.js`
使用 Puppeteer 无头浏览器渲染完整网站内容。

**功能**:
- 启动无头浏览器
- 自动滚动触发懒加载
- 提取所有图片 URL
- 保存完整渲染的 HTML
- 生成页面截图

**用法**:
```bash
node clone-with-puppeteer.js <URL> <output-dir>
```

**示例**:
```bash
node clone-with-puppeteer.js https://example.com ./output
```

---

### 2. `format-html.js`
格式化压缩的 HTML，使其 IDE 友好。

**功能**:
- 在标签间添加换行符
- 移除多余空行
- 显示格式化统计信息

**用法**:
```bash
node format-html.js <input-file> <output-file>
```

**示例**:
```bash
node format-html.js index-minified.html index-formatted.html
```

---

### 3. `download-images.js`
从 URL 列表批量下载图片。

**功能**:
- 从文本文件读取 URL 列表
- 批量下载图片
- 支持限制下载数量
- 自动跳过已存在的文件
- 显示下载进度

**用法**:
```bash
node download-images.js <urls-file> <output-dir> [limit]
```

**参数**:
- `urls-file`: 包含图片 URL 的文本文件（每行一个）
- `output-dir`: 图片保存目录
- `limit`: 可选，下载数量限制（默认 50）

**示例**:
```bash
node download-images.js image-urls.txt ./images 30
```

---

### 4. `extract-resources.sh`
从 HTML 文件中提取所有资源 URL。

**功能**:
- 提取 CSS 文件 URL
- 提取 JavaScript 文件 URL
- 提取图片 URL（包括协议相对路径）
- 提取字体文件 URL
- 生成分类的 URL 列表文件

**用法**:
```bash
./extract-resources.sh <html-file> <output-dir>
```

**示例**:
```bash
./extract-resources.sh index.html ./resources
```

**输出文件**:
- `css-urls.txt` - CSS 文件 URL 列表
- `js-urls.txt` - JavaScript 文件 URL 列表
- `image-urls.txt` - 图片 URL 列表
- `font-urls.txt` - 字体文件 URL 列表

---

### 5. `clone-website.sh` ⭐
完整的网站克隆流程（推荐使用）。

**功能**:
- 自动执行完整克隆流程
- 创建目录结构
- 使用 Puppeteer 渲染页面
- 格式化 HTML
- 提取资源 URL
- 下载图片、CSS、JS
- 生成 README 文档
- 显示统计信息

**用法**:
```bash
./clone-website.sh <URL>
```

**示例**:
```bash
./clone-website.sh https://www.bilibili.com
```

**输出结构**:
```
cloned-sites/
└── example.com/
    ├── index-full.html
    ├── index-full-minified.html
    ├── screenshot.png
    ├── README.md
    ├── css/
    ├── js/
    ├── images/
    ├── fonts/
    └── assets/
```

---

## 🚀 快速开始

### 前置要求

1. **Node.js** (v14+)
   ```bash
   node --version
   ```

2. **Puppeteer**
   ```bash
   cd /tmp && npm install puppeteer
   ```

### 完整克隆流程

使用一键脚本：
```bash
./clone-website.sh https://example.com
```

### 手动分步执行

如果需要更多控制，可以手动执行各个步骤：

```bash
# 1. 使用 Puppeteer 渲染
node clone-with-puppeteer.js https://example.com ./output

# 2. 格式化 HTML
node format-html.js ./output/index-full.html ./output/index-formatted.html

# 3. 提取资源 URL
./extract-resources.sh ./output/index-formatted.html ./output

# 4. 下载图片
node download-images.js ./output/image-urls.txt ./output/images 30
```

---

## 📊 性能优化

### 限制下载数量
```bash
# 只下载前 20 个图片
node download-images.js image-urls.txt ./images 20
```

### 并行下载
使用 `xargs` 并行下载：
```bash
cat image-urls.txt | head -30 | xargs -P 5 -I {} curl -s -L {} -o images/$(basename {})
```

### 过滤资源
```bash
# 过滤掉追踪脚本
grep -v "analytics\|tracking\|ads" js-urls.txt > js-urls-filtered.txt
```

---

## 🐛 故障排除

### Puppeteer 安装失败
```bash
# 使用淘宝镜像
npm config set puppeteer_download_host=https://npm.taobao.org/mirrors
npm install puppeteer
```

### 权限错误
```bash
chmod +x *.sh
```

### 内存不足
```bash
# 限制 Node.js 内存
node --max-old-space-size=4096 clone-with-puppeteer.js <URL> <output>
```

---

## 🔧 自定义配置

### 修改滚动速度
编辑 `clone-with-puppeteer.js`，修改 `distance` 参数：
```javascript
const distance = 100; // 每次滚动距离（像素）
```

### 修改等待时间
```javascript
await new Promise(resolve => setTimeout(resolve, 5000)); // 等待 5 秒
```

### 修改截图设置
```javascript
await page.screenshot({
  path: screenshotPath,
  fullPage: true,  // 改为 true 截取完整页面
  quality: 80      // JPEG 质量（1-100）
});
```

---

## 📝 最佳实践

1. ✅ 使用 `clone-website.sh` 进行完整克隆
2. ✅ 限制图片下载数量（30-50个）
3. ✅ 定期清理 `/tmp/node_modules`
4. ✅ 检查 `robots.txt` 尊重网站规则
5. ✅ 仅用于学习和研究目的

---

## 📄 许可证

MIT License - 仅供学习和研究使用
