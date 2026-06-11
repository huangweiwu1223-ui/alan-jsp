<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:redirect 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🚀 10. c:redirect 重導向</div>
        <p>JSP 標籤式重導向一旦執行會立即跳轉伺服器端。以下是前端模擬按鈕：</p>
        <div style="margin-top: 20px;">
            <button onclick="if(confirm('要重導向至首頁嗎？')) window.location.href='<c:url value=" /" />'">
            執行重導向 (JS模擬版本)
            </button>
        </div>
    </div>
</body>

</html>