<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
  <meta charset="UTF-8">
  <title>JSP 兩日實戰教學 - 首頁</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>
  <div class="layout-container">
    <!-- 左側選單 -->
    <aside class="sidebar">
      <h2>課程目錄</h2>
      <nav>
        <h3>Day 1：核心基礎與作用域</h3>
        <ul>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/lifecycle')">JSP
              生命週期與隱含物件</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scopes')">四大作用域</a></li>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scriptlet')">從 Scriptlet
              到 EL</a></li>
        </ul>
        <h3>Day 2：進階邏輯、標籤庫與 AJAX</h3>
        <ul>
          <li><a href="#" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl')">JSTL
              核心標籤庫深度實踐</a></li>
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