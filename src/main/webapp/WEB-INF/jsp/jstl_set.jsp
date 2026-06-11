<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:set 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">📥 5. c:set 變數設定</div>
        <c:set var="bonus" value="500" scope="page" />
        <div class="scope-item">
            <div class="scope-title">PAGE SCOPE VARIABLE</div>
            <div class="scope-value">Bonus: ${bonus}</div>
            <small>使用 <code>&lt;c:set&gt;</code> 動態建立的變數</small>
        </div>
    </div>
</body>

</html>