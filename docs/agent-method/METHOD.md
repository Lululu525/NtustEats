# （加分）AI-Agent Method：PO-Directed Spec Loop

以 GitHub Spec Kit（Specify → Plan → Tasks）為基礎，改成「一位人類 PO 指揮三個 Agent」，只做到 Requirement Analysis。同一題目、同一份訪談與菜單。

## 角色

| 角色 | 人／Agent | 職責 | 不可以做 |
|---|---|---|---|
| Product Owner | 人（1 位） | 下指令、在每個 Gate 決定通過或退回 | — |
| Spec Reviewer | 人（1 位） | 逐條追溯需求來源，簽 Gate G2 | — |
| Spec Agent | AI | 由訪談與菜單產生 `spec.md` | 不可新增無來源的需求 |
| Critic Agent | AI（另開對話，看不到 Spec Agent 的推理） | 找模糊、遺漏、無來源、與菜單不一致的項目 | 不可直接修改 spec |
| Plan Agent | AI | 由核准的 spec 產生 `plan.md`、`tasks.md` | 不可 commit / push |

## 循環（一個 Bolt ≈ 1 天）

```
訪談＋菜單 ──► [Spec Agent] spec.md ──► [Critic Agent] critique ──► G1 PO 決定採納哪些 critique
          ──► [Spec Agent] 修正 ──► G2 Spec Reviewer 逐條追溯簽核
          ──► [Plan Agent] plan.md + tasks.md ──► G3 PO 核准 → 人工 commit + PR
```

## Human Gates

| Gate | 誰 | 通過條件 |
|---|---|---|
| G1 | PO | 每條 critique 標記 accept / reject 與理由 |
| G2 | Spec Reviewer | spec 每條需求都有 `[I-xx]` 或 `[menu]` 來源標記 |
| G3 | PO | tasks 皆可追溯到 spec；由人執行 git commit 並開 PR |

## 規則
- 人負責；Agent 不得 commit 或 push。
- Prompt 中不放真實個資或機密。
- 所有 prompt、Agent 輸出、Gate 決定存在 `transcripts/` 並納入版本控制。
