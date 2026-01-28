#!/usr/bin/env node
/**
 * Image Downloader
 * 从 URL 列表下载图片
 *
 * Usage: node download-images.js <urls-file> <output-dir> [limit]
 */

const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');

async function downloadFile(url, filepath) {
  return new Promise((resolve, reject) => {
    const protocol = url.startsWith('https') ? https : http;
    const file = fs.createWriteStream(filepath);

    protocol.get(url, (response) => {
      if (response.statusCode === 200) {
        response.pipe(file);
        file.on('finish', () => {
          file.close();
          resolve();
        });
      } else {
        file.close();
        fs.unlink(filepath, () => {});
        reject(new Error(`HTTP ${response.statusCode}`));
      }
    }).on('error', (err) => {
      file.close();
      fs.unlink(filepath, () => {});
      reject(err);
    });
  });
}

async function downloadImages(urlsFile, outputDir, limit = 50) {
  console.log(`📖 读取 URL 列表: ${urlsFile}`);
  const content = fs.readFileSync(urlsFile, 'utf8');
  const urls = content.split('\n').filter(line => line.trim());

  console.log(`🔍 找到 ${urls.length} 个 URL`);

  // 限制下载数量
  const urlsToDownload = urls.slice(0, limit);
  console.log(`📥 将下载前 ${urlsToDownload.length} 个图片`);

  // 确保输出目录存在
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  let downloaded = 0;
  let failed = 0;

  for (const url of urlsToDownload) {
    try {
      // 提取文件名
      let filename = path.basename(url.split('?')[0]);
      // 移除 @ 后的参数（如 @976w_550h）
      filename = filename.replace(/@.*/, '');

      if (!filename || filename.length > 100) {
        filename = `image-${downloaded}.jpg`;
      }

      const filepath = path.join(outputDir, filename);

      // 跳过已存在的文件
      if (fs.existsSync(filepath)) {
        console.log(`⏭️  [${downloaded + failed + 1}/${urlsToDownload.length}] 跳过: ${filename}`);
        continue;
      }

      await downloadFile(url, filepath);
      downloaded++;
      console.log(`✅ [${downloaded + failed}/${urlsToDownload.length}] ${filename}`);

    } catch (err) {
      failed++;
      console.error(`❌ [${downloaded + failed}/${urlsToDownload.length}] ${err.message}`);
    }
  }

  return { downloaded, failed, total: urls.length };
}

// 主函数
(async () => {
  const args = process.argv.slice(2);

  if (args.length < 2) {
    console.error('❌ 用法: node download-images.js <urls-file> <output-dir> [limit]');
    console.error('   limit: 下载数量限制（默认 50）');
    process.exit(1);
  }

  const [urlsFile, outputDir, limitStr] = args;
  const limit = limitStr ? parseInt(limitStr) : 50;

  try {
    const result = await downloadImages(urlsFile, outputDir, limit);
    console.log('\n✨ 下载完成！');
    console.log(`📊 成功: ${result.downloaded}, 失败: ${result.failed}, 总计: ${result.total}`);
  } catch (error) {
    console.error('❌ 下载失败:', error.message);
    process.exit(1);
  }
})();
