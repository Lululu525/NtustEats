#!/usr/bin/env bash
# 一次建立 GitHub repo、推送所有分支、開啟審查用 PR、建立 User Story issues 與 Project 看板。
# 需求：已安裝 gh 並 `gh auth login`（需 project scope：gh auth refresh -s project）
# 用法：bash scripts/setup_github.sh <owner> <repo-name>
set -euo pipefail
OWNER=${1:?owner}; REPO=${2:-ntust-eats}
gh repo create "$OWNER/$REPO" --public --source=. --remote=origin --push
for b in review/01-clarify-ambiguous review/02-add-missing review/03-remove-ai-invented docs/agile-prototype-ai feature/add-daosui feature/login-identity feature/roles-admin-edit feature/pwa-app feature/brand-cover; do
  git push -u origin "$b"
done
# 審查用 PR（依序合併；每個 PR 需由「非作者」的組員 Approve 後再 Merge）
gh pr create -B main -H review/01-clarify-ambiguous -t "SRS review #1: 釐清模糊需求 (v0.2)" -F docs/waterfall/pr-bodies/01.md
gh pr create -B review/01-clarify-ambiguous -H review/02-add-missing -t "SRS review #2: 補上遺漏需求 (v0.3)" -F docs/waterfall/pr-bodies/02.md
gh pr create -B review/02-add-missing -H review/03-remove-ai-invented -t "SRS review #3: 移除 AI 自行加入的需求 (v0.4)" -F docs/waterfall/pr-bodies/03.md
gh pr create -B review/03-remove-ai-invented -H docs/agile-prototype-ai -t "Agile backlog + 需求原型 + AI 使用紀錄" -F docs/waterfall/pr-bodies/04.md
gh pr create -B docs/agile-prototype-ai -H feature/add-daosui -t "CR-01: 新增店家 稻穗輕食" -F docs/change-requests/CR-01-add-daosui.md
gh pr create -B feature/add-daosui -H feature/login-identity -t "CR-02: 登入畫面與身分辨識" -F docs/change-requests/CR-02-login-identity.md
gh pr create -B feature/login-identity -H feature/roles-admin-edit -t "CR-03: 身分分流、店家登入、管理者編輯模式" -F docs/change-requests/CR-03-roles-admin-edit.md
gh pr create -B feature/roles-admin-edit -H feature/pwa-app -t "CR-04: 可安裝 App（PWA）與全 App 化介面" -F docs/change-requests/CR-04-pwa-app.md
gh pr create -B feature/pwa-app -H feature/brand-cover -t "CR-05: 校徽色系、學生餐廳 icon、封面改版" -F docs/change-requests/CR-05-brand-cover.md
echo "提醒：PR #1 合併後，到 PR #2 頁面把 base 改成 main（GitHub 通常會自動改），依序處理。"
# Labels
for l in "ai-proposed:FBCA04" "po-accepted:0E8A16" "sprint-1:1D76DB" "sprint-2:5319E7"; do
  gh label create "${l%%:*}" --color "${l##*:}" -R "$OWNER/$REPO" --force
done
# Project 看板
PNUM=$(gh project create --owner "$OWNER" --title "NTUST Eats Board" --format json | python3 -c 'import sys,json;print(json.load(sys.stdin)["number"])')
gh project link "$PNUM" --owner "$OWNER" --repo "$OWNER/$REPO" || true
# Issues（AI proposed → PO 接受後改貼 po-accepted）
python3 - "$OWNER/$REPO" "$OWNER" "$PNUM" <<'PY'
import json,subprocess,sys
repo,owner,pnum=sys.argv[1:]
for s in json.load(open('docs/agile/stories.json')):
    lab='ai-proposed,'+('sprint-1' if s['sprint']=='Sprint 1' else 'sprint-2')
    body=s['body']+f"\n\n---\nEpic: {s['epic']}　Story Points: {s['points']}（AI 建議，待 Planning Poker 確認）\n\n- [ ] PO 接受（接受後移除 ai-proposed、加上 po-accepted）"
    url=subprocess.check_output(['gh','issue','create','-R',repo,'-t',f"{s['id']} {s['title']}",'-b',body,'-l',lab],text=True).strip()
    subprocess.run(['gh','project','item-add',pnum,'--owner',owner,'--url',url],check=True)
    print(url)
PY
echo "完成。到 Project 設定 Board 版面，欄位：AI Proposed / Backlog / To Do / In Progress / In Review / Done"
# （選用）開啟 GitHub Pages，PR 合併到 main 後原型網址為 https://<owner>.github.io/<repo>/prototype/
gh api -X POST "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 && echo "GitHub Pages 已開啟" || echo "GitHub Pages 請到 Settings → Pages 手動開啟"
