<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:redirect 範例</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .old-school {
            border-left: 5px solid #e74c3c;
            background: #fdf2f2;
            padding: 15px;
            margin: 10px 0;
        }
        .new-school {
            border-left: 5px solid #2ecc71;
            background: #f2fdf5;
            padding: 15px;
            margin: 10px 0;
        }
        pre {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
    </style>
</head>

<body>
    <div class="card">
        <div class="card-header">🚀 10. c:redirect 重導向</div>
        <p>JSP 標籤式重導向一旦執行會立即跳轉伺服器端。以下是前端模擬按鈕：</p>
        <div style="margin-top: 20px;">
            <button onclick="if(confirm('要重導向至首頁嗎？')) window.location.href='<c:url value="/" />'">
            執行重導向 (JS模擬版本)
            </button>
        </div>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:redirect 用法演示 (均不實際跳轉)</h2>
    <p style="text-align:center; color:#7f8c8d;">以下練習用 <code>&lt;c:if test="false"&gt;</code> 包裹，避免立即跳轉，僅展示標籤寫法。</p>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：簡單重導向至絕對路徑</div>
        <pre>&lt;c:redirect url="/"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="/"/></c:if>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：重導向至相對路徑</div>
        <pre>&lt;c:redirect url="../home"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="../home"/></c:if>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：重導向並附加參數</div>
        <pre>&lt;c:redirect url="/search"&gt;
    &lt;c:param name="q" value="JSTL"/&gt;
&lt;/c:redirect&gt;</pre>
        <c:if test="${false}"><c:redirect url="/search"><c:param name="q" value="JSTL"/></c:redirect></c:if>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：動態 URL 重導向</div>
        <c:set var="target" value="/dashboard" />
        <pre>&lt;c:redirect url="${target}"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="${target}"/></c:if>
        <p>target 變數值：${target}</p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：根據條件重導向不同頁面</div>
        <c:set var="role" value="USER" />
        <pre>&lt;c:choose&gt;
    &lt;c:when test="${role == 'ADMIN'}"&gt;
        &lt;c:redirect url="/admin"/&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt;
        &lt;c:redirect url="/user"/&gt;
    &lt;/c:otherwise&gt;
&lt;/c:choose&gt;</pre>
        <c:if test="${false}">
            <c:choose>
                <c:when test="${role == 'ADMIN'}"><c:redirect url="/admin"/></c:when>
                <c:otherwise><c:redirect url="/user"/></c:otherwise>
            </c:choose>
        </c:if>
        <p>目前角色：${role} → 將導向 /user</p>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：重導向至外部網站</div>
        <pre>&lt;c:redirect url="https://www.google.com"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="https://www.google.com"/></c:if>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：重導向並維持 session (URL 重寫)</div>
        <pre>&lt;c:redirect url="/secure" context="/app"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="/secure" context="/app"/></c:if>
        <p>context 屬性可指定應用路徑。</p>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：錯誤頁面後重導向</div>
        <pre>&lt;c:if test="${not empty error}"&gt;
    &lt;c:redirect url="/error"/&gt;
&lt;/c:if&gt;</pre>
        <c:set var="error" value="true" />
        <c:if test="${false && not empty error}"><c:redirect url="/error"/></c:if>
        <p>模擬錯誤存在，將導向 /error (實際不觸發)</p>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：登出後重導向</div>
        <pre>&lt;c:redirect url="/login?logout=1"/&gt;</pre>
        <c:if test="${false}"><c:redirect url="/login?logout=1"/></c:if>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：使用 response 編碼重導向（對比）</div>
        <pre>&lt;% response.sendRedirect(request.getContextPath() + "/home"); %&gt;</pre>
        <p>傳統 Scriptlet 寫法，JSTL 版更乾淨。</p>
    </div>

</body>

</html>
