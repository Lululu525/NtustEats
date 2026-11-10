# 系統設計與專案管理步驟（GitHub／Jira 操作手冊）

> 本文件說明 NTUST Eats 從「需求 → 設計 → 原型 → 需求變更」每一步怎麼做，以及在 GitHub 或 Jira 上要留下哪些紀錄給老師檢查。
> 兩種工具擇一即可：**GitHub（建議，一個 repo 就能放文件、PR 審查、看板、Demo）** 或 **Jira（看板＋Sprint）＋ GitHub（文件與程式）**。

---

## 0. 事前準備（每位組員）

| 步驟 | 做法 |
|---|---|
| 0-1 | 每人申請 GitHub 帳號，組長建立 repo 後到 **Settings → Collaborators** 邀請組員 |
| 0-2 | 安裝 Git 與 GitHub CLI（`gh`），執行 `gh auth login`；要建立看板需再執行 `gh auth refresh -s project` |
| 0-3 | 設定提交者：`git config --global user.name "姓名"`、`git config --global user.email "信箱"` |
| 0-4 | 解壓縮 `ntust-eats-repo/`，在資料夾內執行 `git log --oneline --all` 確認分支與歷史都在 |

---

## 1. Waterfall + AI：需求文件（SRS）

| 步驟 | 做什麼 | 在 GitHub 留下的證據 |
|---|---|---|
| 1-1 訪談 | 訪談學生、店家、總務處，整理成 `docs/interview-notes.md`（I-01…I-21） | commit |
| 1-2 AI 初稿 | 把訪談筆記交給 AI 產生 SRS v0.1（`docs/waterfall/SRS.md`），**直接 commit 到 main，不修改**，保留 AI 原貌 | commit「AI v0.1」 |
| 1-3 審查 #1 | 開分支 `review/01-clarify-ambiguous`，把模糊字眼改成可測量（例「很快」→「≤10 秒」） | PR #1，至少 1 位**非作者**組員 Approve 後 Merge |
| 1-4 審查 #2 | 分支 `review/02-add-missing`，補上訪談有提到但 AI 漏掉的需求 | PR #2 |
| 1-5 審查 #3 | 分支 `review/03-remove-ai-invented`，刪除 AI 自己編出來、訪談沒有的需求 | PR #3 |
| 1-6 紀錄 | 每個問題寫入 `docs/waterfall/review-log.md`（R-01…R-14：模糊／遺漏／AI 自創） | 同上 PR |
| 1-7 UML | 用 PlantUML 畫 Use Case、Class、Sequence、State、Activity、Component（`docs/uml/src/*.puml` → png） | commit |

**PR 審查的操作：** 開 PR → 右側 Reviewers 指定組員 → 組員到 **Files changed** 逐行留言 → **Review changes → Approve** → 作者按 **Merge pull request**。老師要求「至少 3 次審查變更」＝ PR #1～#3。

---

## 2. Agile + AI：User Story 與看板

### 2-A 用 GitHub Projects

| 步驟 | 做法 |
|---|---|
| 2-1 | 執行 `bash scripts/setup_github.sh <你的帳號> ntust-eats`，會自動：建立 repo、推送所有分支、開 PR、建 labels、建 Project 看板、把 24 個 User Story 建成 Issue 並放進看板 |
| 2-2 | 打開 **Projects → NTUST Eats Board**，切換成 **Board** 檢視，欄位設為 `Todo / In Progress / In Review / Done` |
| 2-3 | 新增欄位：**Iteration**（Sprint 1、2、3，各 2 週）、**Number** 欄位「Story Points」 |
| 2-4 | **PO 接受**：PO 逐一打開 Issue，看 AC 是否正確，勾選「PO 接受」，把 label `ai-proposed` 換成 `po-accepted`（被拒絕的 Issue 直接 Close 並留言原因） |
| 2-5 | Sprint Planning：把 Sprint 的 Issue 拖到 Todo，Planning Poker 後把點數填進 Story Points |
| 2-6 | 開發時：每個 Story 開一個分支，commit message 寫 `Refs #<issue編號>`，PR 描述寫 `Closes #<issue編號>`，合併後卡片自動移到 Done |
| 2-7 | Daily：每次站立會議在 `docs/agile/daily-log.md` 新增一筆（範本已在檔案中），commit 時寫 `Refs #issue`，這就是「Daily 紀錄連到版本控制」的證據 |
| 2-8 | Sprint Review：用原型 Demo 給需求方看 → 收到的意見寫成 CR（見第 4 節）→ 轉成新的 Story |

### 2-B 用 Jira（若老師或組員偏好 Jira）

| 步驟 | 做法 |
|---|---|
| 2-1 | 到 atlassian.com 建立免費 Jira Software，專案範本選 **Scrum** |
| 2-2 | **Project settings → Issue types** 確認有 Epic、Story；建立 Epic E1～E5（登入、菜單、下單付款、店家、管理） |
| 2-3 | 匯入 Story：右上角 **⚙ → System → External System Import → CSV**，選 `docs/agile/jira-import.csv`（UTF-8），欄位對應：Summary→Summary、Description→Description、Story Points→Story point estimate、Sprint→Sprint、Labels→Labels |
| 2-4 | 在 **Backlog** 頁建立 Sprint 1、2、3，把 Story 拖進去，按 **Start sprint** |
| 2-5 | PO 接受：在每個 Story 留言「PO accepted」並把 label `ai-proposed` 改成 `po-accepted` |
| 2-6 | 連結 Git：**Apps → GitHub for Jira** 安裝並連結 repo；之後 commit message / 分支名稱寫 Jira Key（例 `NE-24`），Story 頁面就會出現 commit 與 PR |
| 2-7 | 截圖：Backlog、Board、Sprint Report、Burndown 各一張放進報告 |

---

## 3. 原型（需求驗證用）

| 步驟 | 做法 |
|---|---|
| 3-1 | 原始碼在 `prototype/src/app.html`，菜單資料在 `data/menu.json` |
| 3-2 | 建置：`python3 scripts/build_prototype.py` → 產生單一檔案 `prototype/index.html` |
| 3-3 | 發佈 Demo：repo **Settings → Pages → Source: Deploy from a branch → gh-pages / (root)**（腳本已自動設定；原型更新後重新建置並推到 gh-pages），網址 `https://<帳號>.github.io/ntust-eats/` |
| 3-4 | 手機打開網址 → 分享 → 「加入主畫面」即可當 App 使用（PWA） |

**Demo 測試帳號：** 學生 `B11201116 / B000000000`、`M11407021 / F000000004`；總務處 `T10234 / A000000009`；店家任選、密碼 `0000`。

---

## 4. 需求變更流程（CR-01～CR-08）

每次需求方看完 Demo 提出修改，都照同一流程：

1. 寫 `docs/change-requests/CR-xx-*.md`：背景、變更內容、**建議修改的需求編號**、**待決定事項**（與原需求衝突的地方標 ⚠）
2. 在看板建立對應 Story（US-17～US-24，label `change-request`）
3. 開分支 `feature/<名稱>` 實作 → 測試 → PR，描述貼 CR 內容
4. 組員審查並決定「待決定事項」→ 把結論寫回 SRS 的變更紀錄

| CR | 分支 | Story | 內容 |
|---|---|---|---|
| CR-01 | feature/add-daosui | US-17 | 新增店家 稻穗輕食 |
| CR-02 | feature/login-identity | US-18 | 學號＋身分證字號登入、帶出姓名系級 |
| CR-03 | feature/roles-admin-edit | US-19 | 封面身分分流、店家登入、管理者編輯模式 |
| CR-04 | feature/pwa-app | US-20 | 可安裝 App（PWA） |
| CR-05 | feature/brand-cover | US-21 | 校徽色系、icon、封面 |
| CR-06 | feature/online-payment | US-22 | 只能線上付款（LINE Pay／校園帳戶）、餘額顯示、校外人士付款時填電話 |
| CR-07 | feature/student-complete | US-23 | 學生按完成訂單、未完成不能點下一餐 |
| CR-08 | feature/noshow-correction | US-24 | 店家可更正「未取餐」 |
| CR-09 | feature/first-restaurant | US-25 | 登入後選餐廳；新增兩個餐廳 12 家店 |

**PR 合併順序：** PR 是「疊起來」的（每個分支建立在前一個上），請**由上往下依序合併**；合併一個後，下一個 PR 的 base 會自動改成 main。

---

## 5. AI-Agent 方法（選做）

`docs/agent-method/`：用 Spec → Plan → Tasks 三個檔案驅動 AI Agent（以「結帳選取餐時段」為例），`transcripts/` 放對話紀錄。

---

## 6. 繳交前檢查清單

- [ ] repo 已推到 GitHub，所有 PR 都有**組員本人**的 Approve（不能由 AI 或作者自己核准）
- [ ] 看板上 Story 都有 PO 接受紀錄，Sprint 1～3 有分配
- [ ] `daily-log.md` 至少每 2～3 天一筆，並連到 issue
- [ ] 報告、PPT、AI Usage Log 中所有 **【填入】** 都已換成真實資料（姓名、時間、決定）
- [ ] 報告封面與 PPT 填上 GitHub repo 連結與 Demo 網址
- [ ] 壓縮成 `組名_Midterm.zip`
