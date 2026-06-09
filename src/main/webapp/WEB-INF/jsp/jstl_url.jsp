<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 2-3：URL 處理與資源匯入</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .code-block {
            background: #f4f4f4;
            padding: 10px;
            border-radius: 4px;
            font-family: monospace;
        }
    </style>
</head>

<body>
    <h1>🔗 URL 處理與資源匯入</h1>
    <p>學習重點：<code>&lt;c:url&gt;</code>, <code>&lt;c:param&gt;</code>, <code>&lt;c:import&gt;</code>。</p>

    <!-- URL 編碼與 Session 管理 -->
    <div class="card">
        <div class="card-header">🌐 1. 安全的超連結 (c:url + c:param)</div>
        <c:url var="secureLink" value="/learning/jsp/scopes">
            <c:param name="user" value="ADMIN" />
            <c:param name="session" value="${pageContext.session.id}" />
        </c:url>
        <table>
            <tr>
                <th>生成的連結</th>
                <td><a href="${secureLink}">${secureLink}</a></td>
            </tr>
            <tr>
                <th>原始 URL</th>
                <td><code>/learning/jsp/scopes</code></td>
            </tr>
            <tr>
                <th>參數</th>
                <td><code>user=ADMIN&session=...</code></td>
            </tr>
        </table>
        <small>c:url 會自動加上 context path 並進行 URL 編碼，還可選擇性附加 jsessionid。</small>
    </div>

    <!-- 匯入外部資源 -->
    <div class="card">
        <div class="card-header">📥 2. 資源匯入 (c:import)</div>
        <p>匯入本專案 <code>/docs/jstl.md</code> 的內容：</p>
        <div style="border:1px solid #ccc; padding:10px; background:#fafafa;">
            <c:import url="/docs/jstl.md" var="mdContent" />
            <pre><c:out value="${mdContent}" /></pre>
        </div>
        <small>也可匯入外部網站 (如 footer 片段)，但注意安全與效能。</small>
    </div>

    <!-- 練習：動態連結生成器 -->
    <div class="card">
        <div class="card-header">🧪 實作練習：建立課程連結列表</div>
        <p>使用 <code>c:forEach</code> 搭配 <code>c:url</code> 與 <code>c:param</code> 動態產生指向 Day 1 各主題的連結（帶有 referrer 參數）。
        </p>
        <c:set var="topics" value="${['lifecycle','scopes','el','scriptlet']}" />
        <ul>
            <c:forEach items="${topics}" var="topic">
                <c:url var="topicUrl" value="/learning/jsp/${topic}">
                    <c:param name="ref" value="jstl-url-lab" />
                </c:url>
                <li><a href="${topicUrl}">${topic}</a></li>
            </c:forEach>
        </ul>
    </div>
</body>

</html>