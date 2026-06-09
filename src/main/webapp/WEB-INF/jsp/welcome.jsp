<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>歡迎頁 - JSP 兩日實戰</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- 引入 Markdown 解析與樣式 -->
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.5.1/github-markdown.min.css">

    <style>
        /* 簡單重置，避免影響 iframe 父層樣式 */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            margin: 0;
            background-color: #f5f7fa;
        }

        .course-box {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            background-color: white;
        }

        .highlight {
            color: #2c3e50;
            font-weight: bold;
        }

        /* 文件導覽樣式 */
        .doc-list {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .doc-item {
            background: #3498db;
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: background 0.3s;
        }

        .doc-item:hover {
            background: #2980b9;
        }

        /* Markdown 顯示容器樣式 */
        #markdown-viewer {
            margin-top: 20px;
            min-height: 200px;
            border-top: 3px solid #3498db;
        }
    </style>
</head>

<body>
    <h1>Hello, Spring Boot with JSP!</h1>

    <div class="course-box">
        <h3>第一天：核心基礎與作用域</h3>
        <p>課程名稱：<span class="highlight">${courseName}</span></p>

        <p>點擊下方文件以預覽內容：</p>
        <ul class="doc-list">
            <c:forEach items="${items}" var="item">
                <%-- 假設 item 名稱為 el, lifecycle 等 --%>
                <li class="doc-item" data-filename="${item}">${item}.md</li>
            </c:forEach>
        </ul>

        <c:if test="${isUserLoggedIn}">
            <p style="color: green;">狀態：使用者已登入</p>
        </c:if>
    </div>

    <!-- Markdown 預覽區塊 -->
    <div id="markdown-viewer" class="course-box markdown-body">
        <p style="color: #999;">請從上方清單選擇一份文件...</p>
    </div>

    <p>目前系統時間: <%= new java.util.Date() %></p>

    <script>
        $(document).ready(function () {
            // 1. 原有的下拉選單讀取邏輯
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
                    },
                    error: function (err) {
                        console.error("下拉選單讀取失敗");
                    }
                });
            }

            // 2. 新增：Markdown 讀取與渲染邏輯
            function loadMarkdownContent(fileName) {
                // 假設後端有一個 API 可以讀取 docs/ 底下的內容
                // 若為靜態資源映射，可直接使用 ${pageContext.request.contextPath}/docs/
                const url = '${pageContext.request.contextPath}/api/docs/content?name=' + fileName;

                $('#markdown-viewer').html('<p>載入中...</p>');

                $.ajax({
                    url: url,
                    type: 'GET',
                    dataType: 'text',
                    success: function (mdContent) {
                        // 使用 marked 轉換 markdown 為 html
                        const htmlContent = marked.parse(mdContent);
                        $('#markdown-viewer').html(htmlContent);
                    },
                    error: function (err) {
                        $('#markdown-viewer').html('<p style="color:red;">讀取文件 [' + fileName + '.md] 失敗，請確認後端 API 設定。</p>');
                    }
                });
            }

            // 初始化
            loadDropdown();

            // 事件綁定
            $('#loadBtn').click(function () {
                loadDropdown();
            });

            $('.doc-item').click(function () {
                const fileName = $(this).data('filename');
                loadMarkdownContent(fileName);
            });
        });
    </script>
</body>

</html>