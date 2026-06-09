<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%!
    // JSP 生命週期：宣告實例變數與 jspInit、jspDestroy 方法
    private int visitCount = 0;

    public void jspInit() {
        // 容器載入 JSP 時執行初始化，僅一次
        ServletContext context = getServletConfig().getServletContext();
        context.log("lifecycle.jsp 初始化完成");
    }

    public void jspDestroy() {
        // 容器卸載 JSP 時執行
        ServletContext context = getServletConfig().getServletContext();
        context.log("lifecycle.jsp 即將銷毀");
    }
%>
<%
    // 每次請求進入 _jspService 時增加計數
    visitCount++;
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>生命週期與隱含物件練習</title>
</head>
<body>
    <h1>JSP 生命週期與隱含物件</h1>
    <p><strong>頁面訪問次數（實例變數）：</strong> <%= visitCount %></p>
    <p><strong>當前時間：</strong> <%= new Date() %></p>
    <hr/>
    <h2>常用隱含物件示範</h2>
    <ul>
        <li><strong>request.getRemoteAddr()：</strong> <%= request.getRemoteAddr() %></li>
        <li><strong>request.getHeader("User-Agent")：</strong> <%= request.getHeader("User-Agent") %></li>
        <li><strong>session.getId()：</strong> <%= session.getId() %></li>
        <li><strong>application.getServerInfo()：</strong> <%= application.getServerInfo() %></li>
        <li><strong>pageContext.getServletContext() 等同 application：</strong> <%= pageContext.getServletContext().getServerInfo() %></li>
    </ul>
    <p>說明：此頁面使用 Scriptlet 示範生命週期中的 jspInit（查看伺服器日誌）及每次請求增加的計數器，並直接輸出 request、session、application、pageContext 等隱含物件。</p>
</body>
</html>