# 四大作用域練習 (Day 1-2)

展示 Page、Request、Session、Application 四種作用域的設定與讀取方式，以及 EL 表達式的變數尋找順序。

## 1. 核心流程
1. Controller (`/learning/jsp/scopes`) 使用 Model、HttpSession、ServletContext 分別設定 Request、Session、Application 作用域屬性。
2. JSP (`scopes.jsp`) 中設定 Page 作用域屬性，並使用 EL 與隱含物件讀取四種範圍的資料。

## 2. Controller 設定
```java
model.addAttribute("requestData", "Request 資料");
session.setAttribute("sessionData", "Session 資料");
context.setAttribute("applicationData", "Application 資料");
```
Page 屬性無法從 Controller 設定，留在 JSP 中透過 `pageContext.setAttribute` 完成。

## 3. JSP 讀取
- EL：`${pageScope.pageData}`、`${requestScope.requestData}` 等。
- Scriptlet：`request.getAttribute(...)` 直接取得物件。
- 若省略 Scope 前綴，EL 將依序搜尋 page → request → session → application。

## 4. 重點
- Request 作用域為同一次請求有效，適合 Controller 與 JSP 之間傳遞一次性資料。
- Session 作用域跨請求，用於登入狀態、購物車。
- Application 作用域全域共享，謹慎使用以避免競爭條件。
- Page 作用域僅限當前頁面，通常用於暫存中間結果。