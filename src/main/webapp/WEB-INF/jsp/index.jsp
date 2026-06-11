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
    <aside class="sidebar" id="sidebar">
      <h2 onclick="window.location.href='${pageContext.request.contextPath}/'">課程目錄</h2>
      <nav>
        <h3 onclick="toggleMenu(this)">Day 1：基礎與作用域</h3>
        <ul>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/lifecycle')">1. 生命週期</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scopes')">2. 四大作用域</a></li>
          <li><a href="javascript:void(0)" onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/el')">3.
              EL 表達式</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scriptlet')">4. Scriptlet
              傳統語法實戰</a></li>
        </ul>

        <h3 onclick="toggleMenu(this)">Day 2：JSTL 核心標籤</h3>
        <ul id="jstl-menu">
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/scriptlet-jstl')">0.
              傳統語法實戰(JSTL 版本)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/forEach')">1. c:forEach (迭代)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/if')">2. c:if (條件)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/choose')">3. c:choose (多重)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/out')">4. c:out (安全輸出)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/set')">5. c:set (變數設定)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/url')">6. c:url (路徑處理)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/param')">7. c:param (參數)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/remove')">8. c:remove (移除)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/import')">9. c:import (資源引入)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/redirect')">10. c:redirect
              (導向)</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/catch')">11. c:catch (異常捕捉)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/forTokens')">12. c:forTokens
              (分割)</a></li>
        </ul>

        <h3 onclick="toggleMenu(this)" class="collapsed">進階整合</h3>
        <ul class="collapsed">
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/learning/jsp/jstl/ajax')">AJAX 整合實戰</a></li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/customer')">客戶查詢結果分頁實戰(使用JSTL)</a>
          </li>
          <li><a href="javascript:void(0)"
              onclick="loadCourse('${pageContext.request.contextPath}/jasperReport')">報表</a></li>
        </ul>
      </nav>
    </aside>

    <main class="content-area">
      <button class="toggle-btn" onclick="toggleSidebar()">☰ 選單</button>
      <iframe id="courseFrame" src="${pageContext.request.contextPath}/welcome" title="課程內容"></iframe>
    </main>
  </div>

  <script>
    function loadCourse(url) {
      document.getElementById('courseFrame').src = url;
    }

    function toggleMenu(header) {
      header.classList.toggle('collapsed');
      const menu = header.nextElementSibling;
      menu.classList.toggle('collapsed');
    }

    function toggleSidebar() {
      const sidebar = document.getElementById('sidebar');
      sidebar.classList.toggle('collapsed');
    }
  </script>
</body>

</html>