#!/usr/bin/env node
/**
 * Website Cloner - Puppeteer Script
 * 使用无头浏览器渲染完整网站内容
 *
 * Usage: node clone-with-puppeteer.js <URL> <output-dir>
 */

const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

async function cloneWebsite(url, outputDir) {
  console.log('🚀 启动 Puppeteer 浏览器...');

  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  try {
    const page = await browser.newPage();
    await page.setViewport({ width: 1920, height: 1080 });

    console.log(`📡 正在访问: ${url}`);
    await page.goto(url, {
      waitUntil: 'networkidle2',
      timeout: 30000
    });

    // 自动滚动页面触发懒加载
    console.log('📜 滚动页面加载更多内容...');
    await page.evaluate(async () => {
      await new Promise((resolve) => {
        let totalHeight = 0;
        const distance = 100;
        const timer = setInterval(() => {
          const scrollHeight = document.body.scrollHeight;
          window.scrollBy(0, distance);
          totalHeight += distance;

          if (totalHeight >= scrollHeight) {
            clearInterval(timer);
            resolve();
          }
        }, 100);
      });
    });

    // 等待图片加载
    console.log('⏳ 等待资源加载...');
    await new Promise(resolve => setTimeout(resolve, 5000));

    // 提取所有图片 URL
    const imageUrls = await page.evaluate(() => {
      const urls = new Set();

      // img 标签的 src
      document.querySelectorAll('img[src]').forEach(img => {
        if (img.src && img.src.startsWith('http')) {
          urls.add(img.src);
        }
      });

      // data-src（懒加载）
      document.querySelectorAll('[data-src]').forEach(el => {
        let src = el.getAttribute('data-src');
        if (src && !src.endsWith('.js')) {
          if (src.startsWith('//')) src = 'https:' + src;
          if (src.startsWith('http')) urls.add(src);
        }
      });

      // 背景图片
      document.querySelectorAll('[style*="background"]').forEach(el => {
        const style = el.getAttribute('style');
        const match = style.match(/url\(['"]?([^'")\s]+)['"]?\)/);
        if (match && match[1].startsWith('http')) {
          urls.add(match[1]);
        }
      });

      return Array.from(urls);
    });

    console.log(`🖼️  找到 ${imageUrls.length} 个图片 URL`);

    // 获取完整渲染后的 HTML
    const html = await page.content();

    // 确保输出目录存在
    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }

    // 保存 HTML
    const htmlPath = path.join(outputDir, 'index-full.html');
    fs.writeFileSync(htmlPath, html);
    console.log(`✅ HTML 已保存: ${htmlPath}`);

    // 截图（只截取可视区域）
    const screenshotPath = path.join(outputDir, 'screenshot.png');
    await page.screenshot({
      path: screenshotPath,
      fullPage: false
    });
    console.log(`📸 截图已保存: ${screenshotPath}`);

    // 保存图片 URL 列表
    const urlsPath = path.join(outputDir, 'image-urls.txt');
    fs.writeFileSync(urlsPath, imageUrls.join('\n'));
    console.log(`📝 图片 URL 列表已保存: ${urlsPath}`);

    return {
      htmlPath,
      screenshotPath,
      urlsPath,
      imageCount: imageUrls.length
    };

  } finally {
    await browser.close();
    console.log('🔒 浏览器已关闭');
  }
}

// 主函数
(async () => {
  const args = process.argv.slice(2);

  if (args.length < 2) {
    console.error('❌ 用法: node clone-with-puppeteer.js <URL> <output-dir>');
    process.exit(1);
  }

  const [url, outputDir] = args;

  try {
    const result = await cloneWebsite(url, outputDir);
    console.log('\n✨ 克隆完成！');
    console.log(`📊 统计: ${result.imageCount} 个图片 URL`);
  } catch (error) {
    console.error('❌ 克隆失败:', error.message);
    process.exit(1);
  }
})();
