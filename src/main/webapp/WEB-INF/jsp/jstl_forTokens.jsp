<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:forTokens 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">✂️ 12. c:forTokens 字串分割</div>
        <p>原始字串: <span class="token">${csvTags}</span></p>
        <div style="display: flex; gap: 10px; margin-top: 10px; flex-wrap: wrap;">
            <c:forTokens items="${csvTags}" delims="," var="tag">
                <span class="badge" style="background: #3498db; padding: 5px 12px;">${tag}</span>
            </c:forTokens>
        </div>
    </div>
</body>

</html>