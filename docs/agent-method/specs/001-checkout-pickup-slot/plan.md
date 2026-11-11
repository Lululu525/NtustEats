# Feature 001 — plan.md（Plan Agent 產出，待 G3）

- 前端：PWA `/cart`、`/checkout`（每店一個時段選擇器）、`/orders/:no`
- 後端：`GET /slots?stores=` 回傳各店可選時段；`POST /checkout` 對每家店以 `SELECT ... FOR UPDATE` 鎖定 PickupSlot，名額足夠才建立訂單 (R3)
- 資料：Store、PickupSlot、Order、OrderLine（見 docs/uml/png/02_class.png）
- 測試策略：並行測試（50 個請求搶 1 個名額，期望 1 成功 49 失敗）；時間邊界（備餐時間剛好落在格線上）
