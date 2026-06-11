<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:remove 範例</title>
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
        <div class="card-header">🗑️ 8. c:remove 移除變數</div>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">移除前</div>
                <div class="scope-value">${tempMsg}</div>
            </div>
            <c:remove var="tempMsg" />
            <div class="scope-item" style="border-left-color: #e74c3c;">
                <div class="scope-title">移除後</div>
                <div class="scope-value">${empty tempMsg ? '(已清空)' : tempMsg}</div>
            </div>
        </div>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:remove 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：移除 page scope 變數</div>
        <c:set var="pageVar" value="只存在 page" scope="page" />
        <p>移除前：${pageVar}</p>
        <c:remove var="pageVar" scope="page" />
        <p>移除後：${empty pageVar ? '(已清除)' : pageVar}</p>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：移除 request scope 變數</div>
        <% request.setAttribute("reqData", "請求範圍"); %>
        <p>移除前：${reqData}</p>
        <c:remove var="reqData" scope="request" />
        <p>移除後：${empty reqData ? '(已清除)' : reqData}</p>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：移除 session scope 變數</div>
        <c:set var="sessionMsg" value="登入訊息" scope="session" />
        <p>移除前：${sessionMsg}</p>
        <c:remove var="sessionMsg" scope="session" />
        <p>移除後：${empty sessionMsg ? '(已清除)' : sessionMsg}</p>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：移除 application scope 變數</div>
        <c:set var="appConfig" value="全域設定" scope="application" />
        <p>移除前：${appConfig}</p>
        <c:remove var="appConfig" scope="application" />
        <p>移除後：${empty appConfig ? '(已清除)' : appConfig}</p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：移除不存在的變數 (無作用)</div>
        <c:remove var="nonExist" />
        <p>嘗試移除不存在變數，不報錯。目前狀態：${empty nonExist ? '原本就空' : '仍存在'}</p>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：移除後再次移除 (無影響)</div>
        <c:set var="temp" value="暫時" scope="page" />
        <c:remove var="temp" />
        <c:remove var="temp" />
        <p>雙重移除後：${empty temp ? '空' : temp}</p>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：不同 scope 同名變數的影響</div>
        <c:set var="sameName" value="page value" scope="page" />
        <c:set var="sameName" value="request value" scope="request" />
        <p>page: ${pageScope.sameName}, request: ${requestScope.sameName}</p>
        <c:remove var="sameName" scope="page" />
        <p>移除 page 後：page: ${pageScope.sameName}, request: ${requestScope.sameName}</p>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：移除物件屬性的特定鍵 (使用 target)</div>
        <jsp:useBean id="person" class="java.util.HashMap" scope="page"/>
        <c:set target="${person}" property="name" value="Alan" />
        <p>移除前：${person.name}</p>
        <c:remove var="name" scope="page" /> <%-- 這不會移除 map 的 key，需用 c:set 設 null --%>
        <p>注意：c:remove 無法移除 map 元素，但可移除該 scope 變數。</p>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：迴圈後清理暫時變數</div>
        <c:forEach var="i" begin="1" end="3">
            <c:set var="loopData" value="資料${i}" />
            <span>${loopData} </span>
        </c:forEach>
        <c:remove var="loopData" />
        <p>迴圈結束後清除 loopData：${empty loopData ? '已清除' : loopData}</p>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：模擬快取清除機制</div>
        <c:set var="cache" value="快取資料" scope="session" />
        <p>目前快取：${cache}</p>
        <c:if test="${param.clear == '1'}">
            <c:remove var="cache" scope="session" />
            <p style="color:green;">快取已清除</p>
        </c:if>
        <a href="?clear=1">清除快取</a>
    </div>

</body>

</html>
