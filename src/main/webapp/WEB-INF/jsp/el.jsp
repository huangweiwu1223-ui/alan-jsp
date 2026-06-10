<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="common/header.jsp" />

<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <title>Day 1-3: EL 表達式實驗室</title>

    <link rel="stylesheet" href="${ctx}/css/lifecycle.css">

    <style>
        .el-section {
            margin-bottom: 30px;
        }

        .token {
            color: #e83e8c;
            font-weight: bold;
            font-family: monospace;
        }

        .result-box {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 10px;
            border-radius: 4px;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <div class="card">
        <div class="card-header">🧪 EL 基礎運算與 Null 安全</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>算術運算 (加法)</td>
                    <td><span class="token">${10 + 20}</span></td>
                    <td>${10 + 20}</td>
                </tr>
                <tr>
                    <td>比較運算 (大於)</td>
                    <td><span class="token">${testUser.age gt 18}</span></td>
                    <td>${testUser.age gt 18}</td>
                </tr>
                <tr>
                    <td>三元運算 (身分)</td>
                    <td><span class="token">${testUser.age >= 18 ? '成人' : '未成年'}</span></td>
                    <td><span class="badge" style="background:#3498db">${testUser.age >= 18 ? '成人' : '未成年'}</span></td>
                </tr>
                <tr>
                    <td>空值判斷 (Empty List)</td>
                    <td><span class="token">${empty emptyList}</span></td>
                    <td>${empty emptyList ? '✅ 是空的' : '❌ 不是空的'}</td>
                </tr>
                <tr>
                    <td>空值判斷 (Null Var)</td>
                    <td><span class="token">${empty nullVar}</span></td>
                    <td>${empty nullVar ? '✅ 是空的' : '❌ 不是空的'}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card">
        <div class="card-header">🌐 隱含物件偵測 (Implicit Objects)</div>
        <p>直接從請求中獲取資訊，無需透過 Controller：</p>
        <div class="scope-grid">
            <div class="scope-item">
                <div class="scope-title">URL 參數 (param.type)</div>
                <div class="scope-value">${not empty param.type ? param.type : '無參數'}</div>
                <small>試著在 URL 後加上 ?type=pro</small>
            </div>
            <div class="scope-item">
                <div class="scope-title">瀏覽器 (header)</div>
                <div class="scope-value" style="font-size: 0.8rem;">${header['User-Agent']}</div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">🚀 EL 3.0+ 進階特性 (Lambda & Stream)</div>

        <div class="el-section">
            <p><strong>1. 字串串接 (String Concatenation):</strong></p>
            <div class="result-box">
                ${'歡迎回來，' += testUser.name += '！ 職位是：' += testUser.role}
            </div>
        </div>

        <div class="el-section">
            <p><strong>2. 集合建構 (Collection Construction):</strong></p>
            <div class="result-box">
                快速清單：${['Java', 'Spring', 'JSP']} <br>
                快速 Map：${{'key1': 'value1', 'key2': 12345}}
            </div>
        </div>

        <div class="el-section">
            <p><strong>3. Stream API (過濾出價格 > 20000 的產品):</strong></p>
            <ul>
                <c:forEach var="pName"
                    items="${productList.stream().filter(p -> p.price > 20000).map(p -> p.name).toList()}">
                    <li>💎 高階產品：<span class="token">${pName}</span></li>
                </c:forEach>
            </ul>
        </div>

        <div class="el-section">
            <p><strong>4. Lambda 表達式 (即時計算折扣):</strong></p>
            <div class="result-box">
                <%-- 定義 Lambda --%>
                <c:set var="applyDiscount" value="${(p, r) -> p * r}" />
                <%-- 使用 Lambda 執行計算，透過括號明確指定傳入參數 --%>
                原價 1000 元，打 75 折後為：<span class="badge" style="background:#e67e22">${applyDiscount.eval(1000,
                    0.75)}</span>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">🔢 算術與邏輯運算進階</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>減法</td>
                    <td><span class="token">${100 - 35}</span></td>
                    <td>${100 - 35}</td>
                </tr>
                <tr>
                    <td>乘法</td>
                    <td><span class="token">${7 * 8}</span></td>
                    <td>${7 * 8}</td>
                </tr>
                <tr>
                    <td>除法</td>
                    <td><span class="token">${100 / 3}</span></td>
                    <td>${100 / 3}</td>
                </tr>
                <tr>
                    <td>取餘數</td>
                    <td><span class="token">${17 % 5}</span></td>
                    <td>${17 % 5}</td>
                </tr>
                <tr>
                    <td>複合運算</td>
                    <td><span class="token">${(5 + 3) * 2}</span></td>
                    <td>${(5 + 3) * 2}</td>
                </tr>
                <tr>
                    <td>大於比較 (numA gt numB)</td>
                    <td><span class="token">${numA gt numB}</span></td>
                    <td>${numA gt numB}</td>
                </tr>
                <tr>
                    <td>等於比較 (字串)</td>
                    <td><span class="token">${str1 eq 'Hello'}</span></td>
                    <td>${str1 eq 'Hello'}</td>
                </tr>
                <tr>
                    <td>邏輯 AND</td>
                    <td><span class="token">${boolTrue and boolFalse}</span></td>
                    <td>${boolTrue and boolFalse}</td>
                </tr>
                <tr>
                    <td>邏輯 OR</td>
                    <td><span class="token">${boolTrue or boolFalse}</span></td>
                    <td>${boolTrue or boolFalse}</td>
                </tr>
                <tr>
                    <td>邏輯 NOT</td>
                    <td><span class="token">${not boolFalse}</span></td>
                    <td>${not boolFalse}</td>
                </tr>
                <tr>
                    <td>自動型別轉換 ('25' + 5)</td>
                    <td><span class="token">${'25' + 5}</span></td>
                    <td>${'25' + 5}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card">
        <div class="card-header">📝 字串處理（方法呼叫）</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>轉大寫</td>
                    <td><span class="token">${str1.toUpperCase()}</span></td>
                    <td>${str1.toUpperCase()}</td>
                </tr>
                <tr>
                    <td>轉小寫</td>
                    <td><span class="token">${'JAKARTA'.toLowerCase()}</span></td>
                    <td>${'JAKARTA'.toLowerCase()}</td>
                </tr>
                <tr>
                    <td>取得字串長度</td>
                    <td><span class="token">${testUser.name.length()}</span></td>
                    <td>${testUser.name.length()}</td>
                </tr>
                <tr>
                    <td>去除前後空白</td>
                    <td><span class="token">${longStr.trim()}</span></td>
                    <td>「${longStr.trim()}」 (長度：${longStr.trim().length()})</td>
                </tr>
                <tr>
                    <td>字串取代</td>
                    <td><span class="token">${testUser.email.replace('example','demo')}</span></td>
                    <td>${testUser.email.replace('example','demo')}</td>
                </tr>
                <tr>
                    <td>包含判斷 (contains)</td>
                    <td><span class="token">${testUser.email.contains('@')}</span></td>
                    <td>${testUser.email.contains('@')}</td>
                </tr>
                <tr>
                    <td>取出帳號 (substring+indexOf)</td>
                    <td><span class="token">${testUser.email.substring(0, testUser.email.indexOf('@'))}</span></td>
                    <td>${testUser.email.substring(0, testUser.email.indexOf('@'))}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card">
        <div class="card-header">📂 集合與映射操作</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>List 大小</td>
                    <td><span class="token">${numberList.size()}</span></td>
                    <td>${numberList.size()}</td>
                </tr>
                <tr>
                    <td>List 是否包含元素</td>
                    <td><span class="token">${numberList.contains(9)}</span></td>
                    <td>${numberList.contains(9)}</td>
                </tr>
                <tr>
                    <td>Map 取值 (key='Alice')</td>
                    <td><span class="token">${userMap['Alice']}</span></td>
                    <td>${userMap['Alice']}</td>
                </tr>
                <tr>
                    <td>巢狀取值 (nestedObj.address.city)</td>
                    <td><span class="token">${nestedObj.address.city}</span></td>
                    <td>${nestedObj.address.city}</td>
                </tr>
                <tr>
                    <td>Stream 排序</td>
                    <td><span class="token">${numberList.stream().sorted().toList()}</span></td>
                    <td>${numberList.stream().sorted().toList()}</td>
                </tr>
                <tr>
                    <td>自訂 Lambda 加法</td>
                    <td>
                        <c:set var="add" value="${(x, y) -> x + y}" />
                        <span class="token">${add.eval(3, 5)}</span>
                    </td>
                    <td>${add.eval(3, 5)}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card">
        <div class="card-header">🔍 空值安全與預設值</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Null 顯示預設文字</td>
                    <td><span class="token">${nullVar != null ? nullVar : '無資料'}</span></td>
                    <td>${nullVar != null ? nullVar : '無資料'}</td>
                </tr>
                <tr>
                    <td>空字串判斷</td>
                    <td><span class="token">${empty emptyStr ? '是空字串' : '有內容'}</span></td>
                    <td>${empty emptyStr ? '是空字串' : '有內容'}</td>
                </tr>
                <tr>
                    <td>非空時才顯示（Email）</td>
                    <td><span class="token">${not empty testUser.email ? testUser.email : '無Email'}</span></td>
                    <td>${not empty testUser.email ? testUser.email : '無Email'}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card">
        <div class="card-header">🌍 隱含物件深入 & 其他技巧</div>
        <table>
            <thead>
                <tr>
                    <th>測試場景</th>
                    <th>EL 語法</th>
                    <th>執行結果</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>paramValues 第一值</td>
                    <td><span class="token">${not empty paramValues.type ? paramValues.type[0] : '無'}</span></td>
                    <td>${not empty paramValues.type ? paramValues.type[0] : '無'}</td>
                </tr>
                <tr>
                    <td>headerValues (Accept-Language)</td>
                    <td><span class="token">${headerValues['accept-language'][0]}</span></td>
                    <td>${headerValues['accept-language'][0]}</td>
                </tr>
                <tr>
                    <td>Cookie (JSESSIONID)</td>
                    <td><span class="token">${cookie.JSESSIONID != null ? cookie.JSESSIONID.value : '無'}</span></td>
                    <td>${cookie.JSESSIONID != null ? cookie.JSESSIONID.value : '無'}</td>
                </tr>
                <tr>
                    <td>initParam (無定義顯示空白)</td>
                    <td><span class="token">${initParam['myConfig']}</span></td>
                    <td>${initParam['myConfig']}</td>
                </tr>
                <tr>
                    <td>pageContext 取得路徑</td>
                    <td><span class="token">${pageContext.request.contextPath}</span></td>
                    <td>${pageContext.request.contextPath}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div style="font-size: 0.8rem; color: #95a5a6; text-align: center; margin-top: 30px;">
        EL 版本：3.0+ | 環境：Jakarta EE |
        <a href="${pageContext.request.contextPath}/learning/jsp/el?type=standard" style="color: #3498db;">重整並帶入參數</a>
    </div>
</body>

</html>