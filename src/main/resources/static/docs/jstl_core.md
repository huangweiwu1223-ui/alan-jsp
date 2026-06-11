# JSTL 核心標籤入門 (Day 2-1)

本單元設計為 90 分鐘的實戰內容，旨在讓學生掌握 JSTL 核心標籤庫，徹底取代 Scriptlet 中的流程控制與輸出。

## 1. 課程大綱
- **[10m] 環境準備**：引入 Taglib 宣告。
- **[15m] 變數管理**：使用 `<c:set>` 與 `<c:remove>` 操作作用域屬性。
- **[15m] 安全輸出**：`<c:out>` 的 XSS 防護機制與 `escapeXml` 屬性。
- **[25m] 條件控制**：`<c:if>` 與 `<c:choose>` 家族。
- **[25m] 迴圈與 URL**：`<c:forEach>` 遍歷集合與 `<c:url>` 路徑處理。

## 2. 核心觀念：為什麼使用 JSTL？
1. **無 Java 程式碼**：JSP 頁面僅保留標籤，提高可讀性與維護性。
2. **自動 XSS 防護**：`<c:out>` 預設跳脫 HTML 標籤，防止指令碼攻擊。
3. **邏輯與呈現分離**：條件、迴圈等由標籤完成，JSP 更像樣板引擎。

### 引入宣告
在使用任何核心標籤前，必須在 JSP 頁面頂部加入：
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```

## 3. 實作任務
### 實驗 1：計算獎金並刪除變數
- 使用 `<c:set>` 計算 `accountBalance * 0.1` 存入 `bonus`。
- 使用 `<c:remove>` 移除該變數，觀察 `${bonus}` 輸出。

### 實驗 2：XSS 攻擊防護測試
- 提供一段包含 `<script>alert('XSS')</script>` 的字串。
- 比較 `escapeXml="true"`（預設）與 `false` 的渲染差異。

### 實驗 3：使用者角色權限面板
- 根據 `userRole`（ADMIN / USER）與 `isLoggedIn` 顯示不同區塊。
- 實作 `<c:choose>` 多分支判斷。

---

## 4. JSTL Core 標籤完整指南 (按常用度排序)

### 1. 迴圈控制：`<c:forEach>`
- **常用度**：⭐⭐⭐⭐⭐
- **使用場景**：遍歷集合（List、Map、陣列），在畫面上產生表格或列表。
- **範例**：
```jsp
<ul>
    <c:forEach var="user" items="${userList}">
        <li>${user.name} - ${user.email}</li>
    </c:forEach>
</ul>
```

### 2. 單一條件判斷：`<c:if>`
- **常用度**：⭐⭐⭐⭐⭐
- **使用場景**：簡單的 `if` 邏輯判斷（無 else）。
- **範例**：
```jsp
<c:if test="${not empty user}">
    <p>歡迎回來，${user.name}！</p>
</c:if>
```

### 3. 多重條件判斷：`<c:choose>`, `<c:when>`, `<c:otherwise>`
- **常用度**：⭐⭐⭐⭐⭐
- **使用場景**：相當於 `if-else if-else`，用於處理多種條件分支。
- **範例**：
```jsp
<c:choose>
    <c:when test="${user.role == 'ADMIN'}">管理員面板</c:when>
    <c:otherwise>一般使用者介面</c:otherwise>
</c:choose>
```

### 4. 安全輸出：`<c:out>`
- **常用度**：⭐⭐⭐⭐
- **使用場景**：將變數輸出至畫面。預設執行 **HTML Escape**（跳脫符號），是防止 XSS 攻擊的最簡單防線。
- **核心屬性**：
    - `value`：要輸出的內容。
    - `default`：當 value 為 null 時顯示的預設文字。
    - `escapeXml`：是否轉換特殊字元（如 `<` 轉為 `&lt;`）。預設為 `true`。
- **情境示範**：
  假設變數 `dangerCode` 的內容為：`<script>alert('Hacked')</script><b>你好</b>`

  *   **情境 A：純文字顯示 (預設安全模式)**
      ```jsp
      <%-- 畫面會完整顯示出標籤字串，script 不會執行，b 標籤也不會粗體 --%>
      <c:out value="${dangerCode}" />
      ```
  *   **情境 B：HTML 渲染模式 (需要顯示格式時)**
      ```jsp
      <%-- 若你信任該來源(如後台管理的公告)，想讓 <b> 生效，則關閉跳脫 --%>
      <c:out value="${dangerCode}" escapeXml="false" />
      <%-- 註：這與直接用 ${dangerCode} 效果相同，script 會被執行，具危險性 --%>
      ```

### 5. 變數設定：`<c:set>`
- **常用度**：⭐⭐⭐⭐
- **使用場景**：在指定範圍（page, request, session, application）宣告或修改變數。
- **範例**：
```jsp
<c:set var="themeColor" value="dark" scope="page" />
```

### 6. URL 處理：`<c:url>`
- **常用度**：⭐⭐⭐
- **使用場景**：自動處理 Context Path（專案根目錄）及 URL 重寫（Session ID）。
- **範例**：
```jsp
<img src="<c:url value='/images/logo.png' />" />
```

### 7. 參數傳遞：`<c:param>`
- **常用度**：⭐⭐⭐
- **使用場景**：搭配 `<c:url>` 或 `<c:redirect>` 使用，會自動進行 URL Encode。
- **範例**：
```jsp
<c:url value="/user" var="u">
    <c:param name="id" value="${user.id}" />
</c:url>
```

### 8. 變數移除：`<c:remove>`
- **常用度**：⭐⭐
- **使用場景**：移除某個變數，常用於清除一次性的 Flash Message。
- **範例**：
```jsp
<c:remove var="successMsg" scope="session" />
```

### 9. 引入資源：`<c:import>`
- **常用度**：⭐⭐
- **使用場景**：功能強於 `<jsp:include>`，可引入站內或外部網站內容。
- **範例**：
```jsp
<c:import url="/WEB-INF/views/header.jsp" />
```

### 10. 頁面重導向：`<c:redirect>`
- **常用度**：⭐
- **使用場景**：發送 302 重導向。通常在 Controller 處理，較少於 JSP 使用。
- **範例**：
```jsp
<c:redirect url="/login.jsp" />
```

### 11. 例外捕捉：`<c:catch>`
- **常用度**：⭐
- **使用場景**：捕捉 JSP 頁面中的例外，防止頁面崩潰。
- **範例**：
```jsp
<c:catch var="ex">
    ${10 / 0}
</c:catch>
```

### 12. 字串分割迴圈：`<c:forTokens>`
- **常用度**：⭐
- **使用場景**：根據指定符號切割字串並進行遍歷。
- **範例**：
```jsp
<c:forTokens var="tag" items="Java,Spring,SQL" delims=",">
    <span>${tag}</span>
</c:forTokens>
```

---

## 5. 課後練習 (30m)
### 挑戰 1：會員等級徽章
- **目標**：練習 `<c:choose>` 巢狀判斷。
- **實作**：給定 `points` 變數（例如 3200）。當 points ≥ 3000 顯示「鑽石會員」；≥ 1500 顯示「黃金會員」；否則顯示「普通會員」。

### 挑戰 2：自訂錯誤訊息捕捉
- **目標**：使用 `<c:catch>` 攔截例外。
- **實作**：在頁面中故意寫入會拋出錯誤的 EL，用 `<c:catch>` 捕捉並顯示「發生錯誤：xxx」。
