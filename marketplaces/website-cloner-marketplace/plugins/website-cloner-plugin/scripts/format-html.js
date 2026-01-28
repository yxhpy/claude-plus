#!/usr/bin/env node
/**
 * HTML Formatter
 * 格式化压缩的 HTML，使其 IDE 友好
 *
 * Usage: node format-html.js <input-file> <output-file>
 */

const fs = require('fs');

function formatHTML(inputPath, outputPath) {
  console.log(`📖 读取文件: ${inputPath}`);
  const html = fs.readFileSync(inputPath, 'utf8');

  const originalSize = (html.length / 1024 / 1024).toFixed(2);
  console.log(`📏 原始大小: ${originalSize} MB`);

  // 在标签间添加换行
  console.log('🔄 格式化中...');
  let formatted = html
    .replace(/></g, '>\n<')
    .replace(/\n\s*\n/g, '\n');

  const formattedSize = (formatted.length / 1024 / 1024).toFixed(2);
  const lineCount = formatted.split('\n').length;

  console.log(`📏 格式化后: ${formattedSize} MB`);
  console.log(`📝 行数: ${lineCount.toLocaleString()}`);

  fs.writeFileSync(outputPath, formatted);
  console.log(`✅ 已保存: ${outputPath}`);

  return {
    originalSize,
    formattedSize,
    lineCount
  };
}

// 主函数
const args = process.argv.slice(2);

if (args.length < 2) {
  console.error('❌ 用法: node format-html.js <input-file> <output-file>');
  process.exit(1);
}

const [inputPath, outputPath] = args;

try {
  const result = formatHTML(inputPath, outputPath);
  console.log('\n✨ 格式化完成！');
} catch (error) {
  console.error('❌ 格式化失败:', error.message);
  process.exit(1);
}
