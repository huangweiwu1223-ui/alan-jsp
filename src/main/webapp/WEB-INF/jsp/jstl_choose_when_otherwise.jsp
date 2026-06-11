<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:choose 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🔀 3. 多重條件判斷 (c:choose)</div>
        <p>當前角色標籤：<span class="token">${userRole}</span></p>

        <div style="margin-top: 15px;">
            <c:choose>
                <c:when test="${userRole == 'ADMIN'}">
                    <button style="background: #e74c3c;">進入管理後台</button>
                </c:when>
                <c:when test="${userRole == 'USER'}">
                    <button style="background: #3498db;">進入個人中心</button>
                </c:when>
                <c:otherwise>
                    <div class="scope-item" style="border-left-color: #95a5a6;">
                        <p>請登入以查看功能</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>

</html>