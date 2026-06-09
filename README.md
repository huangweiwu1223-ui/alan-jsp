# alan-jsp: Spring Boot 與 JSP 兩日極速實戰教學

這個專案專為 Java 後端初學者設計，旨在透過 Spring Boot 框架快速掌握 JSP (JavaServer Pages) 的核心技術。從傳統的 Scriptlet 到現代的 JSTL 與 EL，並結合 AJAX 實現前後端分離的初探。

## 什麼是 JSP？
**JSP (JavaServer Pages)** 是一種基於 Java 的伺服器端渲染技術。它允許開發者在 HTML 頁面中嵌入 Java 程式碼，由伺服器（如 Tomcat）將其編譯為 Servlet 並執行，最終輸出 HTML 給瀏覽器。

雖然現代前端多使用 React/Vue，但 JSP 在維護遺留系統（Legacy Systems）以及快速開發內部後台管理工具時，仍具有其不可替代的價值。

---

## Spring Boot 配置 JSP 的環境設定

### 1. 依賴管理 (pom.xml)
在 Spring Boot 中使用 JSP，必須手動加入內嵌的 Tomcat Jasper 引擎以及 JSTL 標籤庫（本專案採用 Jakarta EE 規範）。

```xml
<!-- 1. JSP 引擎：必要 -->
<dependency>
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
    <scope>provided</scope>
</dependency>

<!-- 2. JSTL 支援 (Jakarta EE 規範) -->
<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
</dependency>
<dependency>
    <groupId>org.glassfish.web</groupId>
    <artifactId>jakarta.servlet.jsp.jstl</artifactId>
</dependency>
```

### 2. 視圖解析設定 (application.properties)
告訴 Spring Boot 到哪裡尋找 `.jsp` 檔案。

```properties
# 設定 JSP 視圖解析路徑
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

---

## 兩日課程大綱

### 📅 Day 1: 核心基礎與作用域
*   **1-1 JSP 生命週期與隱含物件**
    *   理解 JSP 本質即為 Servlet。
    *   學習 `jspInit`、`_jspService`、`jspDestroy` 階段。
    *   掌握九大隱含物件（request, session, application 等）的直接調用。
*   **1-2 四大作用域 (Scopes)**
    *   探索 Page、Request、Session、Application 的存取範圍。
    *   實驗 EL (Expression Language) 的變數搜尋優先順序。
*   **1-3 從傳統到現代：EL 取代 Scriptlet**
    *   回顧 `<% %>` 的痛苦與維護困難。
    *   學習 EL 表達式的優點：Null 安全性、自動型態轉換、簡潔語法。

### 📅 Day 2: 進階邏輯、標籤庫與 AJAX
*   **2-1 JSTL 核心標籤庫深度實踐**
    *   **邏輯控制**：`<c:if>`、`<c:choose>` (多重判斷)。
    *   **變數與異常**：`<c:set>`、`<c:remove>`、`<c:catch>`。
    *   **進階迭代**：`<c:forEach>` 的 `varStatus` 屬性、`<c:forTokens>` 解析 CSV。
    *   **URL 處理**：`<c:url>` 自動處理 Context Path 與 `<c:param>` 編碼。
*   **2-2 前後端整合應用**
    *   使用 Spring `@RestController` 提供 JSON API。
    *   透過 jQuery AJAX 在 JSP 中實現動態下拉選單載入。

---

## 快速開始
1. 確保環境已安裝 Java 17+。
2. 執行專案：`mvn spring-boot:run`。
3. 訪問首頁：`http://localhost:8080` or `http://localhost:8080/index`。
4. 課程文件詳見 `/docs` 目錄。
