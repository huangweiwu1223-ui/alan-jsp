<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="common/header.jsp" />

<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>保單資料管理</title>
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

        /* 讓欄位極多的 table 能夠橫向滾動而不破版 */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin-bottom: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }

        table {
            width: 100%;
            min-width: 1800px;
            /* 確保所有保單欄位能舒適伸展 */
            border-collapse: collapse;
        }

        /* 查詢卡片排版優化 */
        .search-form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 15px;
        }

        .search-form-grid div {
            display: flex;
            flex-direction: column;
        }

        .search-form-grid label {
            font-size: 0.85rem;
            margin-bottom: 5px;
            color: #34495e;
            font-weight: bold;
        }

        .search-form-grid input,
        .search-form-grid select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 0.9rem;
        }

        .button-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 10px;
        }
    </style>
</head>

<body>

    <!-- 查詢條件卡片 -->
    <div class="card">
        <div class="card-header">🔍 保單查詢條件</div>
        <form action="${pageContext.request.contextPath}/policy" method="get">
            <div class="search-form-grid">
                <div>
                    <label>保單號碼</label>
                    <input type="text" name="policyNumber" placeholder="請輸入保單號碼..."
                        value="<c:out value='${searchPolicyNumber}'/>">
                </div>
                <div>
                    <label>保險類型</label>
                    <input type="text" name="type" placeholder="請輸入險種名稱..." value="<c:out value='${searchType}'/>">
                </div>
                <div>
                    <label>起保日期 (起始)</label>
                    <input type="date" name="startDate" value="<c:out value='${searchStartDate}'/>">
                </div>
                <div>
                    <label>結束日期 (截止)</label>
                    <input type="date" name="endDate" value="<c:out value='${searchEndDate}'/>">
                </div>
            </div>
            <div class="button-group">
                <button type="submit">搜尋</button>
                <button type="button" class="secondary"
                    onclick="location.href='${pageContext.request.contextPath}/policy'">重置</button>
            </div>
        </form>
    </div>

    <!-- 查詢結果卡片 -->
    <div class="card">
        <div class="card-header">📋 查詢結果清單</div>

        <div class="search-info">
            <c:set var="infoText" value="找到 ${totalRecords} 筆資料，目前顯示第 ${currentPage} / ${totalPages} 頁" />
            <c:out value="${infoText}" />
        </div>

        <div class="table-responsive">
            <table id="queryResult">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>保單號碼</th>
                        <th>保險類型</th>
                        <th>保險金額</th>
                        <th>客戶 ID</th>
                        <th>保單狀態</th>
                        <th>保費金額</th>
                        <th>繳費方式</th>
                        <th>起保日期</th>
                        <th>結束日期</th>
                        <th>生效日期</th>
                        <th>到期日期</th>
                        <th>保險期間 (年)</th>
                        <th>分公司</th>
                        <th>業務員</th>
                        <th>幣別</th>
                        <th>風險等級</th>
                        <th>自動續保</th>
                        <th>受益人</th>
                        <th>承保內容描述</th>
                        <th>備註</th>
                        <th>建立時間</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty policies}">
                            <c:forEach var="pol" items="${policies}">
                                <tr>
                                    <td>${pol.id}</td>
                                    <td><strong>
                                            <c:out value="${pol.policyNumber}" />
                                        </strong></td>
                                    <td><span class="badge" style="background: #1abc9c;">
                                            <c:out value="${pol.type}" />
                                        </span></td>
                                    <td>
                                        <fmt:formatNumber value="${pol.sumInsured}" type="currency" currencySymbol="$"
                                            maxFractionDigits="0" />
                                    </td>
                                    <td>${pol.customerId}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${pol.status == '有效' || pol.status == 'Active'}">
                                                <span class="badge" style="background:#2ecc71">有效</span>
                                            </c:when>
                                            <c:when test="${pol.status == '失效' || pol.status == 'Lapsed'}">
                                                <span class="badge" style="background:#e74c3c">失效</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge" style="background:#95a5a6">
                                                    <c:out value="${pol.status}" />
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${pol.premiumAmount}" type="currency"
                                            currencySymbol="$" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.paymentMode}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.startDate}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.endDate}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.effectiveDate}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.expiryDate}" />
                                    </td>
                                    <td>${pol.policyTerm}</td>
                                    <td>
                                        <c:out value="${pol.branchCode}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.agentCode}" />
                                    </td>
                                    <td><span class="badge" style="background:#34495e">
                                            <c:out value="${pol.currencyCode}" />
                                        </span></td>
                                    <td>
                                        <c:if test="${pol.riskLevel == 'High'}"><span class="badge"
                                                style="background:#e74c3c">高</span></c:if>
                                        <c:if test="${pol.riskLevel == 'Medium'}"><span class="badge"
                                                style="background:#f1c40f; color:#000;">中</span></c:if>
                                        <c:if test="${pol.riskLevel == 'Low'}"><span class="badge"
                                                style="background:#2ecc71">低</span></c:if>
                                        <c:if
                                            test="${pol.riskLevel != 'High' && pol.riskLevel != 'Medium' && pol.riskLevel != 'Low'}">
                                            <c:out value="${pol.riskLevel}" />
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${pol.autoRenew}">
                                                <span class="badge" style="background:#2ecc71">是</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge" style="background:#95a5a6">否</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:out value="${pol.beneficiaryName}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.coverageDescription}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.remarks}" />
                                    </td>
                                    <td>
                                        <c:out value="${pol.createTime}" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="22" style="text-align: center; color: #999; height: 100px;">查無符合條件的保單資料
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- 分頁器 -->
        <div class="pagination-container">
            <!-- 共有帶上原查詢參數的分頁 URL -->
            <c:set var="queryParams"
                value="policyNumber=${searchPolicyNumber}&type=${searchType}&startDate=${searchStartDate}&endDate=${searchEndDate}" />

            <!-- 第一頁 -->
            <a href="?${queryParams}&page=1" class="page-link ${currentPage == 1 ? 'disabled' : ''}">首頁</a>

            <!-- 上一頁 -->
            <c:if test="${currentPage > 1}">
                <a href="?${queryParams}&page=${currentPage - 1}" class="page-link">上一頁</a>
            </c:if>

            <!-- 頁碼顯示 (當前頁碼標示) -->
            <span class="page-link active">${currentPage}</span>

            <!-- 下一頁 -->
            <c:if test="${currentPage < totalPages}">
                <a href="?${queryParams}&page=${currentPage + 1}" class="page-link">下一頁</a>
            </c:if>

            <!-- 最後一頁 -->
            <a href="?${queryParams}&page=${totalPages}"
                class="page-link ${currentPage == totalPages ? 'disabled' : ''}">末頁</a>
        </div>
    </div>

    <div style="font-size: 0.8rem; color: #95a5a6; text-align: center; margin-top: 30px; margin-bottom: 20px;">
        保單管理系統 | 當前分頁大小：10 筆
    </div>
</body>

</html>