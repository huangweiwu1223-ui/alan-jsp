<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:set 範例</title>
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
        <div class="card-header">📥 5. c:set 變數設定</div>
        <c:set var="bonus" value="500" scope="page" />
        <div class="scope-item">
            <div class="scope-title">PAGE SCOPE VARIABLE</div>
            <div class="scope-value">Bonus: ${bonus}</div>
            <small>使用 <code>&lt;c:set&gt;</code> 動態建立的變數</small>
        </div>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:set 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：設定不同 scope</div>
        <c:set var="reqMsg" value="請求範圍" scope="request" />
        <c:set var="sessMsg" value="會話範圍" scope="session" />
        <p>request: ${reqMsg}, session: ${sessMsg}</p>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：設定複雜物件屬性 (Map)</div>
        <jsp:useBean id="product" class="java.util.HashMap" scope="page" />
        <c:set target="${product}" property="name" value="壽險A" />
        <c:set target="${product}" property="price" value="5000" />
        <p>產品名稱：${product.name}, 價格：${product.price}</p>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：設定變數值為 EL 表達式結果</div>
        <c:set var="total" value="${5000 + 12000}" />
        <p>總和：${total}</p>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：設定變數為 null</div>
        <c:set var="emptyVar" value="${null}" />
        <p>值是否為空：${empty emptyVar}</p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：修改 Map 元素 (target + property)</div>
        <c:set target="${product}" property="price" value="6000" />
        <p>更新後價格：${product.price}</p>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：使用 c:set 設定 JavaBean 屬性</div>
        <jsp:useBean id="now" class="java.util.Date" />
        <c:set target="${now}" property="time" value="0" />
        <p>Date 設為 epoch：${now}</p>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：在迴圈中累加變數</div>
        <c:set var="sum" value="0" />
        <c:forEach var="n" begin="1" end="5">
            <c:set var="sum" value="${sum + n}" />
        </c:forEach>
        <p>1 到 5 總和：${sum}</p>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：設定布林值並用於條件</div>
        <c:set var="isEligible" value="${product.price > 4000}" />
        <p>保費 &gt; 4000？ ${isEligible ? '是' : '否'}</p>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：設定陣列/List (透過 scriptlet 輔助)</div>
        <%
            java.util.List<String> colors = java.util.Arrays.asList("紅","綠","藍");
            pageContext.setAttribute("colorList", colors);
        %>
        <c:forEach items="${colorList}" var="c">
            <span class="code-block">${c}</span>
        </c:forEach>
        <p><small>註：c:set 無法直接建構 List，可結合 scriptlet 或 Controller 傳入。</small></p>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：設定預設值（若變數不存在）</div>
        <c:if test="${empty themeColor}">
            <c:set var="themeColor" value="blue" />
        </c:if>
        <p>主題色：${themeColor}</p>
        <p>若原本無值，已設為 blue。</p>
    </div>

</body>

</html>