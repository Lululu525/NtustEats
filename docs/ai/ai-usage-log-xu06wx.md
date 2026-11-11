\# AI Usage Log — xu06.wx（Agile 組）



| 項目 | 內容 |

|---|---|

| 工具／模型 | Claude（Anthropic，claude.ai）；模型 Claude Sonnet 5.5 |

| 機密資料 | 未輸入真實個資、學號或密碼 |



\## 我問了 AI 什麼



| # | 提問（摘要） | 產出 | 接受／拒絕 | 原因 |

|---|---|---|---|---|

| 1 | 依作業要求檢查 SRS、簡報與 repo 是否符合 | 缺漏清單與優先順序 | 部分接受 | 數字不一致等項目，我再回到原檔核對 |

| 2 | 我是 Agile 組員，現在可以做什麼 | 建議先做 US-16 補驗收條件 | 接受 | INVEST-check.md 確實標示 US-16 無 AC |

| 3 | 起草 US-16 的驗收條件 | AC1～AC4 | AC1～AC3 接受，AC4 保留但標「待 PO 確認」 | AC1～AC3 對照 SRS FR-22、FR-23 相符；AC4 是 SRS 沒寫的 AI 建議，需 PO 決定 |

| 4 | 帶我做 git 流程（clone、branch、commit、PR） | 指令與 PR 說明範本 | 接受，PR 關鍵字經更正 | AI 先建議用 Closes，後來更正為 Refs（PR 目標不是 main，不會自動關閉 Issue） |



\## AI 錯誤的案例



AI 在第一份檢查報告寫「Agile 缺少 UML，只有一張狀態圖」。後來讀 repo 才發現 docs/uml 已有 Agile 的 Story Map（07）與 Sprint 1 類別圖（08），只是簡報沒有放。

→ 教訓：AI 只看了簡報，沒看到 repo，結論下得太早。需要核對來源檔案後再採信。



\## 節省／損失的時間（估計，請依實際調整）



| 項目 | 估計 |

|---|---|

| 節省 | 對照作業與檢查 repo 現況、指引 git 流程：約2小時 |

| 損失 | 核對與更正 AI 的說法（UML、Closes 與 Refs）：約0.5小時 |

| 淨效果 | 節省1.5小時 |

