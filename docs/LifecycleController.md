# JSP 生命週期與隱含物件練習 (Day 1-1)

這個練習展示 JSP 的完整生命週期以及如何直接使用九大隱含物件。透過在 JSP 宣告 `jspInit` 與 `jspDestroy` 並使用實例變數記錄頁面訪問次數，驗證 JSP 本質是 Servlet。

## 1. 核心流程
1. 瀏覽器請求 `/learning/jsp/lifecycle`
2. Spring 轉發至 `/WEB-INF/jsp/lifecycle.jsp`
3. JSP 容器執行生命週期階段：首次請求觸發 `jspInit()`，每次請求進入 `_jspService`，關閉時執行 `jspDestroy()`
4. 頁面輸出訪問次數及隱含物件資訊

## 2. 生命週期實驗
- 在 JSP 中宣告 `<%! %>` 定義實例變數 `visitCount` 及 `jspInit`/`jspDestroy` 方法。
- 每次請求在 `<% %>` 中將 `visitCount` 加 1，模擬 Servlet 的服務階段。
- 重新部署或重啟容器時，觀察計數器歸零與重新初始化。

## 3. 隱含物件直接使用
- `request`：取得客戶端 IP 與 Header。
- `session`：取得 Session ID。
- `application`：取得伺服器資訊。
- `pageContext`：可間接獲取其他物件。

## 4. 重要觀念
- JSP 生命週期對應 Servlet 的 `init()` → `service()` → `destroy()`。
- 隱含物件無需宣告，直接在 Scriptlet 或 EL 中使用。
- 本練習刻意保留 Scriptlet 以觀察底層行為，但實際專案應盡量避免。