# Feature 001: 跨店結帳與取餐時段 — spec.md

> Spec Agent 產出，Gate G2 前每條需求必須有來源標記。

## User Scenarios
1. 學生購物車有蔡姐麻辣燙一碗與 DAKA 珍珠奶茶，結帳時兩家店各選 12:10 時段 [I-02][I-03]
2. 12:10 麻辣燙時段只剩 1 個名額，兩位學生同時送出，只有一人成功 [I-09]
3. 學生取得兩筆訂單號碼，到店出示 QR Code 並現場付款 [I-11][I-12]

## Requirements
- R1 購物車可含多家店，送出時依店家拆單 [I-03]
- R2 取餐時段 10 分鐘一格，最早 = 現在＋備餐時間 [I-02][menu: 營業時間]
- R3 每店每時段不超過容量（預設 15） [I-09]
- R4 每筆訂單產生 4 碼號碼與 QR Code [I-12]
- R5 金額依身分計校內價或校外價，現場付款 [I-11][I-16]

## Review & Acceptance Checklist
- [ ] 無 [NEEDS CLARIFICATION] 標記
- [ ] 每條 R 皆有來源
- [ ] G2 簽核：【Spec Reviewer 姓名／日期】
