<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>c:forTokens 範例</title>
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
        .badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 4px;
            color: white;
            background: #3498db;
            margin: 2px;
        }
    </style>
</head>

<body>
    <div class="card">
        <div class="card-header">✂️ 12. c:forTokens 字串分割</div>
        <p>原始字串: <span class="token">${csvTags}</span></p>
        <div style="display: flex; gap: 10px; margin-top: 10px; flex-wrap: wrap;">
            <c:forTokens items="${csvTags}" delims="," var="tag">
                <span class="badge" style="background: #3498db; padding: 5px 12px;">${tag}</span>
            </c:forTokens>
        </div>
    </div>

    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 c:forTokens 進階練習</h2>

    <!-- 練習 1 -->
    <div class="card old-school">
        <div class="card-header">練習 1：使用分號 (;) 分隔</div>
        <c:set var="semicolonStr" value="蘋果;香蕉;橘子" />
        <c:forTokens items="${semicolonStr}" delims=";" var="fruit">
            <span class="badge">${fruit}</span>
        </c:forTokens>
    </div>

    <!-- 練習 2 -->
    <div class="card old-school">
        <div class="card-header">練習 2：多個分隔符號 (逗號和分號)</div>
        <c:set var="mixedStr" value="壽險,醫療;意外,儲蓄" />
        <c:forTokens items="${mixedStr}" delims=",;" var="item">
            <span class="badge" style="background:#e67e22;">${item}</span>
        </c:forTokens>
    </div>

    <!-- 練習 3 -->
    <div class="card old-school">
        <div class="card-header">練習 3：空字串處理 (無輸出)</div>
        <c:set var="emptyStr" value="" />
        <c:forTokens items="${emptyStr}" delims="," var="token">
            <span>${token}</span>
        </c:forTokens>
        <p>✅ 空字串無 token，無輸出</p>
    </div>

    <!-- 練習 4 -->
    <div class="card old-school">
        <div class="card-header">練習 4：只有分隔符的字串</div>
        <c:set var="delimOnly" value=",,," />
        <c:forTokens items="${delimOnly}" delims="," var="tok">
            <span class="badge" style="background:#95a5a6;">空 token</span>
        </c:forTokens>
        <p>（注意：連續分隔符不產生 token，forTokens 會跳過空 token）</p>
    </div>

    <!-- 練習 5 -->
    <div class="card old-school">
        <div class="card-header">練習 5：搭配 varStatus 輸出索引</div>
        <c:set var="colors" value="紅,橙,黃,綠,藍" />
        <c:forTokens items="${colors}" delims="," var="color" varStatus="vs">
            <p>${vs.count}. ${color}</p>
        </c:forTokens>
    </div>

    <!-- 練習 6 -->
    <div class="card old-school">
        <div class="card-header">練習 6：在 tokens 中過濾特定值</div>
        <c:set var="numbers" value="1,2,3,4,5,6,7" />
        <c:forTokens items="${numbers}" delims="," var="num">
            <c:if test="${num % 2 == 0}">
                <span class="badge" style="background:#2ecc71;">${num}</span>
            </c:if>
        </c:forTokens>
        <p>只顯示偶數</p>
    </div>

    <!-- 練習 7 -->
    <div class="card old-school">
        <div class="card-header">練習 7：動態分隔符來自變數</div>
        <c:set var="dynDelim" value="|" />
        <c:set var="pipeStr" value="臺灣|日本|韓國" />
        <c:forTokens items="${pipeStr}" delims="${dynDelim}" var="country">
            <span class="badge" style="background:#9b59b6;">${country}</span>
        </c:forTokens>
    </div>

    <!-- 練習 8 -->
    <div class="card old-school">
        <div class="card-header">練習 8：分割空白分隔的字串</div>
        <c:set var="spaceStr" value="Spring Boot JSTL" />
        <c:forTokens items="${spaceStr}" delims=" " var="word">
            <span class="badge" style="background:#1abc9c;">${word}</span>
        </c:forTokens>
    </div>

    <!-- 練習 9 -->
    <div class="card old-school">
        <div class="card-header">練習 9：分割後建構 HTML 列表</div>
        <c:set var="techs" value="HTML,CSS,JavaScript,Java,JSP" />
        <ul>
            <c:forTokens items="${techs}" delims="," var="tech">
                <li>${tech}</li>
            </c:forTokens>
        </ul>
    </div>

    <!-- 練習 10 -->
    <div class="card old-school">
        <div class="card-header">練習 10：與 c:choose 搭配顯示不同樣式</div>
        <c:set var="statusStr" value="active,inactive,pending,active" />
        <c:forTokens items="${statusStr}" delims="," var="st">
            <c:choose>
                <c:when test="${st == 'active'}">
                    <span class="badge" style="background:#2ecc71;">${st}</span>
                </c:when>
                <c:otherwise>
                    <span class="badge" style="background:#e74c3c;">${st}</span>
                </c:otherwise>
            </c:choose>
        </c:forTokens>
    </div>

</body>

</html>
