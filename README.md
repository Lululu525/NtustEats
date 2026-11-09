# NTUST Eats 台科大學生餐廳線上點餐系統 — Midterm Project 2026

**Waterfall + AI ｜ Agile + AI ｜（加分）AI-Agent Method** — 範圍：至 Requirement Analysis 階段

校內五家餐廳（泰刻、豬豬の拉麵屋、蔡姐麻辣燙、DAKA COFFEE、稻穗輕食）的線上點餐：師生上課前先點、選 10 分鐘取餐時段、線上付款（LINE Pay／校園帳戶），下課出示 QR Code 取餐並自己按「完成訂單」；店家以平板接單；總務處可切換編輯模式管理店家與菜單。

> SRS v1.0 之後的 8 項需求變更見 [`docs/change-requests/`](docs/change-requests/)（CR-01～CR-08）；GitHub／Jira 操作步驟見 [`docs/GUIDE-github-jira.md`](docs/GUIDE-github-jira.md)。

## 需求原型（可操作）
直接用瀏覽器開啟 [`prototype/index.html`](prototype/index.html)。開啟 GitHub Pages 後網址為 `https://<owner>.github.io/<repo>/prototype/`，用手機開啟可「加入主畫面」安裝成 App（PWA）。
- 封面分流：校內學生／教職員（學號＋身分證字號，例 `B11201116 / B000000000`）、校外人士、店家（下拉選店，密碼 `0000`）；總務處 `T10234 / A000000009`
- 學生端：五家店菜單 → 組合麻辣燙、加購、DAKA 早上優惠 → 跨店購物車 → 選時段 → 線上付款 → 訂單 QR → 按「完成訂單」
- 店家端：訂單佇列（接單／可取餐／交付／未取餐，未取餐可更正）、一鍵售完、時段容量
- 右下角「Demo 時鐘」可調整時間，測試 10:00 前優惠與時段計算

## 文件導覽

| 方法 | 檔案 |
|---|---|
| 需求來源 | [`docs/interview-notes.md`](docs/interview-notes.md)、[`data/menu.json`](data/menu.json) |
| Waterfall + AI | [`docs/waterfall/SRS.md`](docs/waterfall/SRS.md)、[`review-log.md`](docs/waterfall/review-log.md)（審查歷程見 Pull Requests） |
| Agile + AI | [`docs/agile/product-backlog.md`](docs/agile/product-backlog.md)、[`INVEST-check.md`](docs/agile/INVEST-check.md)、[`daily-log.md`](docs/agile/daily-log.md)、GitHub Projects「NTUST Eats Board」 |
| AI-Agent（加分） | [`docs/agent-method/`](docs/agent-method/METHOD.md) |
| UML | [`docs/uml/`](docs/uml/png)（PlantUML 原始碼在 `src/`） |
| 需求變更 | [`docs/change-requests/`](docs/change-requests/)（CR-01～08，對應 US-17～24） |
| 操作手冊 | [`docs/GUIDE-github-jira.md`](docs/GUIDE-github-jira.md) |
| AI 紀錄 | [`docs/ai/ai-in-process.md`](docs/ai/ai-in-process.md)、[`ai-usage-log.md`](docs/ai/ai-usage-log.md) |

## 規則
- AI 可以起草，只有人可以接受。
- 所有變更經 Pull Request，由非作者組員 Approve 後合併。
- Commit 訊息以 `Refs #<issue>` 連結 User Story。
