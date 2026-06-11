<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:url 範例</title>
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
        <div class="card-header">🔗 6. c:url 路徑處理</div>
        <c:url value="/css/main.css" var="cssUrl" />
        <div class="scope-item">
            <div class="scope-title">產生的絕對路徑</div>
            <div class="scope-value" style="font-size: 0.9rem;">${cssUrl}</div>
        </div>
        <div style="margin-top: 15px;">
            <a href="<c:url value='/' />" style="color: #3498db; text-decoration: underline;">回首頁</a>
        </div>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:url 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：附加查詢參數</div>
        <c:url value="/products" var="prodUrl">
            <c:param name="cat" value="壽險" />
            <c:param name="page" value="2" />
        </c:url>
        <p>完整 URL：<span class="code-block">${prodUrl}</span></p>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：使用 var 儲存 URL 並多次利用</div>
        <c:url value="/images/logo.png" var="logoUrl" />
        <p>Logo 路徑：${logoUrl}</p>
        <img src="${logoUrl}" alt="logo" style="width:50px;" onerror="this.style.display='none'"/>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：在 c:import 中使用 c:url</div>
        <c:url value="/learning/jsp/jstl/url" var="selfUrl" />
        <c:catch var="impEx">
            <c:import url="${selfUrl}" var="pageContent" />
            <p>匯入本頁長度：${pageContent.length()} 字元</p>
        </c:catch>
        <c:if test="${not empty impEx}">
            <p style="color:red;">匯入失敗</p>
        </c:if>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：對外部 URL 保持編碼</div>
        <c:url value="https://search.example.com" var="extSearch">
            <c:param name="q" value="JSTL 教學" />
        </c:url>
        <p>外部查詢：<span class="code-block">${extSearch}</span></p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：URL 重寫包含 session ID (若需要)</div>
        <c:url value="/secure/profile" var="secureProfile" />
        <p>安全路徑：<span class="code-block">${secureProfile}</span> (若 cookie 禁用則附 jsessionid)</p>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：產生相對路徑</div>
        <c:url value="../jstl/forTokens" var="relUrl" />
        <p>相對路徑：${relUrl}</p>
        <a href="${relUrl}">前往 forTokens</a>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：處理中文參數自動編碼</div>
        <c:url value="/search" var="chineseUrl">
            <c:param name="keyword" value="保單查詢" />
        </c:url>
        <p>中文參數：<span class="code-block">${chineseUrl}</span></p>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：動態值來自變數</div>
        <c:set var="section" value="faq" />
        <c:url value="/help/${section}" var="dynSectionUrl" />
        <p>動態路徑：${dynSectionUrl}</p>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：與 HTML &lt;base&gt; 搭配</div>
        <c:url value="/" var="baseUrl" />
        <p>可設為 &lt;base href="${baseUrl}"&gt; 使所有相對路徑以此為準。</p>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：比較有無 c:url 的差異</div>
        <p>直接寫：<code>/css/main.css</code> 可能缺少 context path。</p>
        <p>c:url 處理：<span class="code-block"><c:url value="/css/main.css"/></span> (自動補上前綴)</p>
    </div>

</body>

</html>
