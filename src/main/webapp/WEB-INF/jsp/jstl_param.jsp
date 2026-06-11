<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:param 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🏷️ 7. c:param 參數傳遞</div>
        <c:url value="/search" var="searchUrl">
            <c:param name="keyword" value="JSTL教學" />
            <c:param name="page" value="1" />
        </c:url>
        <div class="scope-item">
            <div class="scope-title">URL WITH PARAMETERS</div>
            <div class="scope-value" style="color: #e67e22; font-size: 0.9rem;">${searchUrl}</div>
        </div>
    </div>
</body>

</html>