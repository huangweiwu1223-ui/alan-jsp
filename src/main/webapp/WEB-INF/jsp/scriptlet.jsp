<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo.model.*" %>
<%-- 設定錯誤處理頁面 --%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 1-4: Scriptlet 傳統語法實戰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lifecycle.css">
    <style>
        .old-school {
            border-left: 5px solid #e74c3c;
            background: #fdf2f2;
        }

        .new-school {
            border-left: 5px solid #2ecc71;
            background: #f2fdf5;
        }

        .adv-box {
            border-left: 5px solid #3498db;
            background: #ebf5fb;
            padding: 15px;
            margin: 10px 0;
        }

        .code-block {
            font-family: monospace;
            color: #d63384;
            background: #eee;
            padding: 2px 4px;
            border-radius: 3px;
        }

        .debug-info {
            color: #2980b9;
            font-weight: bold;
            border: 1px dashed #3498db;
            padding: 5px;
        }
    </style>
</head>

<%!
    // 1. Declaration (宣告): Servlet 的成員變數
    private int globalAccessCount = 0;

    public String formatMessage(String name) {
        return "系統提示: 歡迎 " + name + " 進入舊時代 JSP 控制台";
    }
%>

<%
    // 2. Scriptlet (腳本): 每次請求執行的邏輯
    globalAccessCount++;
    
    // --- 進階操作範例：Header 控制 ---
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("X-Powered-By", "JSP-Legacy-Engine");

    // --- 角色權限導向演示 ---
    String role = request.getParameter("role");
    if ("ADMIN".equals(role)) {
        // 注意：實務上這會導向一個存在的路徑，此處僅作演示
        // request.getRequestDispatcher("/learning/jsp/admin-page").forward(request, response);
        // return; 
    }

    // --- 故意觸發錯誤演示 ---
    if ("trigger".equals(request.getParameter("error"))) {
        throw new RuntimeException("這是由學員手動觸發的 Scriptlet 異常！");
    }

    String currentServer = (String) request.getAttribute("serverTag");
    if (currentServer == null) currentServer = "Unknown";
%>

<body>
    <div class="card">
        <div class="card-header">🏷️ JSP 三大標籤演示</div>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">Expression <%= "<%= ... %" + ">" %></div>
                <div class="scope-value"><%= formatMessage("管理員") %></div>
                <small>用於直接輸出單一變數或結果</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Declaration <%= "<%! ... %" + ">" %></div>
                <div class="scope-value">累計造訪: <%= globalAccessCount %></div>
                <small>定義成員變數或 Method</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">Scriptlet <%= "<% ... %" + ">" %></div>
                <div class="scope-value">邏輯處理區</div>
                <small>包含 if/for 等 Java 程式邏輯</small>
            </div>
        </div>
    </div>

    <div class="card adv-box">
        <div class="card-header" style="color: #2980b9;">🚀 進階操作：直接控制 Response & Out</div>
        <p>除了 HTML 混合寫法，我們可以直接操作 <code>out</code> 物件：</p>
        <%
            out.println("<div class='debug-info'>透過 out.println 輸出的 Session ID: " + session.getId() + "</div>");
        %>
        <p style="margin-top:10px;">
            <a href="?role=ADMIN" class="badge" style="background:#3498db">模擬管理員登入 (Forward)</a>
            <a href="?error=trigger" class="badge" style="background:#e67e22">點我故意觸發錯誤 (errorPage)</a>
        </p>
    </div>

    <div class="card old-school">
        <div class="card-header" style="color: #c0392b;">🍝 傳統義大利麵條式程式碼 (Table Rendering)</div>
        <table>
            <thead>
                <tr>
                    <th>編號</th>
                    <th>客戶姓名</th>
                    <th>保單狀態</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
                    if (users != null) {
                        for (Map<String, String> u : users) {
                %>
                <tr>
                    <td><span class="code-block"><%= u.get("id") %></span></td>
                    <td><%= u.get("name") %></td>
                    <td>
                        <% if("已繳費".equals(u.get("status"))) { %>
                        <span class="badge" style="background:#2ecc71">正常</span>
                        <% } else { %>
                        <span class="badge" style="background:#e74c3c"><%= u.get("status") %></span>
                        <% } %>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">尚無資料</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="card new-school">
        <div class="card-header" style="color: #27ae60;">💡 為什麼不推薦使用 Scriptlet？</div>
        <ol>
            <li><strong>難以維護</strong>：括號 <code><%="}"%></code> 散落在 HTML 中。</li>
            <li><strong>缺乏類型安全</strong>：必須頻繁手動強轉 <code>(List&lt;Map&gt;)</code>。</li>
            <li><strong>報錯困難</strong>：發生錯誤時行號極難對齊。</li>
            <li><strong>建議方案</strong>：請優先使用 <a href="#">EL (${"${...}"})</a> 與 JSTL。</li>
        </ol>
    </div>

    <div style="text-align: center; color: #95a5a6; font-size: 0.8rem;">
        伺服器標籤：<%= currentServer %> | 編譯時間：<%= new java.util.Date() %>
    </div>

    <!-- ========== 10 個 Scriptlet 物件清單練習 (不使用 Map) ========== -->
    <hr style="margin: 30px 0;">
    <h2 style="text-align:center; color:#2c3e50;">🔰 10 個 Scriptlet 物件清單練習 (Policy & Customer)</h2>

    <%-- 練習 1：基本 for 迴圈輸出保單清單 --%>
    <div class="card old-school">
        <div class="card-header">練習 1：基本 for 迴圈輸出保單</div>
        <table>
            <tr>
                <th>保單號碼</th>
                <th>險種</th>
                <th>保額</th>
            </tr>
            <%
                List<Policy> policies = (List<Policy>) request.getAttribute("policies");
                if (policies != null) {
                    for (Policy p : policies) {
            %>
            <tr>
                <td><%= p.getPolicyNumber() %></td>
                <td><%= p.getType() %></td>
                <td><%= p.getSumInsured() %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>

    <%-- 練習 2：增強 for + 條件顯示 (高保額紅字) --%>
    <div class="card old-school">
        <div class="card-header">練習 2：增強 for 搭配 if-else，高保額 (>100萬) 顯示紅字</div>
        <ul>
            <%
                if (policies != null) {
                    for (Policy p : policies) {
                        if (p.getSumInsured() > 1_000_000) {
            %>
            <li style="color:red;"><strong><%= p.getPolicyNumber() %></strong> -
                <%= p.getType() %>：<%= p.getSumInsured() %> 元 (高保額)</li>
            <%
                        } else {
            %>
            <li><%= p.getPolicyNumber() %> - <%= p.getType() %>：<%= p.getSumInsured() %> 元</li>
            <%
                        }
                    }
                }
            %>
        </ul>
    </div>

    <%-- 練習 3：使用 Iterator 迭代 --%>
    <div class="card old-school">
        <div class="card-header">練習 3：使用 Iterator 走訪保單</div>
        <table>
            <tr>
                <th>序號</th>
                <th>險種</th>
            </tr>
            <%
                if (policies != null) {
                    java.util.Iterator<Policy> it = policies.iterator();
                    int idx = 1;
                    while (it.hasNext()) {
                        Policy p = it.next();
            %>
            <tr>
                <td><%= idx++ %></td>
                <td><%= p.getType() %> (<%= p.getPolicyNumber() %>)</td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>

    <%-- 練習 4：轉陣列 + while 迴圈 --%>
    <div class="card old-school">
        <div class="card-header">練習 4：轉成陣列後用 while 迴圈輸出</div>
        <ul>
            <%
                if (policies != null) {
                    Policy[] policyArray = policies.toArray(new Policy[0]);
                    int i = 0;
                    while (i < policyArray.length) {
                        Policy p = policyArray[i];
            %>
            <li>第 <%= i+1 %> 筆：<%= p.getPolicyNumber() %> - 保額 <%= p.getSumInsured() %></li>
            <%
                        i++;
                    }
                }
            %>
        </ul>
    </div>

    <%-- 練習 5：Scriptlet 變數累加 + Expression 輸出總額 --%>
    <div class="card old-school">
        <div class="card-header">練習 5：用 Scriptlet 計算總保額，並用 Expression 輸出</div>
        <%
            int totalSumInsured = 0;
            if (policies != null) {
                for (Policy p : policies) {
                    totalSumInsured += p.getSumInsured();
                }
            }
        %>
        <p>總保額：<strong style="font-size:1.5rem; color:#d63384;"><%= totalSumInsured %></strong> 元</p>
    </div>

    <%-- 練習 6：pageContext 暫存物件並取出 --%>
    <div class="card old-school">
        <div class="card-header">練習 6：使用 pageContext 暫存第一筆保單，再用 Scriptlet 顯示</div>
        <%
            if (policies != null && !policies.isEmpty()) {
                pageContext.setAttribute("featuredPolicy", policies.get(0));
            }
        %>
        <p>精選保單 (透過 pageContext.getAttribute)：
            <%
                Policy featured = (Policy) pageContext.getAttribute("featuredPolicy");
                if (featured != null) {
            %>
            <%= featured.getPolicyNumber() %> - <%= featured.getType() %> (保額：<%= featured.getSumInsured() %>)
            <%
                } else {
                    out.println("無精選保單");
                }
            %>
        </p>
    </div>

    <%-- 練習 7：空清單處理 --%>
    <div class="card old-school">
        <div class="card-header">練習 7：處理空清單（emptyList）</div>
        <%
            List<Policy> emptyList = (List<Policy>) request.getAttribute("emptyList");
            if (emptyList == null || emptyList.isEmpty()) {
        %>
        <p style="color:#e67e22;">⚠️ 目前沒有任何保單資料。</p>
        <%
            } else {
                for (Policy p : emptyList) {
                    out.println(p.getPolicyNumber() + " ");
                }
            }
        %>
    </div>

    <%-- 練習 8：動態奇偶行樣式 --%>
    <div class="card old-school">
        <div class="card-header">練習 8：動態表格行樣式（奇偶行不同背景）</div>
        <table>
            <tr>
                <th>姓名</th>
                <th>年齡</th>
                <th>年繳保費</th>
            </tr>
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                if (customers != null) {
                    int rowCount = 0;
                    for (Customer c : customers) {
                        String bg = (rowCount % 2 == 0) ? "#ffffff" : "#f2f2f2";
            %>
            <tr style="background:<%= bg %>;">
                <td><%= c.getName() %></td>
                <td><%= c.getAge() %></td>
                <td><%= String.format("%,.0f", c.getPremium()) %></td>
            </tr>
            <%
                        rowCount++;
                    }
                }
            %>
        </table>
    </div>

    <%-- 練習 9：使用 out.println() 直接輸出整個表格 --%>
    <div class="card old-school">
        <div class="card-header">練習 9：只用 out.println() 輸出表格</div>
        <%
            if (customers != null) {
                out.println("<table><tr><th>姓名</th><th>保費級距</th></tr>");
                for (Customer c : customers) {
                    String level = c.getPremium() > 30000 ? "高保費" : "一般";
                    out.println("<tr><td>" + c.getName() + "</td><td>" + level + "</td></tr>");
                }
                out.println("</table>");
            }
        %>
    </div>

    <%-- 練習 10：根據 request 參數過濾物件清單 --%>
    <div class="card old-school">
        <div class="card-header">練習 10：接收 ?type=壽險 參數過濾保單</div>
        <p>目前參數：<%= request.getParameter("type") != null ? request.getParameter("type") : "無" %></p>
        <%
            String filterType = request.getParameter("type");
            if (policies != null) {
                for (Policy p : policies) {
                    if (filterType == null || filterType.trim().isEmpty() || filterType.equals(p.getType())) {
        %>
        <div><%= p.getPolicyNumber() %> - <%= p.getType() %> (保額：<%= p.getSumInsured() %>)</div>
        <%
                    }
                }
            }
        %>
        <p style="margin-top:10px;">
            試試：<a href="?type=壽險">?type=壽險</a> |
            <a href="?type=意外險">?type=意外險</a> |
            <a href="?">清除過濾</a>
        </p>
    </div>

</body>

</html>