<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:import 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">📥 9. c:import 引入資源</div>
        <div
            style="border: 2px solid #ddd; border-radius: 8px; padding: 15px; background: white; max-height: 300px; overflow: auto;">
            <%-- <c:import url="http://www.google.com" /> --%>
            <p style="color: #95a5a6; text-align: center;">(這裡模擬引入外部資源內容...)</p>
        </div>
        <p class="small" style="margin-top:10px; color:#e74c3c;">注意：由於連線限制或 CORS，真實環境可能無法直接 import 外部 URL。</p>
    </div>
</body>

</html>