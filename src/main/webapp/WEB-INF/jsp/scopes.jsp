<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 在 Page 作用域設定屬性
    pageContext.setAttribute("pageData", "這是在 Page 範圍的資料");
    pageContext.setAttribute("conflictVar", "來自 Page 的衝突變數");
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>Day 1-2: 四大作用域進階展示</title>
    <style>
        .highlight { color: red; font-weight: bold; }
        .box { border: 1px solid #ccc; padding: 10px; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>JSP 四大作用域 (Scopes) 與 EL 優先權</h1>
    
    <div class="box">
        <h3>1. 基礎路徑讀取</h3>
        <ul>
            <li><strong>Page Scope：</strong> ${pageScope.pageData}</li>
            <li><strong>Request Scope：</strong> ${requestScope.requestData}</li>
            <li><strong>Session Scope：</strong> ${sessionScope.sessionData}</li>
            <li><strong>Application Scope：</strong> ${applicationScope.applicationData}</li>
        </ul>
    </div>

    <div class="box">
        <h3>2. EL 尋找順序實驗 (重點)</h3>
        <p>當我們直接寫 <code>\${conflictVar}</code> 而不指定 scope 時：</p>
        <p>結果是：<span class="highlight">${conflictVar}</span></p>
        <small>尋找順序：pageContext → request → session → application (找到即停止)</small>
    </div>

    <div class="box">
        <h3>3. 其他 EL 隱含物件演示</h3>
        <ul>
            <li><strong>Client IP (header):</strong> ${header["user-agent"]}</li>
            <li><strong>Context Path:</strong> ${pageContext.request.contextPath}</li>
            <li><strong>JSESSIONID:</strong> ${cookie.JSESSIONID.value}</li>
        </ul>
    </div>

    <hr>
    <p>說明：Controller 分別設定了 Request、Session、Application 的屬性。講師可藉此說明為何同名變數在不同範圍會互相遮蔽。</p>
</body>
</html>
