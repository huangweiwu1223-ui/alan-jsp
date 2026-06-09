<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 2-4：AJAX 整合實戰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        .ajax-result {
            margin-top: 15px;
            padding: 10px;
            background: #f4f4f4;
            border-radius: 4px;
        }

        .btn {
            padding: 8px 16px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background: #2980b9;
        }
    </style>
</head>

<body>
    <h1>⚡ AJAX 整合實戰</h1>
    <p>結合 jQuery 與後端 API，實作非同步資料獲取，不再需要整頁刷新。</p>

    <!-- 示範區塊 -->
    <div class="card">
        <div class="card-header">📡 1. 動態取得課程選項 (呼叫 /api/options)</div>
        <p>後端提供 JSON 格式的下拉選單資料，前端透過 AJAX 取得後渲染。</p>
        <button class="btn" id="loadOptionsBtn">載入選項</button>
        <div id="optionsContainer" class="ajax-result">尚未載入</div>
    </div>

    <!-- 代碼展示 -->
    <div class="card">
        <div class="card-header">🧩 前端代碼範例</div>
        <pre class="code-block">
$.ajax({
    url: '${pageContext.request.contextPath}/api/options',
    type: 'GET',
    dataType: 'json',
    success: function(data) {
        // data 為 [{"id":"1","name":"後端開發 (Java)"}, ...]
        let html = '&lt;ul&gt;';
        $.each(data, function(i, item) {
            html += '&lt;li&gt;' + item.id + ' - ' + item.name + '&lt;/li&gt;';
        });
        html += '&lt;/ul&gt;';
        $('#optionsContainer').html(html);
    },
    error: function(xhr, status, error) {
        $('#optionsContainer').html('&lt;p style="color:red;"&gt;載入失敗：' + error + '&lt;/p&gt;');
    }
});
        </pre>
    </div>

    <!-- 對比說明 -->
    <div class="card">
        <div class="card-header">🔄 AJAX vs JSTL 渲染</div>
        <table>
            <tr>
                <th>方式</th>
                <th>時機</th>
                <th>優點</th>
            </tr>
            <tr>
                <td>JSTL / EL</td>
                <td>伺服器端生成 HTML</td>
                <td>SEO 友好，初次載入即包含資料</td>
            </tr>
            <tr>
                <td>AJAX + JSON</td>
                <td>客戶端動態請求</td>
                <td>無需整頁刷新，提高互動性</td>
            </tr>
        </table>
        <p>在實務中常混合使用：靜態結構由 JSTL 產生，動態內容則透過 AJAX 更新。</p>
    </div>

    <script>
        $(function () {
            $('#loadOptionsBtn').click(function () {
                var $container = $('#optionsContainer');
                $container.html('<p>載入中...</p>');

                $.ajax({
                    url: '${pageContext.request.contextPath}/api/options',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        var html = '<ul>';
                        $.each(data, function (i, item) {
                            html += '<li><strong>' + item.id + '</strong> - ' + item.name + '</li>';
                        });
                        html += '</ul>';
                        $container.html(html);
                    },
                    error: function (xhr, status, error) {
                        $container.html('<p style="color:red;">載入失敗：' + error + '</p>');
                    }
                });
            });
        });
    </script>
</body>

</html>