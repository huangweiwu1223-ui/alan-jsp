<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%!
    // JSP 生命週期：宣告實例變數 (Thread Safety 演示點)
    private int instanceVisitCount = 0;

    public void jspInit() {
        ServletContext context = getServletConfig().getServletContext();
        context.log("DEBUG: [Lifecycle] jspInit() 被調用 - JSP 已初始化");
        // 初始化全域計數器
        if (context.getAttribute("globalCount") == null) {
            context.setAttribute("globalCount", 0);
        }
    }

    public void jspDestroy() {
        ServletContext context = getServletConfig().getServletContext();
        context.log("DEBUG: [Lifecycle] jspDestroy() 被調用 - JSP 已銷毀");
    }
%>
<%
    // 每次請求進入 _jspService
    instanceVisitCount++;
    
    // 處理全域計數 (Application Scope)
    Integer globalCount = (Integer) application.getAttribute("globalCount");
    application.setAttribute("globalCount", (globalCount == null ? 1 : globalCount + 1));
    
    // 取得當前使用者 (Session Scope)
    String user = (String) session.getAttribute("currentUser");
    if (user == null) user = "訪客";
%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>JSP 生命週期與隱含物件實戰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
</head>

<body>
    <div class="card">
        <div class="card-header">📊 即時儀表板：四大作用域觀測</div>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">Instance (Servlet)</div>
                <div class="scope-value"><%= instanceVisitCount %> 次</div>
                <small>實例變數，重啟消失</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Application (Global)</div>
                <div class="scope-value">${applicationScope.globalCount} 次</div>
                <small>所有使用者共享</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Session (User)</div>
                <div class="scope-value"><%= user %></div>
                <small>特定瀏覽器會話</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Request</div>
                <div class="scope-value">${pageContext.request.method}</div>
                <small>當前請求模式</small>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">🔐 身分管理 (Session & Request 實作)</div>
        <p>輸入名稱以模擬登入，這將資料存入伺服器端 Session 中：</p>
        <form action="${pageContext.request.contextPath}/learning/jsp/lifecycle/login" method="POST">
            <input type="text" name="username" placeholder="請輸入使用者名稱" required>
            <button type="submit">設定身分</button>
            <button type="button" class="secondary"
                onclick="location.href='${pageContext.request.contextPath}/learning/jsp/lifecycle/logout'">清除登入</button>
        </form>
    </div>

    <div class="card">
        <div class="card-header">🔍 隱含物件細節瀏覽器</div>
        <table>
            <thead>
                <tr>
                    <th>物件類型</th>
                    <th>屬性名稱</th>
                    <th>取得內容</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><span class="badge">Request</span></td>
                    <td>Remote Addr</td>
                    <td><%= request.getRemoteAddr() %></td>
                </tr>
                <tr>
                    <td><span class="badge">Request</span></td>
                    <td>User-Agent</td>
                    <td><%= request.getHeader("User-Agent") %></td>
                </tr>
                <tr>
                    <td><span class="badge" style="background:#2ecc71">Session</span></td>
                    <td>Session ID</td>
                    <td><code><%= session.getId() %></code></td>
                </tr>
                <tr>
                    <td><span class="badge" style="background:#f1c40f">Application</span></td>
                    <td>Server Info</td>
                    <td><%= application.getServerInfo() %></td>
                </tr>
                <tr>
                    <td><span class="badge" style="background:#9b59b6">PageContext</span></td>
                    <td>Config</td>
                    <td><%= pageContext.getServletConfig().getServletName() %></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div style="font-size: 0.8rem; color: #95a5a6; text-align: center;">
        伺服器當前時間：<%= new java.util.Date() %> | 頁面編譯模式：Servlet 4.0 (Jakarta EE)
    </div>

</body>

</html>