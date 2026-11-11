# NTUST Eats 台科大學餐線上點餐系統 — 軟體需求規格書 (SRS)

| 項目 | 內容 |
|---|---|
| 文件版本 | v0.1 |
| 依循標準 | ISO/IEC/IEEE 29148:2018（精簡版） |
| 開發方法 | Waterfall + AI（本文件涵蓋至 Requirement Analysis 階段） |
| 需求來源 | `docs/interview-notes.md`（I-01 ～ I-21）、`data/menu.json`（四家店菜單） |
| 狀態 | 草稿 (AI draft) |

---

## 1. 緒論 (Introduction)

### 1.1 目的
本文件定義 NTUST Eats 的功能與非功能需求，作為後續設計、實作與測試的依據，並作為瀑布式流程中「需求分析」階段的簽核文件。

### 1.2 範圍
NTUST Eats 是一個行動優先 (mobile-first) 的 Progressive Web App，涵蓋校內四家餐廳：泰刻 Thai Express、豬豬の拉麵屋、蔡姐麻辣燙、DAKA COFFEE。師生可在手機上瀏覽各店菜單、跨店下單、以 LINE Pay／街口支付線上付款，並選擇到店取餐或外送至宿舍與實驗室；店家以平板接單、更新製作狀態與售完品項；總務處可查看訂單量與尖峰報表。

### 1.3 名詞定義
| 名詞 | 定義 |
|---|---|
| 校內價 / 校外價 | 菜單上的「校內優惠價」與「校外販售價」 |
| 取餐時段 (Pickup Slot) | 以 10 分鐘為單位的取餐時間區間，例如 12:10–12:20 |
| 時段容量 (Slot Capacity) | 某店在單一取餐時段最多可接的訂單數 |
| 購物車 (Cart) | 學生尚未送出的品項集合，可包含多家店 |
| 訂單 (Order) | 送出後依店家拆分的單筆訂單，每筆屬於一家店 |
| 組合麻辣燙 (DIY Bowl) | 學生自選湯底與食材組成的一碗麻辣燙 |
| 加購 (Add-on) | 必須附屬於某主品項才能購買的品項，例如小碗酸辣湯 |
| 放鳥 (No-show) | 訂單已完成製作，但學生在時段結束 30 分鐘內未取餐 |

### 1.4 參考文件
- `docs/interview-notes.md`、`data/menu.json`
- ISO/IEC/IEEE 29148:2018；《個人資料保護法》；WCAG 2.1；OWASP ASVS 4.0 Level 1

---

## 2. 整體描述 (Overall Description)

### 2.1 產品觀點
NTUST Eats 為獨立系統，與三個外部系統介接：校園 SSO（身分驗證，決定校內價資格）、Web Push 服務（通知）與第三方支付（LINE Pay、街口支付）。系統脈絡見 `docs/uml/png/06_component.png`。

### 2.2 產品功能摘要
1. 帳號與價格身分：校內師生以 SSO 登入享校內價；校外訪客以手機號碼註冊，以校外價計。
2. 菜單瀏覽：四家店菜單、價格、標籤、售完狀態。
3. 點餐：加購、組合麻辣燙、跨店購物車、選擇取餐時段。
4. 訂單追蹤：訂單號碼與 QR Code、狀態通知、取消。
5. 店家接單：訂單佇列、狀態更新、售完設定、菜單維護。
6. 管理與報表。
7. 線上付款：LINE Pay、街口支付。
8. 外送：宿舍與實驗室外送。
9. AI 推薦：依點餐紀錄推薦餐點。

### 2.3 使用者類別
| 使用者 | 說明 | 使用頻率 | 技術程度 |
|---|---|---|---|
| 校內師生 Member | 學生、教職員（含國際生） | 每日 | 高 |
| 校外訪客 Visitor | 訪客、廠商 | 偶爾 | 中 |
| 店家人員 VendorStaff | 四家店的店長、店員 | 每營業日 | 中低（需極簡操作） |
| 管理者 Admin | 總務處餐廳督導 | 每週 | 中 |

### 2.4 操作環境
- 用戶端：iOS 16+ Safari、Android 12+ Chrome；店家端為 10 吋以上平板瀏覽器。
- 伺服器：雲端容器環境，關聯式資料庫 (PostgreSQL)。

### 2.5 限制條件 (Constraints)
- C-1 個資只蒐集學號／手機、姓名、Email（I-19）。
- C-2 寄杯卡等預付商品不上架（I-21）。

### 2.6 假設與 Future Scope
- A-1 校園 SSO 提供 OpenID Connect 介面，可回傳身分別（學生／教職員）。
- A-2 每家店櫃台有一台可連網平板。

---

## 3. 外部介面需求

| ID | 介面 | 說明 |
|---|---|---|
| EI-1 | 校園 SSO | OpenID Connect，取得學號、姓名、Email、身分別 |
| EI-2 | Web Push | 推播訂單狀態 |
| EI-3 | 相機 | 店家端以瀏覽器相機掃描訂單 QR Code |
| EI-4 | 第三方支付 | LINE Pay、街口支付 API |

---

## 4. 功能需求 (Functional Requirements)

優先序採 MoSCoW：M = Must、S = Should、C = Could。

### 4.1 帳號與價格身分
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-01 | 系統應允許校內師生以校園 SSO 登入，登入後所有品項以「校內價」顯示與計價。 | I-07, I-16 | M |
| FR-02 | 系統應允許校外訪客以手機號碼與簡訊驗證碼註冊，所有品項以「校外價」顯示與計價。 | I-16 | M |
| FR-03 | 管理者應能建立店家與店家人員帳號，並設定各店營業時段。 | I-15 | M |

### 4.2 菜單
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-04 | 學生應能瀏覽四家店的菜單分類與品項，每個品項顯示中文名、英文名、適用價格與標籤（VEGAN、辣度、校園限定）。 | I-03, I-07, I-08 | M |
| FR-05 | 店家應能新增、修改、下架自家品項與價格，修改後 1 分鐘內在學生端生效。 | I-15 | M |
| FR-06 | 店家應能將品項設為「售完」，學生端應盡快更新。 | I-10 | M |

### 4.3 點餐
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-11 | 購物車可同時包含多家店的品項；送出時系統應依店家拆成多筆訂單，每筆各有訂單號碼。 | I-03 | M |
| FR-12 | 學生應能為每筆訂單選擇合理的取餐時間。 | I-02 | M |
| FR-13 | 尖峰時段應適當限制每家店的訂單量。 | I-09 | M |
| FR-14 | 訂單送出後應顯示訂單號碼、QR Code、取餐店家、時段與應付金額，並提示「現場付款（現金／悠遊卡）」。 | I-11, I-12 | M |

### 4.4 訂單處理與取餐
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-15 | 店家應能看到依取餐時段排序的訂單佇列，並將訂單狀態依序更新為：已接單 → 可取餐 → 已取餐。 | I-09, I-12 | M |
| FR-16 | 店家可拒絕訂單並選擇原因（售完、忙不過來、其他）；系統應通知學生。 | I-10 | S |
| FR-17 | 訂單狀態變為「可取餐」時，系統應即時通知學生。 | I-05 | S |
| FR-18 | 店家應能以掃描 QR Code 或輸入 4 碼訂單號碼完成取餐核對。 | I-12 | M |

### 4.5 管理與報表
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-22 | 管理者應能依店家、日期、每 10 分鐘時段檢視訂單數、取消數、放鳥數。 | I-18 | M |
| FR-23 | 管理者應能將報表匯出為 CSV。 | I-18 | M |

### 4.6 付款、外送與推薦
| ID | 需求 | 來源 | 優先 |
|---|---|---|---|
| FR-24 | 學生應能以 LINE Pay 或街口支付於送出訂單時線上付款，付款失敗訂單不成立。 | — | M |
| FR-25 | 學生可選擇外送至宿舍或實驗室，系統依距離加收外送費。 | — | S |
| FR-26 | 系統應依學生點餐紀錄，以 AI 推薦餐點。 | — | C |

---

## 5. 非功能需求 (Non-Functional Requirements)

| ID | 類別 | 需求（可量測） | 來源 |
|---|---|---|---|
| NFR-01 | 效能 | 系統應快速回應。 | I-20 |
| NFR-03 | 可用性 | 系統應穩定可靠。 | I-20 |
| NFR-04 | 易用性 | 系統應容易使用，點餐流程簡單。 | I-01, I-02 |
| NFR-05 | 易用性 | 介面提供繁體中文與英文；色彩對比符合 WCAG 2.1 AA。 | I-07 |
| NFR-06 | 安全 | 全站 HTTPS；訂單 QR Code 內容為不可預測的隨機值 (≥ 128 bits)；通過 OWASP ASVS Level 1。 | I-12 |
| NFR-08 | 可維護性 | 時段容量與備餐時間可設定，不需改程式。 | I-15 |

---

## 6. 業務規則 (Business Rules) 與追溯矩陣

### 6.1 業務規則
| ID | 規則 | 相關 FR |
|---|---|---|
| BR-01 | 價格依身分：校內師生＝校內價；校外訪客＝校外價 | FR-01, FR-02 |
| BR-02 | 取餐時段與容量依店家需求設定 | FR-12, FR-13 |

### 6.2 需求追溯矩陣 (Requirements Traceability Matrix)
| 需求 | 訪談來源 | Use Case | User Story (Agile) | UML 元素 | 驗證方式 |
|---|---|---|---|---|---|
| FR-01 | I-07, I-16 | UC-01 登入 | US-01 | Class: Member / PriceType | 整合測試 |
| FR-02 | I-16 | UC-01 | US-02 | Class: Visitor | 功能測試 |
| FR-03 | I-15 | UC-10 管理店家 | US-16 | Class: Store | 功能測試 |
| FR-04 | I-03, I-07, I-08 | UC-02 瀏覽菜單 | US-03 | Class: MenuItem | 功能測試 |
| FR-05 | I-15 | UC-07 維護菜單 | US-15 | Class: MenuItem | 功能測試 |
| FR-06 | I-10 | UC-07 | US-10 | MenuItem.soldOut | 計時測試 |
| FR-11 | I-03 | UC-04 | US-06 | Seq: checkout (split) | 功能測試 |
| FR-12 | I-02 | UC-04 | US-07 | Class: PickupSlot | 邊界值測試 |
| FR-13 | I-09 | UC-04 | US-07 | Seq: checkout (lock) | 並行測試 |
| FR-14 | I-11, I-12 | UC-05 查看訂單 | US-08 | Class: Order | 功能測試 |
| FR-15 | I-09, I-12 | UC-08 處理訂單 | US-09 | State: Order | 功能測試 |
| FR-16 | I-10 | UC-08 | US-09 | State: REJECTED | 功能測試 |
| FR-17 | I-05 | UC-08 | US-12 | Class: Notification | 計時測試 |
| FR-18 | I-12 | UC-06 取餐 | US-09 | Seq: pickup | 功能測試 |
| FR-22 | I-18 | UC-11 報表 | US-16 | Class: Report | 功能測試 |
| FR-23 | I-18 | UC-11 | US-16 | — | 功能測試 |
| FR-24 | — | UC-13 付款 | — | Class: Payment | 整合測試 |
| FR-25 | — | UC-14 外送 | — | Class: Delivery | 功能測試 |
| FR-26 | — | — | — | Class: Recommendation | — |
| NFR-01 | I-20 | — | 各 Story DoD | Deployment | 負載測試 |

---

## 7. AI 使用與審查紀錄

| 版本 | 變更 | AI 角色 | 審查／批准者 | Pull Request |
|---|---|---|---|---|
| v0.1 | 初稿 | AI 依訪談紀錄與菜單草擬全文 | （草稿，未批准） | 初始 commit |

詳細審查發現見 `docs/waterfall/review-log.md`。

---

## 8. 簽核 (Sign-off)

> 依 Waterfall + AI 規則：**AI 可以起草，只有人可以接受。** 下列人員簽核後，本文件凍結，方可進入設計階段。

| 角色 | 姓名 | 日期 | 簽核 |
|---|---|---|---|
| 需求分析負責人 | 【填入】 | 【填入】 | ☐ |
| 審查者 1 | 【填入】 | 【填入】 | ☐ |
| 審查者 2 | 【填入】 | 【填入】 | ☐ |

---

## 附錄 A. UML 圖

| 圖 | 檔案 |
|---|---|
| Use Case Diagram | `docs/uml/png/01_use_case.png` |
| Class Diagram（領域模型） | `docs/uml/png/02_class.png` |
| Sequence Diagram：跨店結帳與取餐 | `docs/uml/png/03_sequence_checkout_pickup.png` |
| State Machine：Order | `docs/uml/png/04_state_order.png` |
| Activity Diagram：結帳與選時段 | `docs/uml/png/05_activity_checkout.png` |
| Component Diagram：系統脈絡 | `docs/uml/png/06_component.png` |

原始碼（PlantUML）位於 `docs/uml/src/`。需求原型見 `prototype/index.html`。
