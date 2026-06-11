<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:forEach 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">📋 1. c:forEach 遍歷集合</div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>名稱</th>
                    <th>價格</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${advList}">
                    <tr>
                        <td><span class="badge" style="background:#7f8c8d">${item.id}</span></td>
                        <td>${item.name}</td>
                        <td><span class="token">${item.price}</span></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>