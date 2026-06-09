# 四大作用域進階實戰 (Day 1-2)

本單元設計為 180 分鐘（3小時）的進階課程，專注於 JSP 作用域的高階應用、EL 表達式的深度檢索邏輯，以及在複雜系統中如何選擇正確的儲存機制。

## 1. 課程大綱 (建議配時)
- **[45m] 深度 EL 探索**：不僅是 `${var}`，學習如何存取 Scope 中的 Map、List 以及巢狀 POJO 物件。
- **[45m] 作用域衝突與遮蔽實驗**：動態觀察 page → request → session → application 的覆蓋優先權。
- **[60m] 資料遷移實作**：練習「Request 轉發 (Forward)」與「Session 持久化」的差異。
- **[30m] 最佳實踐討論**：何時該清理 Session？如何避免 Application Scope 造成的記憶體洩漏。

## 2. 核心觀念：作用域的物理邊界
1. **隱含搜尋路徑**：當未指定 `scopeScope` 時，JSP 引擎的搜尋演算法。
2. **Session 序列化**：為什麼存入 Session 的物件建議實作 `Serializable`。
3. **Context 競爭**：在 Application Scope 中處理多執行緒併發存取的風險。

## 3. 實作任務
### 實驗 1：EL 深度尋找 (Deep Inspection)
- 透過 Controller 傳入一個包含多筆資料的 `List<String>` 到 Request。
- 透過 Controller 傳入一個 `Map<String, Object>` 到 Session。
- 在 JSP 使用 `${requestScope.list[0]}` 與 `${sessionScope.map['key']}` 進行精準讀取。

### 實驗 2：作用域遮蔽實驗 (Shadowing)
- 在四個作用域中同時設定名為 `system_status` 的變數，但給予不同數值（"Page-Ready", "Req-Active", "Ses-Online", "App-Running"）。
- 觀察 `${system_status}` 輸出的結果，並手動移除 `pageContext` 屬性後再次重整，觀察其「向上跳級」的特性。

### 實驗 3：手動銷毀與管理
- 實作一個「局部登出」功能，僅移除 Session 中的特定 Attribute 而非銷毀整個 Session。

## 4. 關鍵進階語法
- `${empty var}`: 檢查作用域變數是否為 null 或空集合。
- `${cookie.name.value}`: 存取瀏覽器 Cookie。
- `${param.id}`: 直接取得 Request Parameter。

## 5. 課後練習 (30m)
請根據現有的 `scopes.jsp` 完成以下挑戰：

### 挑戰 1：實作「最近瀏覽紀錄」
- **目標**：利用 Session 儲存一個 `List<String>`。
- **實作**：當使用者造訪 `scopes.jsp` 時，將當前的時間戳記加入 Session 中的一個名為 `history` 的 List。
- **顯示**：在頁面底部列出最近 5 次訪問的時間。

### 挑戰 2：條件式佈景主題切換器
- **目標**：根據作用域變數動態改變 CSS 類別。
- **實作**：在 Request Parameter 中傳遞 `theme=dark`。
- **邏輯**：如果 `${param.theme == 'dark'}`，則在 `<body>` 標籤加上一個特殊的 CSS Class，改變頁面底色。

### 挑戰 3：安全性篩選器模擬
- **目標**：練習邏輯判斷與作用域結合。
- **實作**：在頁面頂部檢查 `${empty sessionScope.currentUser}`。
- **行為**：如果為空，顯示「訪客模式：功能受限」；如果不為空，顯示「歡迎，${currentUser}」。
