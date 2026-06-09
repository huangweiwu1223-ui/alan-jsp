<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>Day 1 下午: Scriptlet vs EL</title>
    <style>
        .old-school { color: #771111; border: 1px solid red; padding: 10px; }
        .new-school { color: #117711; border: 1px solid green; padding: 10px; margin-top: 10px; }
    </style>
</head>
<body>
    <h1>Day 1 下午：從 Scriptlet 到 EL 的演進</h1>

    <div class="old-school">
        <h3>1. 傳統 Scriptlet 寫法 (痛苦演示)</h3>
        <%
            List<String> list = (List<String>) request.getAttribute("policyList");
            if (list != null && list.size() > 0) {
                out.print("<ul>");
                for (int i = 0; i < list.size(); i++) {
                    String item = list.get(i);
                    // 在 Java 中手動拼接 HTML 是非常危險且難以閱讀的
                    out.print("<li>第 " + (i+1) + " 項: " + item + "</li>");
                }
                out.print("</ul>");
            } else {
                out.print("<p>無資料</p>");
            }
        %>
    </div>

    <div class="new-school">
        <h3>2. 現代 EL 表達式寫法 (優雅對比)</h3>
        <p>第一個保單名稱: ${policyList[0]}</p>
        <p>保單清單是否為空: ${empty policyList ? '是' : '否'}</p>
        <p>清單長度 (需結合 JSTL): \${fn:length(policyList)}</p>
    </div>

    <hr>
    <h3>講師對比重點：</h3>
    <ol>
        <li><strong>Null 安全性</strong>：EL 遇到 null 會顯示空字串，Scriptlet 會噴 NullPointerException。</li>
        <li><strong>強制轉型</strong>：EL 自動處理 <code>getAttribute</code> 與類型轉換，Scriptlet 需要手動 <code>(List&lt;String&gt;)</code>。</li>
        <li><strong>可讀性</strong>：觀察上方兩區塊的程式碼量與雜亂程度。</li>
    </ol>
</body>
</html>