<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
  <meta charset="UTF-8">
  <title>JSP 兩日實戰教學 - 首頁</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
  <style>
    .sidebar h2 {
      cursor: pointer;
    }
  </style>
</head>

<body>
  <div class="layout-container">
    <!-- 左側選單 -->
    <aside class="sidebar">
      <h2 onclick="window.location.href='${pageContext.request.contextPath}/'">課程目錄</h2>
      <nav>
        <h3>Day 1：核心基礎與作用域</h3>
        <ul>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/lifecycle')">JSP
              生命週期與隱含物件</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scopes')">四大作用域</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/el')">EL
              (Expression Language，表達式語言)</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scriptlet')">Scriptlet
              傳統語法實戰</a></li>
        </ul>
        <h3>Day 2：進階邏輯、標籤庫與 AJAX</h3>
        <ul>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/core')">1.
              核心標籤入門</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/iteration')">2.
              進階迭代與狀態處理</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/url')">3. URL
              處理與資源匯入</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/ajax')">4. AJAX
              整合實戰</a></li>
        </ul>
      </nav>
    </aside>

    <!-- 右側內容區域 (iframe) -->
    <main class="content-area">
      <iframe id="courseFrame" src="${pageContext.request.contextPath}/welcome" title="課程內容"></iframe>
    </main>
  </div>

  <script>
    function loadCourse(url) {
      document.getElementById('courseFrame').src = url;
    }
  </script>
</body>

</html>