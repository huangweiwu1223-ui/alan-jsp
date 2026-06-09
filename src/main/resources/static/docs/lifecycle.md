# JSP 生命週期與隱含物件實戰 (Day 1-1)

本單元設計為 90~120 分鐘的教學內容，旨在透過「使用者身分管理」的情境，深入理解 JSP 轉譯為 Servlet 的底層機制與四大作用域。

## 1. 課程大綱 (建議配時)
- **[20m] 理論回顧**：JSP 轉譯流程（.jsp -> .java -> .class）與生命週期三階段。
- **[30m] 生命週期實驗**：實作 `jspInit` 與 `jspDestroy`，觀察伺服器重啟與初次訪問的行為。
- **[40m] 隱含物件與作用域實戰**：透過登入模擬，實作 Request、Session、Application 的資料傳遞。
- **[20m] 綜合練習**：讀取 Request Header 資訊並顯示於 UI 儀表板。

## 2. 核心觀念：四大作用域
1. **Page (pageContext)**：僅限當前頁面。
2. **Request**：一次請求（包含轉發）。
3. **Session**：跨多個請求，直到瀏覽器關閉或超時。
4. **Application (ServletContext)**：伺服器運行期間，所有使用者共享。

## 3. 實作任務
### 實驗 1：觀察實例變數 vs. 全域變數
- 使用 `<%! %>` 宣告變數與 `<% %>` 邏輯區塊的差異。
- 觀察當多個瀏覽器分頁同時開啟時，哪些資料會互相影響。

### 實驗 2：身分模擬流
1. 使用者在 `lifecycle.jsp` 輸入名稱。
2. 點擊「設定身分」後，資料透過 Request 傳送到 Controller。
3. Controller 將名稱存入 `HttpSession` (對應 JSP 的 `session` 物件)。
4. 頁面重整，觀察資料如何從 `session` 取回，而非從 `request`。

## 4. 關鍵隱含物件清單
- `request`: 取得 Client 端資料、Parameter、Header。
- `session`: 儲存登入狀態、購物車。
- `application`: 全域計數器、系統設定。
- `out`: 頁面輸出流。
- `pageContext`: 獲取其他 8 個物件的入口。

## 5. 課後練習 (30m)
請根據現有的 `lifecycle.jsp` 完成以下挑戰：

### 挑戰 1：Page Scope 的侷限性
- **目標**：在 JSP 中使用 `<% pageContext.setAttribute("pageMsg", "Hello Page"); %>` 設定一個值。
- **實作**：在「即時儀表板」區塊新增一個項目，嘗試顯示 `${pageScope.pageMsg}`。
- **思考**：當你點擊「設定身分」導致頁面跳轉（Redirect）後，這個 `pageMsg` 還會存在嗎？為什麼？

### 挑戰 2：智慧瀏覽器偵測器
- **目標**：利用 `request` 物件判斷使用者瀏覽器。
- **實作**：在頁面底部新增一段邏輯，如果 `User-Agent` 包含 "Chrome"，則顯示「推薦使用 Chrome 瀏覽器」；若為其他則顯示「建議使用 Chromium 核心瀏覽器」。
- **提示**：使用 `<% if(request.getHeader("User-Agent").contains("Chrome")) { ... } %>`。

### 挑戰 3：實作「全域公告系統」
- **目標**：練習 Application Scope 的讀寫。
- **實作**：
    1. 在 `lifecycle.jsp` 新增一個簡單的 `<form>`，內含一個名稱為 `news` 的文字輸入框。
    2. 提交後，在 JSP 頂部邏輯區塊判斷：若 `request.getParameter("news")` 不為空，則將其存入 `application.setAttribute("system_news", newsValue)`。
    3. 在頁面最上方顯示一個黃色區塊，內容為 `${applicationScope.system_news}`。
- **驗證**：開啟兩個不同的瀏覽器（如 Chrome 與 Firefox），在一邊發布公告，觀察另一邊是否能即時看到更新。
