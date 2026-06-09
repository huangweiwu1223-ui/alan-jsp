# JSP Scriptlet 基礎與語法演進 (Day 1-4)

本單元旨在深入理解 JSP 的傳統寫法，雖然在現代開發中已被 EL 與 JSTL 取代，但掌握 Scriptlet 對於維護舊系統與理解 JSP 轉譯成 Servlet 的底層邏輯至關重要。

## 1. 課程大綱
- **[30m] 三大基本標籤**：掌握 `<% %>`、`<%= %>` 與 `<%! %>` 的作用域與差異。
- **[30m] 隱含物件 (Implicit Objects)**：直接操作 `request`, `session`, `out` 與 `response`。
- **[40m] 傳統渲染實戰**：練習在 HTML 中嵌入 Java 迴圈生成動態表格（義大利麵條代碼）。
- **[20m] 反模式討論**：為什麼我們現在推崇 EL 而非 Scriptlet？

## 2. 核心觀念：Scriptlet 的三種型態
1. **Scriptlet `<% ... %>`**：
   - 程式碼會被放入 Servlet 的 `_jspService()` 方法中。
   - 用於流程控制（if, for）與區域變數宣告。
2. **Expression `<%= ... %>`**：
   - 相當於 `out.print()`。
   - **注意**：末尾不可加分號 `;`。
3. **Declaration `<%! ... %>`**：
   - 定義 Servlet 類別的「成員變數」或「成員方法」。
   - **警告**：在高併發環境下需注意執行緒安全問題。

## 3. 實作任務
### 實驗 1：變數作用域觀察
- 比較 `<%! int count = 0; %>` (全域) 與 `<% int count = 0; %>` (區域) 在頁面重整後的數值變化。

### 實驗 2：手動 Header 操作
- 使用 `response.setHeader` 實作「禁止頁面緩存」的功能。
- 使用 `out.println` 手動在畫面上噴出除錯資訊。

## 4. 關鍵語法清單
- `<%= request.getContextPath() %>`: 取得專案路徑。
- `<% response.sendRedirect("url"); %>`: 伺服器端重導向。
- `<% out.flush(); %>`: 強制將緩衝區內容送出。

## 5. 課後練習 (30m)
### 挑戰 1：傳統登入攔截器
- **目標**：在 `scriptlet.jsp` 頂部加入檢查。
- **實作**：如果 `session` 中沒有 `currentUser`，則使用 `out.print` 顯示「請先登入」並使用 JavaScript `location.href` 導向。

### 挑戰 2：萬用表格生成器
- **目標**：使用 `for` 迴圈。
- **實作**：將 Controller 傳來的 `List<User>` 物件，手動使用 `<tr>` 與 `<td>` 標籤拼湊出來。
