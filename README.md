# NTUST Eats 台科大學餐線上點餐系統 — Midterm Project 2026

**Waterfall + AI ｜ Agile + AI ｜（加分）AI-Agent Method** — 範圍：至 Requirement Analysis 階段

校內餐廳（泰刻、豬豬の拉麵屋、蔡姐麻辣燙、DAKA COFFEE；稻穗輕食見 CR-01）的線上點餐：師生上課前先點、選 10 分鐘取餐時段、下課出示 QR Code 現場付款取餐；店家以平板接單；總務處看尖峰報表。

## 需求原型（可操作）
直接用瀏覽器開啟 [`prototype/index.html`](prototype/index.html)（不需安裝）。開啟 GitHub Pages 後網址為 `https://<owner>.github.io/<repo>/prototype/`。
- 學生端：選身分（校內價／校外價）→ 四家店菜單 → 組合麻辣燙、加購、DAKA 早上優惠 → 跨店購物車 → 選時段 → 訂單號碼與 QR
- 店家端：訂單佇列（接單／完成／已取餐／拒絕）、一鍵售完、時段容量
- 右下角「Demo 時鐘」可調整時間，測試 10:00 前優惠與時段計算

## 文件導覽

| 方法 | 檔案 |
|---|---|
| 需求來源 | [`docs/interview-notes.md`](docs/interview-notes.md)、[`data/menu.json`](data/menu.json) |
| Waterfall + AI | [`docs/waterfall/SRS.md`](docs/waterfall/SRS.md)、[`review-log.md`](docs/waterfall/review-log.md)（審查歷程見 Pull Requests） |
| Agile + AI | [`docs/agile/product-backlog.md`](docs/agile/product-backlog.md)、[`INVEST-check.md`](docs/agile/INVEST-check.md)、[`daily-log.md`](docs/agile/daily-log.md)、GitHub Projects「NTUST Eats Board」 |
| AI-Agent（加分） | [`docs/agent-method/`](docs/agent-method/METHOD.md) |
| UML | [`docs/uml/`](docs/uml/png)（PlantUML 原始碼在 `src/`） |
| AI 紀錄 | [`docs/ai/ai-in-process.md`](docs/ai/ai-in-process.md)、[`ai-usage-log.md`](docs/ai/ai-usage-log.md) |

## 規則
- AI 可以起草，只有人可以接受。
- 所有變更經 Pull Request，由非作者組員 Approve 後合併。
- Commit 訊息以 `Refs #<issue>` 連結 User Story。
