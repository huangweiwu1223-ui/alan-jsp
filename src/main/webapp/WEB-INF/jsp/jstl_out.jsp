<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:out 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">🛡️ 4. c:out 安全輸出</div>
        <table>
            <tr>
                <th>測試類型</th>
                <th>輸出結果</th>
            </tr>
            <tr>
                <td>EL 直接輸出</td>
                <td><span class="token">${unsafeContent}</span></td>
            </tr>
            <tr>
                <td>c:out (預設防護)</td>
                <td>
                    <c:out value="${unsafeContent}" />
                </td>
            </tr>
            <tr>
                <td>c:out (關閉防護)</td>
                <td style="color:red;">
                    <c:out value="${unsafeContent}" escapeXml="false" />
                </td>
            </tr>
        </table>
    </div>
</body>

</html>