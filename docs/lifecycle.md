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
