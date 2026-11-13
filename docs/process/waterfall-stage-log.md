# Waterfall 階段紀錄（依 Git 紀錄整理）

> 本表每一列都來自 repo 的真實紀錄（commit、Pull Request、Issue），時間為台灣時間，點連結可直接對照。
> 作者欄是 Git 上顯示的帳號；標註「AI 協作」者，commit 內含 AI 共同作者標記，內容已由組員確認後提交。
> 正式會議紀錄請見 [`docs/meetings/`](../meetings/)。

## 階段總覽

| 階段 | 產出文件 | 狀態 | 證據 |
|---|---|---|---|
| 1. 需求蒐集 | 訪談紀錄 I-01～I-21、紙本菜單數位化 | 完成 | [cc25768](https://github.com/Lululu525/NtustEats/commit/cc25768) |
| 2. SRS 初稿 | SRS v0.1（AI 起草，未審查） | 完成 | [cc25768](https://github.com/Lululu525/NtustEats/commit/cc25768) |
| 3. 審查 #1：模糊需求 | SRS v0.2（R-01～R-05） | 待組員 Approve／Merge | [PR #1](https://github.com/Lululu525/NtustEats/pull/1)、[W-01 #39](https://github.com/Lululu525/NtustEats/issues/39) |
| 4. 審查 #2：遺漏需求 | SRS v0.3（R-06～R-10） | 待組員 Approve／Merge | [PR #2](https://github.com/Lululu525/NtustEats/pull/2)、[W-02 #40](https://github.com/Lululu525/NtustEats/issues/40) |
| 5. 審查 #3：AI 自創需求 | SRS v1.0 候選版（R-11～R-14） | 待組員 Approve／Merge | [PR #3](https://github.com/Lululu525/NtustEats/pull/3)、[W-03 #41](https://github.com/Lululu525/NtustEats/issues/41) |
| 6. 簽核 | SRS v1.0 全體簽核 | 待簽核 | [W-04 #42](https://github.com/Lululu525/NtustEats/issues/42) |
| 7. 系統設計 | UML：用例、類別、循序、狀態、活動、元件 | 完成（待審） | [cc25768](https://github.com/Lululu525/NtustEats/commit/cc25768)、[W-05 #43](https://github.com/Lululu525/NtustEats/issues/43) |
| 8. 變更回寫 | SRS v1.1（依 CR-01～09 回寫） | 完成（待審） | [0701266](https://github.com/Lululu525/NtustEats/commit/0701266) |
| 9. 整合 | SRS v1.2（整合 SRS v0.1 格式與 R-01～R-27） | 完成（待審） | [6566acd](https://github.com/Lululu525/NtustEats/commit/6566acd)、[7ca2c9c](https://github.com/Lululu525/NtustEats/commit/7ca2c9c)、[W-06 #44](https://github.com/Lululu525/NtustEats/issues/44) |
| 10. 待確認事項 | SRS 7.1 Q-01～Q-12 回訪 | 進行中 | [W-07 #45](https://github.com/Lululu525/NtustEats/issues/45) |

## 逐筆紀錄

| 時間 | 作者 | 做了什麼 | 證據 |
|---|---|---|---|
| 11/10 00:34 | Lulu（AI 協作） | 提交 AI 起草的 SRS v0.1、訪談紀錄、菜單資料、UML 草稿，標記為「未審查」 | [cc25768](https://github.com/Lululu525/NtustEats/commit/cc25768) |
| 11/10 00:34 | Lulu（AI 協作） | 審查 #1：把「適當」「盡快」等量不出來的字改成具體數值 → v0.2 | [099b635](https://github.com/Lululu525/NtustEats/commit/099b635) |
| 11/10 00:34 | Lulu（AI 協作） | 審查 #2：補上麻辣燙「任選 4 樣」、搶名額等遺漏需求 → v0.3 | [84488f6](https://github.com/Lululu525/NtustEats/commit/84488f6) |
| 11/10 00:34 | Lulu（AI 協作） | 審查 #3：刪除訪談沒有的線上付款、外送、AI 推薦 → v1.0 候選版 | [9dddfea](https://github.com/Lululu525/NtustEats/commit/9dddfea) |
| 11/10 14:52 | Lululu525 | 開 PR #1～#3，三輪審查各一個 PR，等待非作者組員審查 | [PR #1](https://github.com/Lululu525/NtustEats/pull/1)、[PR #2](https://github.com/Lululu525/NtustEats/pull/2)、[PR #3](https://github.com/Lululu525/NtustEats/pull/3) |
| 11/10 18:29 | Lulu（AI 協作） | SRS v1.1：把 Agile 那邊的 CR-01～09 回寫進 SRS（兩個餐廳、17 家店） | [0701266](https://github.com/Lululu525/NtustEats/commit/0701266) |
| 11/10 18:53 | Lulu（AI 協作） | SRS v1.2：整合 SRS v0.1 的章節格式與 R-01～R-27 補充需求 | [6566acd](https://github.com/Lululu525/NtustEats/commit/6566acd) |
| 11/10 18:56 | Lulu（AI 協作） | SRS v1.2 加入 UML 與原型截圖；新增 Class Diagram v1.2 | [7ca2c9c](https://github.com/Lululu525/NtustEats/commit/7ca2c9c) |
| 11/10 21:13 | Lulu（AI 協作） | 依需求方確認：豬豬拉麵屋改屬第一餐廳，SRS 與圖同步修正 | [3777a73](https://github.com/Lululu525/NtustEats/commit/3777a73) |
| 11/11 01:08 | Lululu525 | 在 GitHub Projects 開 Waterfall 看板，建立 W-01～W-07 工作項目 | [#39～#45](https://github.com/Lululu525/NtustEats/issues?q=label%3Awaterfall) |

## 還沒完成的（報告前要做）

- [ ] 非作者組員審查並 Merge PR #1 → #2 → #3（Waterfall 要求「至少三次審查過的修改」）
- [ ] SRS v1.0 簽核表填上簽核人與日期（W-04）
- [ ] 會議紀錄：見 [`docs/meetings/`](../meetings/)
