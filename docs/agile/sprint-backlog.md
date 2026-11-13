# Sprint Backlog：任務拆解與 Sprint 分類

> 每個 User Story 拆成數個開發任務（Task），再依 Sprint 分類。
> GitHub 上：Story 與 Task 都是 Issue，Task 掛在 Story 底下（sub-issue），並用里程碑 **Sprint 1／2／3** 分類；看板依 Sprint 分組。
> 負責人在 Sprint Planning 時指派；預估時數為初估，Planning Poker 後可調整。

## 總覽

| Sprint | 目標 | Stories | 任務數 | 預估時數 |
|---|---|---|---|---|
| [Sprint 1](https://github.com/Lululu525/NtustEats/milestone/1) | 學生能看菜單、組合麻辣燙、跨店結帳並選取餐時段；店家能接單、出餐 | US-01、US-03、US-04、US-06、US-07、US-08、US-09 | 31 | 53 h |
| [Sprint 2](https://github.com/Lululu525/NtustEats/milestone/2) | 校外訪客、加購、售完、取消、通知、優惠、放鳥停權、菜單維護與管理報表 | US-02、US-05、US-10、US-11、US-12、US-13、US-14、US-15、US-16 | 25 | 29 h |
| [Sprint 3](https://github.com/Lululu525/NtustEats/milestone/3) | 把需求方試用原型後提出的 CR-01～CR-10 做進系統 | US-17、US-18、US-19、US-20、US-21、US-22、US-23、US-24、US-25、US-26 | 30 | 51 h |

每個 Sprint 都包含：Sprint Planning（選 Story、拆任務、估時）→ 開發（每 2～3 天 Daily Scrum，記在 `daily-log.md`）→ Sprint Review（原型給需求方試用）→ Retrospective（檢討）。

## Sprint 1：核心點餐流程

**Sprint 目標：** 學生能看菜單、組合麻辣燙、跨店結帳並選取餐時段；店家能接單、出餐

### US-01（[#13](https://github.com/Lululu525/NtustEats/issues/13)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-101](https://github.com/Lululu525/NtustEats/issues/56) | 建立學號／教職員編號資料表，判斷校內身分 | 資料 | 2 h | 【】 | 待辦 |
| [T-102](https://github.com/Lululu525/NtustEats/issues/57) | 登入畫面：帳號＋密碼欄位與錯誤訊息 | 前端 | 2 h | 【】 | 待辦 |
| [T-103](https://github.com/Lululu525/NtustEats/issues/58) | 依身分切換校內價／校外價 | 前端 | 1 h | 【】 | 待辦 |
| [T-104](https://github.com/Lululu525/NtustEats/issues/59) | 測試：校內帳號看到校內價、校外看到校外價 | 測試 | 1 h | 【】 | 待辦 |

### US-03（[#15](https://github.com/Lululu525/NtustEats/issues/15)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-105](https://github.com/Lululu525/NtustEats/issues/60) | 紙本菜單拍照並數位化成 menu.json（校內／校外價） | 資料 | 4 h | 【】 | 待辦 |
| [T-106](https://github.com/Lululu525/NtustEats/issues/61) | 店家列表：圖示、營業時間、營業中標示 | 前端 | 2 h | 【】 | 待辦 |
| [T-107](https://github.com/Lululu525/NtustEats/issues/62) | 店家菜單頁：分類、價格、售完標示 | 前端 | 3 h | 【】 | 待辦 |
| [T-108](https://github.com/Lululu525/NtustEats/issues/63) | 看不清楚的價格標「價格待確認」 | 資料 | 1 h | 【】 | 待辦 |
| [T-109](https://github.com/Lululu525/NtustEats/issues/64) | 測試：每家店菜單與紙本一致（抽查） | 測試 | 2 h | 【】 | 待辦 |

### US-04（[#16](https://github.com/Lululu525/NtustEats/issues/16)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-110](https://github.com/Lululu525/NtustEats/issues/65) | 麻辣燙組合畫面：湯底必選 | 前端 | 2 h | 【】 | 待辦 |
| [T-111](https://github.com/Lululu525/NtustEats/issues/66) | 「火鍋料任選 4 個」數量檢查 | 前端 | 2 h | 【】 | 待辦 |
| [T-112](https://github.com/Lululu525/NtustEats/issues/67) | 主食、肉類、時蔬加點與總價即時更新 | 前端 | 2 h | 【】 | 待辦 |
| [T-113](https://github.com/Lululu525/NtustEats/issues/68) | 錯誤狀態：沒選湯底、不是 4 樣時不能加入 | 前端 | 1 h | 【】 | 待辦 |
| [T-114](https://github.com/Lululu525/NtustEats/issues/69) | 測試：AC1～AC4 | 測試 | 1 h | 【】 | 待辦 |

### US-06（[#18](https://github.com/Lululu525/NtustEats/issues/18)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-115](https://github.com/Lululu525/NtustEats/issues/70) | 購物車資料結構：可放不同店的品項 | 資料 | 1 h | 【】 | 待辦 |
| [T-116](https://github.com/Lululu525/NtustEats/issues/71) | 購物車頁：修改數量、刪除品項、小計 | 前端 | 2 h | 【】 | 待辦 |
| [T-117](https://github.com/Lululu525/NtustEats/issues/72) | 結帳時依店家拆成多張訂單 | 前端 | 2 h | 【】 | 待辦 |
| [T-118](https://github.com/Lululu525/NtustEats/issues/73) | 測試：兩家店一起結帳產生兩張訂單 | 測試 | 1 h | 【】 | 待辦 |

### US-07（[#19](https://github.com/Lululu525/NtustEats/issues/19)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-119](https://github.com/Lululu525/NtustEats/issues/74) | 取餐時段計算：每 10 分鐘一格、扣掉備餐時間 | 前端 | 2 h | 【】 | 待辦 |
| [T-120](https://github.com/Lululu525/NtustEats/issues/75) | 每格名額上限（每店 15 筆）與額滿鎖定 | 前端 | 2 h | 【】 | 待辦 |
| [T-121](https://github.com/Lululu525/NtustEats/issues/76) | 兩人同時搶最後一個名額不超收 | 前端 | 2 h | 【】 | 待辦 |
| [T-122](https://github.com/Lululu525/NtustEats/issues/77) | 測試：額滿時段不能選 | 測試 | 1 h | 【】 | 待辦 |

### US-08（[#20](https://github.com/Lululu525/NtustEats/issues/20)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-123](https://github.com/Lululu525/NtustEats/issues/78) | 訂單號碼規則（店家代碼＋流水號） | 資料 | 1 h | 【】 | 待辦 |
| [T-124](https://github.com/Lululu525/NtustEats/issues/79) | QR Code：128-bit 隨機 token | 前端 | 1 h | 【】 | 待辦 |
| [T-125](https://github.com/Lululu525/NtustEats/issues/80) | 我的訂單頁：號碼、QR、狀態進度 | 前端 | 2 h | 【】 | 待辦 |
| [T-126](https://github.com/Lululu525/NtustEats/issues/81) | 測試：每張訂單號碼不重複 | 測試 | 1 h | 【】 | 待辦 |

### US-09（[#21](https://github.com/Lululu525/NtustEats/issues/21)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-127](https://github.com/Lululu525/NtustEats/issues/82) | 店家佇列看板：新訂單／製作中／可取餐 | 前端 | 3 h | 【】 | 待辦 |
| [T-128](https://github.com/Lululu525/NtustEats/issues/83) | 接單、完成通知取餐、拒絕（售完／忙不過來） | 前端 | 2 h | 【】 | 待辦 |
| [T-129](https://github.com/Lululu525/NtustEats/issues/84) | 輸入號碼核對取餐 | 前端 | 1 h | 【】 | 待辦 |
| [T-130](https://github.com/Lululu525/NtustEats/issues/85) | 學生姓名遮罩（只顯示頭尾） | 前端 | 1 h | 【】 | 待辦 |
| [T-131](https://github.com/Lululu525/NtustEats/issues/86) | 測試：完整接單到取餐流程（Playwright） | 測試 | 2 h | 【】 | 待辦 |

## Sprint 2：周邊功能

**Sprint 目標：** 校外訪客、加購、售完、取消、通知、優惠、放鳥停權、菜單維護與管理報表

### US-02（[#14](https://github.com/Lululu525/NtustEats/issues/14)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-201](https://github.com/Lululu525/NtustEats/issues/87) | 校外訪客入口：暱稱＋手機 | 前端 | 1 h | 【】 | 待辦 |
| [T-202](https://github.com/Lululu525/NtustEats/issues/88) | 訪客一律套用校外價 | 前端 | 1 h | 【】 | 待辦 |
| [T-203](https://github.com/Lululu525/NtustEats/issues/89) | 測試：訪客看到校外價 | 測試 | 1 h | 【】 | 待辦 |

### US-05（[#17](https://github.com/Lululu525/NtustEats/issues/17)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-204](https://github.com/Lululu525/NtustEats/issues/90) | 加購資料模型（加蛋、加肉、加料） | 資料 | 1 h | 【】 | 待辦 |
| [T-205](https://github.com/Lululu525/NtustEats/issues/91) | 加購按鈕與數量 | 前端 | 2 h | 【】 | 待辦 |
| [T-206](https://github.com/Lululu525/NtustEats/issues/92) | 加購計入總價 | 前端 | 1 h | 【】 | 待辦 |

### US-10（[#22](https://github.com/Lululu525/NtustEats/issues/22)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-207](https://github.com/Lululu525/NtustEats/issues/93) | 店家菜單頁：一鍵售完開關 | 前端 | 1 h | 【】 | 待辦 |
| [T-208](https://github.com/Lululu525/NtustEats/issues/94) | 學生端即時顯示售完、不能加入購物車 | 前端 | 1 h | 【】 | 待辦 |
| [T-209](https://github.com/Lululu525/NtustEats/issues/95) | 送出訂單前再檢查一次售完 | 前端 | 1 h | 【】 | 待辦 |

### US-11（[#23](https://github.com/Lululu525/NtustEats/issues/23)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-210](https://github.com/Lululu525/NtustEats/issues/96) | 店家接單前學生可取消 | 前端 | 1 h | 【】 | 待辦 |
| [T-211](https://github.com/Lululu525/NtustEats/issues/97) | 取消後自動退款、釋放時段名額 | 前端 | 2 h | 【】 | 待辦 |
| [T-212](https://github.com/Lululu525/NtustEats/issues/98) | 測試：接單後不能取消 | 測試 | 1 h | 【】 | 待辦 |

### US-12（[#24](https://github.com/Lululu525/NtustEats/issues/24)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-213](https://github.com/Lululu525/NtustEats/issues/99) | 店家按完成 → 學生端顯示可取餐 | 前端 | 1 h | 【】 | 待辦 |
| [T-214](https://github.com/Lululu525/NtustEats/issues/100) | 訂單狀態進度條 | 前端 | 1 h | 【】 | 待辦 |

### US-13（[#25](https://github.com/Lululu525/NtustEats/issues/25)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-215](https://github.com/Lululu525/NtustEats/issues/101) | DAKA 早上優惠規則（時間、贈品） | 資料 | 1 h | 【】 | 待辦 |
| [T-216](https://github.com/Lululu525/NtustEats/issues/102) | 贈品選擇畫面 | 前端 | 1 h | 【】 | 待辦 |
| [T-217](https://github.com/Lululu525/NtustEats/issues/103) | 測試：優惠時段外不送贈品 | 測試 | 1 h | 【】 | 待辦 |

### US-14（[#26](https://github.com/Lululu525/NtustEats/issues/26)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-218](https://github.com/Lululu525/NtustEats/issues/104) | 店家標記未取餐 | 前端 | 1 h | 【】 | 待辦 |
| [T-219](https://github.com/Lululu525/NtustEats/issues/105) | 30 天內未取餐 2 次停權 14 天 | 前端 | 2 h | 【】 | 待辦 |
| [T-220](https://github.com/Lululu525/NtustEats/issues/106) | 放鳥檢查排程（模擬） | 前端 | 1 h | 【】 | 待辦 |

### US-15（[#27](https://github.com/Lululu525/NtustEats/issues/27)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-221](https://github.com/Lululu525/NtustEats/issues/107) | 店家修改價格即存檔 | 前端 | 1 h | 【】 | 待辦 |
| [T-222](https://github.com/Lululu525/NtustEats/issues/108) | 校外價低於校內價時擋下、價差異常提醒 | 前端 | 1 h | 【】 | 待辦 |

### US-16（[#28](https://github.com/Lululu525/NtustEats/issues/28)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-223](https://github.com/Lululu525/NtustEats/issues/109) | 各店 × 取餐時段訂單熱度表 | 前端 | 2 h | 【】 | 待辦 |
| [T-224](https://github.com/Lululu525/NtustEats/issues/110) | 匯出 CSV | 前端 | 1 h | 【】 | 待辦 |
| [T-225](https://github.com/Lululu525/NtustEats/issues/111) | 補上驗收條件 AC1～AC4（PR #46） | 文件 | 1 h | 【】 | 待辦 |

## Sprint 3：需求變更（Sprint Review 回饋）

**Sprint 目標：** 把需求方試用原型後提出的 CR-01～CR-10 做進系統

### US-17（[#29](https://github.com/Lululu525/NtustEats/issues/29)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-301](https://github.com/Lululu525/NtustEats/issues/112) | 稻穗輕食 iCHEF 菜單數位化 | 資料 | 2 h | 【】 | 待辦 |
| [T-302](https://github.com/Lululu525/NtustEats/issues/113) | 加入店家與菜單資料 | 資料 | 1 h | 【】 | 待辦 |

### US-18（[#30](https://github.com/Lululu525/NtustEats/issues/30)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-303](https://github.com/Lululu525/NtustEats/issues/114) | 學號解析系級、年級 | 前端 | 2 h | 【】 | 待辦 |
| [T-304](https://github.com/Lululu525/NtustEats/issues/115) | 身分證字號格式檢查（密碼） | 前端 | 1 h | 【】 | 待辦 |
| [T-305](https://github.com/Lululu525/NtustEats/issues/116) | 新增組員測試帳號 | 資料 | 1 h | 【】 | 待辦 |

### US-19（[#31](https://github.com/Lululu525/NtustEats/issues/31)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-306](https://github.com/Lululu525/NtustEats/issues/117) | 封面三種身分入口（校內／校外／店家） | 前端 | 2 h | 【】 | 待辦 |
| [T-307](https://github.com/Lululu525/NtustEats/issues/118) | 店家密碼登入（預設 0000、可修改） | 前端 | 2 h | 【】 | 待辦 |
| [T-308](https://github.com/Lululu525/NtustEats/issues/119) | 總務處編輯模式：新增店家、設定菜單 | 前端 | 3 h | 【】 | 待辦 |

### US-20（[#32](https://github.com/Lululu525/NtustEats/issues/32)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-309](https://github.com/Lululu525/NtustEats/issues/120) | manifest 與 App icon | 前端 | 1 h | 【】 | 待辦 |
| [T-310](https://github.com/Lululu525/NtustEats/issues/121) | Service Worker 快取，可離線開啟 | 前端 | 2 h | 【】 | 待辦 |
| [T-311](https://github.com/Lululu525/NtustEats/issues/122) | 全螢幕 App 版面 | 前端 | 2 h | 【】 | 待辦 |

### US-21（[#33](https://github.com/Lululu525/NtustEats/issues/33)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-312](https://github.com/Lululu525/NtustEats/issues/123) | 校徽藍色系色票 | 前端 | 1 h | 【】 | 待辦 |
| [T-313](https://github.com/Lululu525/NtustEats/issues/124) | 學生餐廳 icon 與封面 | 前端 | 1 h | 【】 | 待辦 |

### US-22（[#34](https://github.com/Lululu525/NtustEats/issues/34)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-314](https://github.com/Lululu525/NtustEats/issues/125) | 付款方式：LINE Pay／校園帳戶 | 前端 | 2 h | 【】 | 待辦 |
| [T-315](https://github.com/Lululu525/NtustEats/issues/126) | 校園帳戶餘額扣款、餘額不足提示 | 前端 | 2 h | 【】 | 待辦 |
| [T-316](https://github.com/Lululu525/NtustEats/issues/127) | 校外人士付款填手機 | 前端 | 1 h | 【】 | 待辦 |
| [T-317](https://github.com/Lululu525/NtustEats/issues/128) | 取消／拒絕自動退款 | 前端 | 1 h | 【】 | 待辦 |

### US-23（[#35](https://github.com/Lululu525/NtustEats/issues/35)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-318](https://github.com/Lululu525/NtustEats/issues/129) | 店家交付餐點 → 學生按完成訂單 | 前端 | 2 h | 【】 | 待辦 |
| [T-319](https://github.com/Lululu525/NtustEats/issues/130) | 未完成訂單不能點下一餐 | 前端 | 1 h | 【】 | 待辦 |

### US-24（[#36](https://github.com/Lululu525/NtustEats/issues/36)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-320](https://github.com/Lululu525/NtustEats/issues/131) | 店家二次確認更正未取餐 | 前端 | 1 h | 【】 | 待辦 |
| [T-321](https://github.com/Lululu525/NtustEats/issues/132) | 撤銷放鳥紀錄並重算停權 | 前端 | 1 h | 【】 | 待辦 |

### US-25（[#38](https://github.com/Lululu525/NtustEats/issues/38)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-322](https://github.com/Lululu525/NtustEats/issues/134) | 登入後選餐廳（第一餐廳／第二教學大樓） | 前端 | 2 h | 【】 | 待辦 |
| [T-323](https://github.com/Lululu525/NtustEats/issues/135) | 12 家新店菜單數位化 | 資料 | 6 h | 【】 | 待辦 |
| [T-324](https://github.com/Lululu525/NtustEats/issues/136) | 店家登入先選餐廳再選店 | 前端 | 1 h | 【】 | 待辦 |
| [T-325](https://github.com/Lululu525/NtustEats/issues/137) | 依店家確認更新價格；拉麵屋改屬第一餐廳 | 資料 | 1 h | 【】 | 待辦 |

### US-26（[#53](https://github.com/Lululu525/NtustEats/issues/53)）

| 任務 | 內容 | 類型 | 預估 | 負責人 | 狀態 |
|---|---|---|---|---|---|
| [T-326](https://github.com/Lululu525/NtustEats/issues/138) | 儲值機（行政大樓、圖書館）儲值紀錄 | 前端 | 2 h | 【】 | 待辦 |
| [T-327](https://github.com/Lululu525/NtustEats/issues/139) | 付款先由學校代收、訂單完成轉待撥款 | 前端 | 2 h | 【】 | 待辦 |
| [T-328](https://github.com/Lululu525/NtustEats/issues/140) | 總務處執行撥款、產生撥款單 | 前端 | 2 h | 【】 | 待辦 |
| [T-329](https://github.com/Lululu525/NtustEats/issues/141) | 店家帳務頁 | 前端 | 2 h | 【】 | 待辦 |
| [T-330](https://github.com/Lululu525/NtustEats/issues/142) | 對帳檢查 | 前端 | 1 h | 【】 | 待辦 |

## 完成定義（Definition of Done）

- 功能可在原型（GitHub Pages）操作
- 通過 Story 的驗收條件
- 程式碼經 PR、由非作者組員 Review／Approve 後合併
- 看板卡片移到 Done，`daily-log.md` 有紀錄
