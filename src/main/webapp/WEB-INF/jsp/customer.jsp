<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="common/header.jsp" />

<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>客戶資料管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .pagination-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 5px;
        }

        .page-link {
            padding: 5px 12px;
            border: 1px solid #3498db;
            text-decoration: none;
            color: #3498db;
            border-radius: 4px;
        }

        .page-link.active {
            background-color: #3498db;
            color: white;
        }

        .page-link.disabled {
            color: #ccc;
            border-color: #eee;
            pointer-events: none;
        }

        .search-info {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

    <!-- 查詢條件卡片 -->
    <div class="card">
        <div class="card-header">🔍 客戶查詢條件</div>
        <form action="${pageContext.request.contextPath}/customer" method="get">
            <input type="text" name="name" placeholder="請輸入客戶名稱..." value="<c:out value='${searchName}'/>">
            <button type="submit">搜尋</button>
            <button type="button" class="secondary"
                onclick="location.href='${pageContext.request.contextPath}/customer'">重置</button>
        </form>
    </div>

    <!-- 查詢結果卡片 -->
    <div class="card">
        <div class="card-header">📋 查詢結果清單</div>

        <div class="search-info">
            <c:set var="infoText" value="找到 ${totalRecords} 筆資料，目前顯示第 ${currentPage} / ${totalPages} 頁" />
            <c:out value="${infoText}" />
        </div>

        <table id="queryResult">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>年齡</th>
                    <th>性別</th>
                    <th>電子郵件</th>
                    <th>電話</th>
                    <th>保費</th>
                    <th>職業</th>
                    <th>婚姻狀況</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty customers}">
                        <c:forEach var="cust" items="${customers}">
                            <tr>
                                <td>${cust.id}</td>
                                <td><strong>
                                        <c:out value="${cust.name}" />
                                    </strong></td>
                                <td>${cust.age}</td>
                                <td>
                                    <c:if test="${cust.gender == 'Male'}"><span class="badge"
                                            style="background:#3498db">男</span></c:if>
                                    <c:if test="${cust.gender == 'Female'}"><span class="badge"
                                            style="background:#e74c3c">女</span></c:if>
                                    <c:if test="${cust.gender != 'M' && cust.gender != 'F'}">${cust.gender}</c:if>
                                </td>
                                <td>
                                    <c:out value="${cust.email}" />
                                </td>
                                <td>${cust.phone}</td>
                                <td>
                                    <fmt:formatNumber value="${cust.premium}" type="currency" currencySymbol="$" />
                                </td>
                                <td>
                                    <c:out value="${cust.occupation}" />
                                </td>
                                <td>
                                    <c:out value="${cust.maritalStatus}" />
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="9" style="text-align: center; color: #999;">查無符合條件的客戶資料</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>

        <!-- 分頁器 -->
        <div class="pagination-container">
            <!-- 第一頁 -->
            <a href="?name=${searchName}&page=1" class="page-link ${currentPage == 1 ? 'disabled' : ''}">首頁</a>

            <!-- 上一頁 -->
            <c:if test="${currentPage > 1}">
                <a href="?name=${searchName}&page=${currentPage - 1}" class="page-link">上一頁</a>
            </c:if>

            <!-- 頁碼顯示 (簡單呈現當前頁) -->
            <span class="page-link active">${currentPage}</span>

            <!-- 下一頁 -->
            <c:if test="${currentPage < totalPages}">
                <a href="?name=${searchName}&page=${currentPage + 1}" class="page-link">下一頁</a>
            </c:if>

            <!-- 最後一頁 -->
            <a href="?name=${searchName}&page=${totalPages}"
                class="page-link ${currentPage == totalPages ? 'disabled' : ''}">末頁</a>
        </div>
    </div>

    <div style="font-size: 0.8rem; color: #95a5a6; text-align: center; margin-top: 30px;">
        客戶管理系統 | 當前分頁大小：5 筆
    </div>
</body>

</html>