"""把 data/menu.json 與 QR 函式庫嵌入 prototype/src/app.html，輸出單一檔案 prototype/index.html。
用法：python3 scripts/build_prototype.py"""
import json, pathlib
root = pathlib.Path(__file__).resolve().parent.parent
src = (root / 'prototype/src/app.html').read_text(encoding='utf-8')
menu = json.loads((root / 'data/menu.json').read_text(encoding='utf-8'))
qr = (root / 'prototype/src/qrcode.js').read_text(encoding='utf-8').split('(function (factory) {')[0]  # qrcode-generator (MIT, Kazuhiko Arase)
out = src.replace('/*__MENU__*/', json.dumps(menu, ensure_ascii=False, separators=(',', ':'))).replace('/*__QR__*/', qr)
import base64
def data_url(rel):
    return 'data:image/png;base64,' + base64.b64encode((root / rel).read_bytes()).decode()
out = out.replace('__LOGO_DATA__', data_url('prototype/assets/logo.png')).replace('__EMBLEM_WHITE_DATA__', data_url('prototype/assets/emblem-white-96.png'))
(root / 'prototype/index.html').write_text(out, encoding='utf-8')
print('prototype/index.html', len(out), 'bytes')
