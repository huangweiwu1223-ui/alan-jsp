<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 2-2：進階迭代與狀態處理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .even {
            background-color: #f9f9f9;
        }

        .status-on {
            color: green;
            font-weight: bold;
        }

        .status-off {
            color: gray;
            text-decoration: line-through;
        }

        .highlight {
            background-color: #ffffcc;
        }
    </style>
</head>

<body>
    <h1>🔄 JSTL 進階迭代</h1>
    <p>學習重點：<code>c:forEach</code> 的 <code>begin</code>, <code>end</code>, <code>step</code> 與 <code>varStatus</code>，以及
        <code>c:forTokens</code>。</p>

    <!-- Step & Range -->
    <div class="card">
        <div class="card-header">📏 1. 間隔迭代 (Step & Range)</div>
        <p>從成績清單中每隔 2 個取一次：</p>
        <ul>
            <c:forEach items="${scoreList}" var="s" varStatus="st" begin="0" end="6" step="2">
                <li>索引 ${st.index}：分數 = <strong>${s}</strong></li>
            </c:forEach>
        </ul>
    </div>

    <!-- forTokens -->
    <div class="card">
        <div class="card-header">🔤 2. 字串解析 (c:forTokens)</div>
        <p>將 CSV 標籤 "${csvTags}" 解析為按鈕：</p>
        <c:forTokens items="${csvTags}" delims="," var="tag">
            <button>${tag}</button>
        </c:forTokens>
    </div>

    <!-- 綜合表格與 varStatus -->
    <div class="card">
        <div class="card-header">📋 3. 保單管理綜合表格</div>
        <table border="1" style="width:100%; border-collapse:collapse;">
            <tr style="background-color: #eee;">
                <th>No.</th>
                <th>名稱</th>
                <th>價格</th>
                <th>類型</th>
                <th>狀態</th>
            </tr>
            <c:forEach items="${advList}" var="p" varStatus="st">
                <tr class="${st.count % 2 == 0 ? 'even' : ''}">
                    <td>${st.count}</td>
                    <td>
                        <c:out value="${p.name}" />
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${p.price > 10000}"><strong>💎 高階 (${p.price})</strong></c:when>
                            <c:otherwise>${p.price}</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${p.price < 1000}">小額保單</c:if>
                        <c:if test="${p.price >= 1000}">常規保單</c:if>
                    </td>
                    <td class="${p.active ? 'status-on' : 'status-off'}">
                        ${p.active ? '有效' : '已停用'}
                    </td>
                </tr>
            </c:forEach>
        </table>
        <small>
            <code>varStatus</code> 提供：<code>index</code>, <code>count</code>, <code>first</code>, <code>last</code>。
            此表格使用 <code>st.count % 2</code> 實現斑馬紋。
        </small>
    </div>

    <!-- 練習：產生數字序列 -->
    <div class="card">
        <div class="card-header">🧪 實作練習：1~100 數字列表</div>
        <p>使用 <code>&lt;c:forEach begin="1" end="100"&gt;</code> 顯示 1~100，並將奇數列標示為黃底。</p>
        <div style="display: flex; flex-wrap: wrap; gap: 4px;">
            <c:forEach begin="1" end="100" var="num">
                <span class="${num % 2 == 1 ? 'highlight' : ''}" style="padding:2px 5px; border:1px solid #ccc;">
                    ${num}
                </span>
            </c:forEach>
        </div>
    </div>
</body>

</html>