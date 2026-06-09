<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>歡迎頁 - JSP 兩日實戰</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        /* 簡單重置，避免影響 iframe 父層樣式 */
        body {
            font-family: sans-serif;
            padding: 20px;
            margin: 0;
        }

        .course-box {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
        }

        .highlight {
            color: #2c3e50;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <h1>Hello, Spring Boot with JSP!</h1>

    <div class="course-box">
        <h3>第一天：EL 與 JSTL 應用</h3>
        <p>課程名稱：<span class="highlight">${courseName}</span></p>

        <p>學習項目清單：</p>
        <ul>
            <c:forEach items="${items}" var="item">
                <li>${item}</li>
            </c:forEach>
        </ul>

        <c:if test="${isUserLoggedIn}">
            <p style="color: green;">狀態：使用者已登入 (JSTL if 判斷成功)</p>
        </c:if>
    </div>

    <div class="course-box">
        <h3>第二天：AJAX 下拉選單讀取</h3>
        <label for="courseSelect">選擇進階課程：</label>
        <select id="courseSelect">
            <option value="">-- 請選擇 --</option>
        </select>
        <button id="loadBtn">手動重新載入</button>
    </div>

    <p>目前系統時間: <%= new java.util.Date() %></p>

    <script>
        $(document).ready(function () {
            function loadDropdown() {
                $.ajax({
                    url: '${pageContext.request.contextPath}/api/options',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        var $select = $('#courseSelect');
                        $select.empty();
                        $select.append('<option value="">-- 請選擇 --</option>');
                        $.each(data, function (index, option) {
                            $select.append($('<option>', {
                                value: option.id,
                                text: option.name
                            }));
                        });
                        console.log("資料載入成功");
                    },
                    error: function (err) {
                        alert("讀取失敗，請確認後端 API");
                    }
                });
            }
            loadDropdown();
            $('#loadBtn').click(function () {
                loadDropdown();
            });
        });
    </script>
</body>

</html>