#!/usr/bin/env python3
import re, os, sys

def fix_paths(html_file, output_file):
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    css_count = js_count = img_count = 0
    
    # CSS
    def replace_css(m):
        nonlocal css_count
        css_count += 1
        return f'href="css/{os.path.basename(m.group(1).split("?")[0])}"'
    content = re.sub(r'href="(/[^"]*\.css[^"]*)"', replace_css, content)
    
    # JS
    def replace_js(m):
        nonlocal js_count
        js_count += 1
        return f'src="js/{os.path.basename(m.group(1).split("?")[0])}"'
    content = re.sub(r'src="(/[^"]*\.js[^"]*)"', replace_js, content)
    
    # Images
    def replace_img(m):
        nonlocal img_count
        img_count += 1
        fn = os.path.basename(m.group(1).split("?")[0])
        fn = re.sub(r'[^a-zA-Z0-9._-]', '_', fn)
        return f'{m.group(0).split("=")[0]}="images/{fn}"'
    content = re.sub(r'(src|srcset|data-src)="(/[^"]*\.(jpg|jpeg|png|gif|svg|webp)[^"]*)"', replace_img, content, flags=re.I)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"  ✅ CSS: {css_count}, JS: {js_count}, 图片: {img_count}")

if __name__ == "__main__":
    fix_paths(sys.argv[1], sys.argv[2]) if len(sys.argv) == 3 else print("用法: fix-paths.py <input> <output>")
