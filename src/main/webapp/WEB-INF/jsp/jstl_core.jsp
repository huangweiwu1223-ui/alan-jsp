<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 2-1：JSTL 核心標籤入門</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .section {
            margin-bottom: 30px;
        }

        .token {
            color: #e83e8c;
            font-weight: bold;
            font-family: monospace;
        }

        .result-box {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 10px;
            border-radius: 4px;
            margin-top: 5px;
        }

        .error-box {
            border: 2px dashed red;
            background-color: #ffeeee;
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>

<body>
    <h1>📚 JSTL 核心標籤入門</h1>
    <p>學習重點：<code>&lt;c:set&gt;</code>, <code>&lt;c:out&gt;</code>, <code>&lt;c:if&gt;</code>,
        <code>&lt;c:choose&gt;</code>, <code>&lt;c:catch&gt;</code></p>

    <!-- 變數管理 -->
    <div class="card">
        <div class="card-header">🗂️ 1. 變數管理 (c:set / c:remove)</div>
        <c:set var="bonus" value="${accountBalance * 0.1}" scope="page" />
        <table>
            <tr>
                <th>語法</th>
                <td><span class="token">&lt;c:set var="bonus" value="${accountBalance * 0.1}"/&gt;</span></td>
            </tr>
            <tr>
                <th>原始餘額</th>
                <td>${accountBalance}</td>
            </tr>
            <tr>
                <th>計算獎金 (10%)</th>
                <td><strong>${bonus}</strong></td>
            </tr>
        </table>
        <c:remove var="bonus" scope="page" />
        <p>執行 <code>c:remove</code> 後獎金：<span class="token">${bonus}</span> (應為空值)</p>
    </div>

    <!-- 輸出與 XSS 防護 -->
    <div class="card">
        <div class="card-header">🛡️ 2. 安全輸出 (c:out)</div>
        <table>
            <tr>
                <th>原始內容</th>
                <td><code>${unsafeContent}</code></td>
            </tr>
            <tr>
                <th>預設 escapeXml="true"</th>
                <td>
                    <c:out value="${unsafeContent}" />
                </td>
            </tr>
            <tr>
                <th>escapeXml="false" (危險)</th>
                <td>
                    <c:out value="${unsafeContent}" escapeXml="false" />
                </td>
            </tr>
        </table>
        <small>注意：第二行會將 HTML 標籤編碼顯示，第三行則直接執行 script，應始終使用預設值避免 XSS。</small>
    </div>

    <!-- 條件控制 -->
    <div class="card">
        <div class="card-header">🔀 3. 條件判斷 (c:if / c:choose)</div>
        <c:if test="${isLoggedIn}">
            <p>✅ 使用者已登入</p>
        </c:if>
        <c:choose>
            <c:when test="${userRole == 'ADMIN' && isLoggedIn}">
                <div class="result-box"><span style="color:green; font-weight:bold;">管理員模式 - 擁有完整權限</span></div>
            </c:when>
            <c:when test="${userRole == 'USER'}">
                <div class="result-box">一般用戶模式 - 僅限讀取</div>
            </c:when>
            <c:otherwise>
                <div class="result-box" style="color:red;">訪客模式 - 請先登入</div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 異常捕獲 -->
    <div class="card">
        <div class="card-header">⚠️ 4. 異常捕獲 (c:catch)</div>
        <div class="error-box">
            <c:catch var="ex">
                <%-- 故意製造除以零錯誤 --%>
                <% int x = 10 / 0; %>
            </c:catch>
            <c:if test="${not empty ex}">
                <p style="color:red;">捕獲到頁面異常：${ex.message}</p>
            </c:if>
        </div>
    </div>

    <!-- 實作練習 -->
    <div class="card">
        <div class="card-header">🧪 實作練習：分數等級判斷</div>
        <p>給定分數 <code>${practiceScore}</code>，使用 <code>c:choose</code> 顯示等級。</p>
        <c:choose>
            <c:when test="${practiceScore >= 90}">🏆 優等</c:when>
            <c:when test="${practiceScore >= 80}">🥇 甲等</c:when>
            <c:when test="${practiceScore >= 70}">🥈 乙等</c:when>
            <c:otherwise>📚 加油</c:otherwise>
        </c:choose>
        <p class="small">請嘗試修改 Controller 中的 <code>practiceScore</code> 觀察變化。</p>
    </div>
</body>

</html>