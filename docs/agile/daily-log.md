# Daily Records（每日／每 2–3 天一次）

> 每次紀錄後 commit，並在 commit message 或 PR 裡寫 `Refs #<issue>`，讓 GitHub Projects 卡片與版本控制連結。
> AI 可以把 Board 的變動摘要成下列格式，但 **由 Scrum Master 確認後才 commit**。

## 範本

```
### YYYY-MM-DD（Sprint 1, Day N）— 紀錄人：
| 成員 | 昨天完成 | 今天要做 | 阻礙 |
|---|---|---|---|
|  |  |  |  |
Board：To Do x / In Progress y / In Review z / Done w（剩餘 ___ pts）
連結：#issue、PR #
AI 摘要是否修改：是／否（改了什麼）
```

---

<!-- 從下面開始，每次站立會議新增一筆，最新的放最上面 -->


### 2026-11-11（Sprint 2，US-16）— 紀錄人：xu06.wx
| 成員 | 昨天完成 | 今天要做 | 阻礙 |
|---|---|---|---|
| xu06.wx | 無（今天開始參與） | 已完成：clone repo、閱讀 docs/agile、發現 US-16 缺驗收條件並補上 AC1～AC4（commit 7cd4c83）、開 PR #46。<br>待辦：等非作者組員 Approve 與 PO 決定 AC4；整理 US-02 與 SRS FR-02 的衝突提給 PO | push 曾回 403（權限不足），已解決；PR #46 等待審查 |
Board：Todo 24 / In Progress 1 / In Review 0 / Done 0（剩餘 pts：待 Scrum Master 計算）
連結：#28、PR #46、commit 7cd4c83
AI 摘要是否修改：AI（Claude）依我提供的事實起草，xu06.wx 核對後提交