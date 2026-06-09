<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>Day 2: JSTL 全方位實戰教學</title>
    <style>
        .section { border: 1px solid #444; padding: 15px; margin: 10px 0; border-radius: 5px; }
        .highlight { background-color: #ffffcc; padding: 2px; }
        .error-box { border: 2px dashed red; background-color: #ffeeee; padding: 10px; }
        .even { background-color: #f9f9f9; }
        .status-on { color: green; font-weight: bold; }
        .status-off { color: gray; text-decoration: line-through; }
    </style>
</head>
<body>
    <h1>Day 2 JSTL 深度實踐課程</h1>

    <!-- 上午課程：核心邏輯與變數管理 -->
    <div class="section" style="background-color: #e3f2fd;">
        <h2>【上午】1. 變數與邏輯控制</h2>
        
        <h3>1.1 c:set 與 c:remove</h3>
        <c:set var="bonus" value="${accountBalance * 0.1}" scope="page" />
        <p>原始餘額: ${accountBalance}, 計算獎金 (10%): <span class="highlight">${bonus}</span></p>
        <c:remove var="bonus" scope="page" />
        <p>執行 c:remove 後的獎金: ${bonus} (應為空值)</p>

        <h3>1.2 c:catch (異常處理)</h3>
        <div class="error-box">
            <c:catch var="ex">
                <%-- 故意製造錯誤：除以零 --%>
                <% int x = 10 / 0; %>
            </c:catch>
            <c:if test="${not empty ex}">
                <p style="color:red;">補獲到頁面異常：${ex.message}</p>
            </c:if>
        </div>

        <h3>1.3 c:choose 多重判斷</h3>
        <p>用戶權限檢查：
            <c:choose>
                <c:when test="${userRole == 'ADMIN' && isLoggedIn}">
                    <span class="status-on">管理員模式 - 擁有完整權限</span>
                </c:when>
                <c:when test="${userRole == 'USER'}">
                    <span>一般用戶模式 - 僅限讀取</span>
                </c:when>
                <c:otherwise>
                    <span style="color:red;">訪客模式 - 請先登入</span>
                </c:otherwise>
            </c:choose>
        </p>
    </div>

    <!-- 下午課程：進階迭代與 URL 處理 -->
    <div class="section" style="background-color: #f1f8e9;">
        <h2>【下午】2. 進階迭代與資源管理</h2>

        <h3>2.1 c:forEach 進階用法 (Step & Range)</h3>
        <p>演示間隔取值 (每隔 2 個取一次成績):</p>
        <ul>
            <c:forEach items="${scoreList}" var="s" varStatus="st" begin="0" end="6" step="2">
                <li>索引 ${st.index}: 分數 = ${s}</li>
            </c:forEach>
        </ul>

        <h3>2.2 c:forTokens (解析字串)</h3>
        <p>保單標籤解析 (從 CSV 字串 "${csvTags}")：</p>
        <c:forTokens items="${csvTags}" delims="," var="tag">
            <button>${tag}</button>
        </c:forTokens>

        <h3>2.3 綜合應用：保單管理表格</h3>
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
                    <td><c:out value="${p.name}" /></td>
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

        <h3>2.4 c:url 與 c:param (安全性連結)</h3>
        <c:url var="secureLink" value="/learning/jsp/scopes">
            <c:param name="user" value="${userRole}" />
            <c:param name="session" value="${pageContext.session.id}" />
        </c:url>
        <p>生成的帶參數連結: <a href="${secureLink}">前往 Scopes 測試</a></p>
        <code>生成的 URL 為: ${secureLink}</code>
    </div>

    <div class="section">
        <h3>講師筆記</h3>
        <ul>
            <li>強調 <code>&lt;c:out&gt;</code> 的 XSS 防護作用。</li>
            <li>說明 <code>varStatus</code> 提供的 <code>first</code>, <code>last</code>, <code>index</code>, <code>count</code> 之差異。</li>
            <li>示範 <code>c:import</code> 可以抓取外部網站或本機片段 (如 Header/Footer)。</li>
        </ul>
    </div>
</body>
</html>