# Transcripts

每次 Agent 執行存一個檔：`YYYY-MM-DD_<agent>_<n>.md`，內容包含：
1. 完整 prompt
2. Agent 完整輸出
3. Gate 決定（accept / reject + 理由 + 決定者姓名）

範例 prompt（Critic Agent）：
> 你是需求審查員。以下是訪談紀錄、菜單資料與 spec.md。請只輸出問題清單，每項標註類型（模糊／遺漏／無來源／與訪談或菜單衝突）與對應的 R 編號或 I 編號。不要修改 spec，不要提出新功能。
