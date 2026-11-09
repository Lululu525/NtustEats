# Feature 001 — tasks.md（Plan Agent 產出，待 G3）

| Task | 來源 | 依賴 |
|---|---|---|
| T1 建立 Store / PickupSlot / Order / OrderLine 資料表 | R1–R4 | — |
| T2 GET /slots 計算可選時段 | R2, R3 | T1 |
| T3 POST /checkout 拆單與交易鎖定 | R1, R3 | T1 |
| T4 產生 4 碼號碼與 128-bit QR token | R4 | T3 |
| T5 依身分計價 | R5 | T3 |
| T6 並行搶名額測試 | R3 | T3 |
