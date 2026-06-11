<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:url 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🔗 6. c:url 路徑處理</div>
        <c:url value="/css/main.css" var="cssUrl" />
        <div class="scope-item">
            <div class="scope-title">產生的絕對路徑</div>
            <div class="scope-value" style="font-size: 0.9rem;">${cssUrl}</div>
        </div>
        <div style="margin-top: 15px;">
            <a href="<c:url value='/' />" style="color: #3498db; text-decoration: underline;">回首頁</a>
        </div>
    </div>
</body>

</html>