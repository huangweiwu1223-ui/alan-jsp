<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:param 範例</title>
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
        .code-block {
            font-family: monospace;
            color: #d63384;
            background: #eee;
            padding: 2px 4px;
            border-radius: 3px;
        }
    </style>
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

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:param 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：帶多個參數的連結</div>
        <c:url value="/product" var="productUrl">
            <c:param name="id" value="P001" />
            <c:param name="category" value="壽險" />
            <c:param name="promo" value="2026" />
        </c:url>
        <p>連結：<span class="code-block">${productUrl}</span></p>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：特殊字符自動編碼</div>
        <c:url value="/search" var="encodedUrl">
            <c:param name="q" value="價格 > 100 & 折扣" />
        </c:url>
        <p>原始值包含 &amp; 和 &gt;，編碼後：<span class="code-block">${encodedUrl}</span></p>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：在 c:import 中使用 c:param</div>
        <c:catch var="importEx">
            <c:import url="/learning/jsp/jstl/url" var="importedContent">
                <c:param name="ref" value="param-demo" />
            </c:import>
            <p>匯入內容長度：${importedContent.length()} 字元 (局部資源)</p>
        </c:catch>
        <c:if test="${not empty importEx}">
            <p style="color:red;">匯入失敗 (此練習可能無法在本地執行)：${importEx.message}</p>
        </c:if>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：動態參數名稱 (透過變數)</div>
        <c:set var="paramName" value="sort" />
        <c:set var="paramValue" value="price" />
        <c:url value="/list" var="dynUrl">
            <c:param name="${paramName}" value="${paramValue}" />
        </c:url>
        <p>動態參數：<span class="code-block">${dynUrl}</span></p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：從請求參數取得並重新傳遞</div>
        <c:set var="fromRequest" value="${param.from}" />
        <c:url value="/next" var="forwardUrl">
            <c:if test="${not empty fromRequest}">
                <c:param name="origin" value="${fromRequest}" />
            </c:if>
        </c:url>
        <p>若 URL 帶有 ?from=home，則重新附加：${forwardUrl} (目前 param.from = ${fromRequest})</p>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：空值參數處理</div>
        <c:set var="emptyVal" value="" />
        <c:url value="/filter" var="emptyUrl">
            <c:param name="tag" value="${emptyVal}" />
        </c:url>
        <p>空值參數：<span class="code-block">${emptyUrl}</span> (參數仍會附加但值為空)</p>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：參數覆蓋 (相同名稱多次)</div>
        <c:url value="/report" var="overrideUrl">
            <c:param name="type" value="A" />
            <c:param name="type" value="B" />
        </c:url>
        <p>多次設同名參數，最終：<span class="code-block">${overrideUrl}</span> (可能取最後一個)</p>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：搭配 URL 重寫含 Session ID</div>
        <c:url value="/secure/dashboard" var="secureUrl">
            <c:param name="token" value="abc123" />
        </c:url>
        <p>重寫後：<span class="code-block">${secureUrl}</span> (若 cookie 禁用，會附加 jsessionid)</p>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：建立外部 API 請求 URL</div>
        <c:url value="https://api.example.com/data" var="extUrl">
            <c:param name="apikey" value="demo-key" />
            <c:param name="format" value="json" />
        </c:url>
        <p>外部 URL：<span class="code-block">${extUrl}</span></p>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：表單 GET 模擬連結</div>
        <c:url value="/login" var="loginUrl">
            <c:param name="user" value="alan" />
            <c:param name="lang" value="zh-TW" />
        </c:url>
        <a href="${loginUrl}" style="color:#3498db;">模擬登入連結</a>
        <p>點擊將導向：${loginUrl}</p>
    </div>

</body>

</html>
