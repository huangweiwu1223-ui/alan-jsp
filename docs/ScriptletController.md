# Scriptlet 傳統寫法練習 (Day 2-1)

回顧早期 J2EE 開發中如何在 JSP 內嵌 Java 程式碼（Scriptlet），並理解其造成的維護問題。

## 1. 核心流程
1. Controller 準備一個 `List<String>` 保單列表，放入 `Model`（Request 作用域）。
2. JSP 使用 `<% %>` 取得清單，以 `for` 迴圈搭配 `<%= %>` 輸出 HTML。

## 2. 程式碼重點
```jsp
<%
    List<String> policyList = (List<String>) request.getAttribute("policyList");
    if (policyList != null) {
        for (String policy : policyList) {
%>
            <li><%= policy %></li>
<%
        }
    }
%>
```
- 需要強制轉型，增加出錯風險。
- HTML 與 Java 邏輯交錯，閱讀困難。
- 缺乏標準化的錯誤處理（例如清單為 null 或空時的顯示）。

## 3. 缺點總結
- 破壞 MVC 分層，JSP 承擔過多邏輯。
- 難以與前端開發者協作。
- 容易產生 NullPointerException 或型態轉換錯誤。

## 4. 演進方向
下一練習將使用 JSTL 標準標籤庫取代 Scriptlet，實現更清晰的視圖層。