<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:remove 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🗑️ 8. c:remove 移除變數</div>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">移除前</div>
                <div class="scope-value">${tempMsg}</div>
            </div>
            <c:remove var="tempMsg" />
            <div class="scope-item" style="border-left-color: #e74c3c;">
                <div class="scope-title">移除後</div>
                <div class="scope-value">${empty tempMsg ? '(已清空)' : tempMsg}</div>
            </div>
        </div>
    </div>
</body>

</html>