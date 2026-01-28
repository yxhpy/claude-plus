# 西南交通大学峨眉校区网站克隆

## 📋 基本信息

- **源网站**: https://em.swjtu.edu.cn/
- **克隆时间**: 2026-01-28
- **保存位置**: cloned-sites/em.swjtu.edu.cn/

## 📊 统计信息

- **HTML文件**: 1 个
- **CSS文件**: 5 个
- **JavaScript文件**: 6 个
- **图片文件**: 36 个（包含所有CSS背景图片）
- **总大小**: 约 71 MB

## 📁 目录结构

```
em.swjtu.edu.cn/
├── index.html          # 主页面
├── css/                # 样式文件
│   ├── swiper.css
│   ├── style.css
│   ├── animate.css
│   ├── slick.css
│   └── index.vsb.css
├── js/                 # JavaScript文件
│   ├── jquery.js
│   ├── swiper.js
│   ├── set.js
│   ├── style.js
│   ├── animate.js
│   └── slick.js
├── images/             # 图片资源
│   ├── logox.png       # Logo
│   ├── shoutu1.png     # Banner图片
│   ├── news*.jpg/png   # 新闻图片
│   ├── work*.jpg/png   # 工作动态图片
│   └── campus*.png/jpg # 校区风光图片
├── fonts/              # 字体文件（预留）
└── assets/             # 其他资源（预留）
```

## 🚀 本地预览方法

### 方法1：使用Python（推荐）

```bash
cd /Users/yxhpy/PycharmProjects/claude-plus/cloned-sites/em.swjtu.edu.cn
python3 -m http.server 8000
```

然后在浏览器中访问：http://localhost:8000

### 方法2：使用Node.js

```bash
npx http-server /Users/yxhpy/PycharmProjects/claude-plus/cloned-sites/em.swjtu.edu.cn -p 8000
```

然后在浏览器中访问：http://localhost:8000

### 方法3：直接打开

```bash
open index.html
```

或者直接双击 `index.html` 文件在浏览器中打开。

## ⚠️ 注意事项

1. **动态功能限制**: 某些需要后端API的动态功能可能无法正常工作，例如：
   - 搜索功能
   - 表单提交
   - 动态数据加载
   - 用户登录/认证

2. **外部链接**: 页面中的外部链接（如学校主页、其他子页面）仍然指向原网站

3. **资源完整性**: 已下载主要的CSS、JS和图片资源，但部分通过JavaScript动态加载的资源可能未包含

4. **版权声明**: 本克隆仅用于学习和研究目的，所有内容版权归西南交通大学峨眉校区所有

## 🔧 技术栈

- **前端框架**: 无（原生HTML/CSS/JS）
- **轮播组件**: Swiper.js, Slick.js
- **动画库**: Animate.css
- **JavaScript库**: jQuery

## 📝 已完成的工作

✅ 下载所有CSS样式文件
✅ 下载所有JavaScript文件
✅ 下载所有CSS背景图片（navbg.png, bg.png, textBg.png等12个）
✅ 下载Banner轮播图片
✅ 下载新闻图片
✅ 下载工作动态图片
✅ 下载校区风光图片
✅ 下载Logo和图标
✅ 修正HTML中的资源路径为相对路径
✅ 修正CSS中的图片路径为相对路径

## 🎯 克隆质量

- **页面结构**: ✅ 完整保留
- **样式效果**: ✅ 完整保留
- **交互功能**: ⚠️ 部分保留（静态功能正常，动态API功能不可用）
- **图片资源**: ✅ 主要图片已下载
- **响应式布局**: ✅ 保留

---

**克隆工具**: Claude Code Website Cloner
**生成时间**: 2026-01-28
