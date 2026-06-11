<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 設定錯誤處理頁面 --%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 2-0: Scriptlet 轉 JSTL 實戰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .old-school {
            border-left: 5px solid #e74c3c;
            background: #fdf2f2;
        }

        .new-school {
            border-left: 5px solid #2ecc71;
            background: #f2fdf5;
        }

        .adv-box {
            border-left: 5px solid #3498db;
            background: #ebf5fb;
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

        .debug-info {
            color: #2980b9;
            font-weight: bold;
            border: 1px dashed #3498db;
            padding: 5px;
        }
    </style>
</head>

<%!
    // 1. Declaration (宣告): Servlet 的成員變數
    private int globalAccessCount = 0;
%>

<%
    // 2. Logic (邏輯): 雖然改用 JSTL，但某些 Response 控制仍須在此處理
    globalAccessCount++;
    pageContext.setAttribute("globalAccessCount", globalAccessCount);
    
    // 處理 formatMessage 邏輯並放入 Scope
    String welcomeMsg = "系統提示: 歡迎 管理員 進入 JSTL 優化版控制台";
    pageContext.setAttribute("welcomeMsg", welcomeMsg);
    
    // --- 進階操作範例：Header 控制 ---
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("X-Powered-By", "JSP-JSTL-Modern");

    // --- 故意觸發錯誤演示 ---
    if ("trigger".equals(request.getParameter("error"))) {
        throw new RuntimeException("這是由學員手動觸發的 Scriptlet 異常！");
    }

    // 設定預設值 (JSTL 可用 c:set)
    if (request.getAttribute("serverTag") == null) {
        request.setAttribute("serverTag", "Unknown");
    }
%>

<body>
    <div class="card">
        <div class="card-header">🏷️ JSP 三大標籤與 JSTL 演示</div>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">Expression Language (EL)</div>
                <div class="scope-value">${welcomeMsg}</div>
                <small>用於直接輸出屬性值 (取代 <%= "<%= ... %" + ">" %>)</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Declaration (保留)</div>
                <div class="scope-value">累計造訪: ${globalAccessCount}</div>
                <small>JSTL 無法完全取代成員變數定義</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">JSTL Core Tags</div>
                <div class="scope-value">&lt;c:forEach&gt; &lt;c:if&gt;</div>
                <small>取代傳統 Scriptlet 的 Java 邏輯</small>
            </div>
        </div>
    </div>

    <div class="card adv-box">
        <div class="card-header" style="color: #2980b9;">🚀 進階操作：JSTL 與 Session</div>
        <p>不再使用 <code>out.println</code>，改用標籤輸出：</p>
        <div class='debug-info'>透過 EL 輸出的 Session ID: ${sessionScope['javax.servlet.http.HttpSession'].id == null ?
            pageContext.session.id : sessionScope['javax.servlet.http.HttpSession'].id}</div>

        <p style="margin-top:10px;">
            <a href="?role=ADMIN" class="badge" style="background:#3498db">模擬管理員登入 (Forward)</a>
            <a href="?error=trigger" class="badge" style="background:#e67e22">點我故意觸發錯誤 (errorPage)</a>
        </p>
    </div>

    <div class="card old-school">
        <div class="card-header" style="color: #c0392b;">🍝 改進後的表格渲染 (JSTL c:forEach)</div>
        <table>
            <thead>
                <tr>
                    <th>編號</th>
                    <th>客戶姓名</th>
                    <th>保單狀態</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td><span class="code-block">${u.id}</span></td>
                        <td>${u.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${u.status == '已繳費'}">
                                    <span class="badge" style="background:#2ecc71">正常</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge" style="background:#e74c3c">${u.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty users}">
                    <tr>
                        <td colspan="3">尚無資料</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <div class="card new-school">
        <div class="card-header" style="color: #27ae60;">💡 使用 JSTL 的好處</div>
        <ol>
            <li><strong>易於閱讀</strong>：HTML 與 XML 標籤風格一致。</li>
            <li><strong>自動轉型</strong>：EL 會自動處理物件類型，不需手動強轉 <code>(List)</code>。</li>
            <li><strong>防禦性強</strong>：EL 自動處理 <code>null</code>，不會噴 NullPointerException。</li>
            <li><strong>邏輯分離</strong>：強迫開發者減少在 JSP 撰寫複雜 Java 邏輯。</li>
        </ol>
    </div>

    <div style="text-align: center; color: #95a5a6; font-size: 0.8rem;">
        伺服器標籤：${serverTag} | 編譯時間：
        <jsp:useBean id="now" class="java.util.Date" /> ${now}
    </div>

    <!-- ========== 10 個 Scriptlet 物件清單練習 改寫為 JSTL ========== -->
    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 JSTL 練習 (Policy & Customer)</h2>

    <%-- 練習 1：基本 for 迴圈輸出保單清單 --%>
    <div class="card old-school">
        <div class="card-header">練習 1：使用 c:forEach 輸出保單</div>
        <table>
            <tr>
                <th>保單號碼</th>
                <th>險種</th>
                <th>保額</th>
            </tr>
            <c:forEach items="${policies}" var="p">
                <tr>
                    <td>${p.policyNumber}</td>
                    <td>${p.type}</td>
                    <td>${p.sumInsured}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%-- 練習 2：條件顯示 (高保額紅字) --%>
    <div class="card old-school">
        <div class="card-header">練習 2：使用 c:choose 處理高保額 (>100萬)</div>
        <ul>
            <c:forEach items="${policies}" var="p">
                <c:choose>
                    <c:when test="${p.sumInsured > 1000000}">
                        <li style="color:red;"><strong>${p.policyNumber}</strong> - ${p.type}：${p.sumInsured} 元 (高保額)
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>${p.policyNumber} - ${p.type}：${p.sumInsured} 元</li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </div>

    <%-- 練習 3：使用 varStatus 迭代序號 --%>
    <div class="card old-school">
        <div class="card-header">練習 3：使用 varStatus.count 顯示序號</div>
        <table>
            <tr>
                <th>序號</th>
                <th>險種</th>
            </tr>
            <c:forEach items="${policies}" var="p" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${p.type} (${p.policyNumber})</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%-- 練習 4：JSTL 處理陣列 (JSTL 對 Collection 與 Array 處理方式一致) --%>
    <div class="card old-school">
        <div class="card-header">練習 4：JSTL 遍歷陣列/集合</div>
        <ul>
            <c:forEach items="${policies}" var="p" varStatus="vs">
                <li>第 ${vs.count} 筆：${p.policyNumber} - 保額 ${p.sumInsured}</li>
            </c:forEach>
        </ul>
    </div>

    <%-- 練習 5：JSTL 變數累加計算總額 --%>
    <div class="card old-school">
        <div class="card-header">練習 5：用 c:set 累加總保額</div>
        <c:set var="totalSum" value="0" />
        <c:forEach items="${policies}" var="p">
            <c:set var="totalSum" value="${totalSum + p.sumInsured}" />
        </c:forEach>
        <p>總保額：<strong style="font-size:1.5rem; color:#d63384;">${totalSum}</strong> 元</p>
    </div>

    <%-- 練習 6：c:set 設定暫存物件 --%>
    <div class="card old-school">
        <div class="card-header">練習 6：使用 c:set 暫存第一筆保單</div>
        <c:set var="featured" value="${policies[0]}" scope="page" />
        <p>精選保單：
            <c:if test="${not empty featured}">
                ${featured.policyNumber} - ${featured.type} (保額：${featured.sumInsured})
            </c:if>
            <c:if test="${empty featured}">無精選保單</c:if>
        </p>
    </div>

    <%-- 練習 7：空清單處理 --%>
    <div class="card old-school">
        <div class="card-header">練習 7：處理空清單 (c:if empty)</div>
        <c:if test="${empty emptyList}">
            <p style="color:#e67e22;">⚠️ 目前沒有任何保單資料。</p>
        </c:if>
        <c:forEach items="${emptyList}" var="p">
            ${p.policyNumber}
        </c:forEach>
    </div>

    <%-- 練習 8：動態奇偶行樣式 --%>
    <div class="card old-school">
        <div class="card-header">練習 8：動態表格行樣式 (varStatus.index)</div>
        <table>
            <tr>
                <th>姓名</th>
                <th>年齡</th>
                <th>年繳保費</th>
            </tr>
            <c:forEach items="${customers}" var="c" varStatus="vs">
                <tr style="background:${vs.index % 2 == 0 ? '#ffffff' : '#f2f2f2'};">
                    <td>${c.name}</td>
                    <td>${c.age}</td>
                    <td>
                        <fmt:formatNumber value="${c.premium}" pattern="#,###" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%-- 練習 9：結構化標籤取代 out.println --%>
    <div class="card old-school">
        <div class="card-header">練習 9：使用結構標籤取代 out.println</div>
        <c:if test="${not empty customers}">
            <table>
                <tr>
                    <th>姓名</th>
                    <th>保費級距</th>
                </tr>
                <c:forEach items="${customers}" var="c">
                    <tr>
                        <td>${c.name}</td>
                        <td>${c.premium > 30000 ? '高保費' : '一般'}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <%-- 練習 10：參數過濾物件清單 --%>
    <div class="card old-school">
        <div class="card-header">練習 10：使用 EL param 過濾保單</div>
        <p>目前參數：${not empty param.type ? param.type : '無'}</p>
        <c:forEach items="${policies}" var="p">
            <c:if test="${empty param.type or param.type == p.type}">
                <div>${p.policyNumber} - ${p.type} (保額：${p.sumInsured})</div>
            </c:if>
        </c:forEach>
        <p style="margin-top:10px;">
            試試：<a href="?type=壽險">?type=壽險</a> |
            <a href="?type=意外險">?type=意外險</a> |
            <a href="?">清除過濾</a>
        </p>
    </div>

</body>

</html>