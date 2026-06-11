<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:catch 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">⚠️ 11. c:catch 例外捕捉</div>
        <c:catch var="ex">
            <% 
                // 故意製造錯誤
                int result = 10 / 0; 
            %>
        </c:catch>
        <c:if test="${not empty ex}">
            <div class="scope-item" style="border-left-color: #e74c3c; background: #fdf2f2;">
                <div class="scope-title" style="color: #c0392b;">發生錯誤 (Exception)</div>
                <div class="scope-value" style="color: #e74c3c;">${ex.message}</div>
            </div>
        </c:if>
    </div>
</body>

</html>