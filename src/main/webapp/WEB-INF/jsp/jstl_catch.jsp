<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:catch 範例</title>
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
        <div class="card-header">⚠️ 11. c:catch 例外捕捉</div>
        <c:catch var="ex">
            <% 
                // 故意製造錯誤
                int result = 10 / 0; 
            %>
        </c:catch>
        <c:if test="${not empty ex}">
            <div class="scope-item" style="border-left-color: #e74c3c; background: #fdf2f2;">
                <div class="scope-title" style="color: #c0392b;">發生錯誤 (Exception)</div>
                <div class="scope-value" style="color: #e74c3c;">${ex.message}</div>
            </div>
        </c:if>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:catch 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：捕捉 NullPointerException</div>
        <c:set var="nullObj" value="${null}" />
        <c:catch var="ex1">
            ${nullObj.someProperty}
        </c:catch>
        <c:if test="${not empty ex1}">
            <p>❌ 錯誤：<span class="code-block">${ex1.message}</span></p>
        </c:if>
        <c:if test="${empty ex1}">
            <p>✅ 沒有異常發生</p>
        </c:if>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：捕捉 NumberFormatException (Scriptlet)</div>
        <c:catch var="ex2">
            <% Integer.parseInt("不是數字"); %>
        </c:catch>
        <c:if test="${not empty ex2}">
            <p>❌ 解析失敗：<span class="code-block">${ex2.message}</span></p>
        </c:if>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：嵌套 c:catch – 內部捕捉更精細</div>
        <c:catch var="outerEx">
            <c:catch var="innerEx">
                <% int x = 1 / 0; %>
            </c:catch>
            <p>內部捕捉：${not empty innerEx ? innerEx.message : '無'}</p>
            <%-- 外部不會再捕捉，因為已被內部處理 --%>
        </c:catch>
        <p>外部捕捉：${not empty outerEx ? outerEx.message : '無 (內部已處理)'}</p>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：根據錯誤訊息顯示友善提示</div>
        <c:catch var="ex4">
            <% int[] arr = new int[1]; arr[5] = 10; %>
        </c:catch>
        <c:choose>
            <c:when test="${not empty ex4 && ex4.message.contains('Index')}">
                <p>⚠️ 索引超出範圍！</p>
            </c:when>
            <c:when test="${not empty ex4}">
                <p>⚠️ 其他錯誤：${ex4.message}</p>
            </c:when>
            <c:otherwise>
                <p>✅ 無錯誤</p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：迴圈中捕捉錯誤，略過壞資料</div>
        <c:set var="items" value="10,20,abc,30,40" />
        <c:forTokens items="${items}" delims="," var="item">
            <c:catch var="loopEx">
                <% int val = Integer.parseInt((String)pageContext.getAttribute("item")); %>
                <span>數值：<%= val %></span>
            </c:catch>
            <c:if test="${not empty loopEx}">
                <span style="color:red;">[略過無效：${item}]</span>
            </c:if>
            <br />
        </c:forTokens>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：捕捉 c:import 連線失敗</div>
        <c:catch var="ex6">
            <c:import url="http://不存在的網域.example.com" />
        </c:catch>
        <c:if test="${not empty ex6}">
            <p>❌ 匯入失敗：${ex6.message}</p>
        </c:if>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：捕捉 EL 方法調用異常 (模擬)</div>
        <c:set var="testStr" value="hello" />
        <c:catch var="ex7">
            <%-- 嘗試對字串呼叫不存在的方法會引發 EL 異常 --%>
            ${testStr.invalidMethod()}
        </c:catch>
        <c:if test="${not empty ex7}">
            <p>❌ EL 執行錯誤：${ex7.message}</p>
        </c:if>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：在自訂函式庫中使用 c:catch (模擬)</div>
        <p>假設呼叫一個可能拋錯的工具方法：</p>
        <c:catch var="ex8">
            <%-- 模擬：使用 if(true) 包裹 throw 以避免編譯器 Unreachable code 錯誤 --%>
            <% if (true) { throw new RuntimeException("自訂邏輯錯誤"); } %>
        </c:catch>
        <c:if test="${not empty ex8}">
            <p>❌ 捕捉到自訂錯誤：${ex8.message}</p>
        </c:if>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：捕捉並記錄（輸出至頁面當 log）</div>
        <c:catch var="ex9">
            <% int y = 100 / 0; %>
        </c:catch>
        <c:if test="${not empty ex9}">
            <%-- 使用 ['class'] 避免 EL 解析時將 class 視為保留關鍵字的錯誤 --%>
            <p>🪵 錯誤記錄：<span class="code-block">${ex9['class'].name}: ${ex9.message}</span></p>
        </c:if>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：多個 catch 配合條件顯示備援內容</div>
        <c:set var="result" value="" />
        <c:catch var="catchA">
            <%-- 嘗試第一種方式 --%>
            <% int a = 5 / 0; %>
        </c:catch>
        <c:if test="${not empty catchA}">
            <c:set var="result" value="方式 A 失敗" />
            <c:catch var="catchB">
                <%-- 嘗試備援方式 --%>
                <% int b = 10 / 2; %>
                <c:set var="result" value="方式 B 成功" />
            </c:catch>
        </c:if>
        <p>最終結果：${result}</p>
    </div>

</body>

</html>