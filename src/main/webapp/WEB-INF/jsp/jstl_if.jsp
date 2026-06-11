<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:if 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">❓ 2. c:if 條件判斷</div>
        <div class="scope-grid">
            <c:if test="${isLoggedIn}">
                <div class="scope-item" style="border-left-color: #2ecc71; background: #eafaf1;">
                    <div class="scope-title">登入狀態</div>
                    <div class="scope-value" style="color: #27ae60;">✅ 您已登入系統</div>
                </div>
            </c:if>
            <c:if test="${accountBalance > 10000}">
                <div class="scope-item" style="border-left-color: #f1c40f;">
                    <div class="scope-title">財務狀況</div>
                    <div class="scope-value">您的餘額充足 (${accountBalance})</div>
                </div>
            </c:if>
        </div>
    </div>
</body>

</html>