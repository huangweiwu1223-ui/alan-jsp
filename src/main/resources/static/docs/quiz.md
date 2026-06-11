# JSP + EL + JSTL 核心知識點 50 題測驗與解答

### 一、 JSP + EL + JSTL 核心協作機制
**1. 在傳統 Java Web 開發的黃金三角中，JSP、EL 與 JSTL 各自扮演什麼角色？**
*   **JSP**：負責提供 HTML 骨架，允許在頁面中嵌入 Java 程式碼 [1]。
*   **EL**：負責從作用域中「取值」，取代 JSP 中繁瑣的 `<%= %>` Java 運算式 [1]。
*   **JSTL**：負責「邏輯控制」（如迴圈、條件判斷）與「資料處理」（如格式化），取代 JSP 中的 `<% %>` Java 腳本邏輯 [1]。

**2. 現代的 JSP 開發中，最佳實踐原則為何？**
*   在 JSP 頁面中應盡量避免寫任何 Java 程式碼，全面改用 EL 取值 + JSTL 控制邏輯 [1]。

**3. 為什麼要盡量避免在 JSP 中寫入 `<% %>` 腳本，而改用 JSTL 與 EL？**
*   為了徹底消滅 JSP 頁面中的 `<% Java code %>`，讓邏輯控制與資料讀取更加標準化與簡化，使前端頁面更乾淨 [2, 3]。

### 二、 JSP 生命週期與底層原理
**4. 簡述 JSP 的本質是什麼？伺服器第一次接收請求時會如何處理它？**
*   JSP 的本質就是一個 Servlet [4]。伺服器第一次接收到請求時，會將 JSP 檔案「翻譯」並「編譯」成一個 Java 類別（Servlet） [4]。

**5. JSP 的生命週期包含哪主要階段？**
*   包含：翻譯階段 (Translation)、編譯階段 (Compilation)、載入與實例化 (Loading & Instantiation)、初始化 (`_jspInit()`)、請求處理 (`_jspService()`) 以及銷毀 (`_jspDestroy()`) [4]。

**6. 在翻譯階段 (Translation) 中，Tomcat 會將 JSP 解析並翻譯成什麼類別？**
*   翻譯成一個 `.java` 檔案，這是一個繼承了 `HttpJspBase` 的 Servlet 類別 [4]。

**7. JSP 生命週期中的 `_jspInit()` 方法，在整個應用程式運行期間會被執行幾次？**
*   在整個 Servlet 生命週期中只執行一次 [4]。

**8. 當每次有客戶端請求 JSP 時，會呼叫哪一個方法（單執行緒或多執行緒）來處理請求並生成 HTML 響應？**
*   會建立新的執行緒，並呼叫 `_jspService(HttpServletRequest, HttpServletResponse)` 方法來處理請求並生成響應 [4]。

**9. 當 Web 應用程式卸載或伺服器關閉時，JSP 會呼叫哪一個方法來釋放資源？**
*   呼叫 `_jspDestroy()` 方法釋放資源 [4]。

### 三、 JSP 四大作用域
**10. 請依有效範圍由小到大，完整列出 JSP 的四大作用域。**
*   Page -> Request -> Session -> Application [5, 6]。

**11. `Page` 作用域的存活時間為何？若伺服器端發生 forward 轉發，資料是否會遺失？**
*   當前頁面有效，當頁面執行完畢並響應給客戶端後，資料即被銷毀 [5]。若發生 forward 轉發，資料也會遺失 [5]。

**12. 若需要在 MVC 架構的 Controller 與 View 之間傳遞資料，通常應使用哪一個作用域？**
*   Request 作用域 [5]。

**13. `Session` 作用域的資料通常在何時銷毀？其預設的有效時間大約是多少？**
*   從打開瀏覽器訪問到關閉瀏覽器，或 Session 逾時為止；預設通常為 30 分鐘 [5]。

**14. 若要實作「線上總人數統計」或「全站共用參數」功能，使用哪一個作用域最為適合？**
*   Application 作用域 [5]。

### 四、 JSP 九大隱含物件與三大指令
**15. 呼叫 `_jspService` 時，JSP 引擎會自動建立的九大隱含物件有哪些？**
*   `request`, `response`, `pageContext`, `session`, `application`, `config`, `out`, `page`, `exception` [6]。

**16. 說明 `pageContext` 隱含物件的兩大核心用途。**
*   可以獲取其他 8 個隱含物件，並可操作四大作用域的屬性 [6]。

**17. 在何種前提設定下，JSP 才能使用 `exception` 隱含物件來處理錯誤？**
*   僅在指令 `<%@ page isErrorPage="true" %>` 時可用 [6]。

**18. JSP 的三大指令 (Directives) 為何？請簡述各自的功能。**
*   **page 指令**：設定頁面屬性（如編碼、錯誤頁面設定等） [7]。
*   **include 指令**：靜態包含，在翻譯階段將目標檔案的程式碼原封不動地合併 [7]。
*   **taglib 指令**：匯入自訂標籤庫或 JSTL [7]。

**19. `@page` 指令中的 `isErrorPage="true"` 宣告有什麼作用？**
*   宣告此頁面為錯誤處理頁面，從而可以使用 `exception` 物件 [7]。

**20. 靜態包含 `<%@ include file="..." %>` 是在 JSP 生命週期的哪一個階段執行的？其效能表現如何？**
*   在翻譯階段執行 [7]。效能高 [7]。

**21. 若要在 JSP 中匯入 JSTL 的 Core 標籤庫，應使用哪一個指令與標準語法？**
*   使用 `taglib` 指令，語法為：`<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>` [7]。

### 五、 JSP 動作標籤
**22. JSP 動作標籤 (Action Tags) 是在生命週期的哪一個階段執行的？**
*   在請求處理階段執行的 [2]。

**23. `<jsp:include>`（動態包含）與 `@include`（靜態包含）的底層合併機制有何根本上的不同？**
*   **動態包含**：兩支 JSP 分別編譯成不同的 Servlet，在執行時才將結果合併 [2]。
*   **靜態包含**：在翻譯階段就將目標檔案的程式碼貼過來，合併成一個 Servlet 執行 [7]。

**24. `<jsp:forward>` 的主要功能為何？發生伺服器端轉發時，客戶端瀏覽器的 URL 會不會改變？**
*   伺服器端內部轉發 [2]。客戶端瀏覽器的 URL 不變 [2]。

**25. 早期 JSP 開發中，用來操作 JavaBean 的 `<jsp:useBean>` 標籤，現代通常被什麼技術所取代？**
*   現已多被 EL 搭配 JSTL 取代 [2]。

### 六、 EL (Expression Language) 核心與隱含物件
**26. EL 的主要用途是什麼？它可以讀取沒有放在作用域中的區域變數嗎？**
*   主要用來讀取四大作用域中的屬性值，簡化 JSP 資料讀取 [2, 8]。無法讀取區域變數 [8]。

**27. 當使用 EL 取值（例如 `${user.name}`）且沒有強制指定作用域時，它的預設尋找順序為何？**
*   `pageContext` -> `request` -> `session` -> `application` [8]。

**28. 若 EL 尋找四大作用域後皆未發現對應物件，它會拋出 `NullPointerException` 錯誤，還是回傳空字串？**
*   會回傳空字串 `""`，不會拋出 `NullPointerException` [8]。

**29. 舉出四種 EL 運算子 `empty` 會回傳 true 的常見情況。**
*   當物件為 null、空字串 `""`、空陣列、或空的 Collection (List/Map) 時 [8]。

**30. EL 共有 11 大隱含物件，其中哪一個隱含物件與 JSP 是共通的？**
*   `pageContext` [9]。

**31. 想要強制從 Session 讀取資料以避免被範圍較小的同名變數覆蓋，應使用 EL 的哪一個物件？**
*   `sessionScope` [9]。

**32. EL 中的 `param` 與 `paramValues` 有何不同？在處理表單的多選 checkbox 時應使用哪一個？**
*   `param` 用於獲取單一參數；`paramValues` 用於獲取同名多值參數（回傳陣列） [9]。處理 checkbox 時應使用 `paramValues` [9]。

**33. 如何透過 EL 的 `pageContext` 隱含物件，動態獲取專案的根路徑 (Context Path)？**
*   使用 `${pageContext.request.contextPath}` [9]。

### 七、 JSTL 標籤庫
**34. JSTL 提供的 `<c:out>` 標籤在輸出資料時，有一個防止安全漏洞的預設優點是什麼？**
*   可以防止 XSS 攻擊（預設會跳脫 HTML 特殊字元） [3]。

**35. JSTL 核心標籤中，哪一組標籤的組合可以完全替代 Java 的 `switch` 或 `if-else if` 邏輯？**
*   `<c:choose>`, `<c:when>`, `<c:otherwise>` [3]。

**36. 說明 `<c:forEach>` 標籤中 `varStatus` 屬性的功用，並列舉其可獲取的狀態資訊。**
*   提供迴圈狀態物件，可獲取 `index`（索引）、`count`（計數）、`first`（是否為第一個）、`last`（是否為最後一個）等資訊 [3]。

**37. 當客戶端瀏覽器禁用 Cookie 時，`<c:url>` 標籤會如何自動處理 Session 追蹤的問題？**
*   自動處理 URL Rewriting，在 URL 後方自動附加上 session id [3]。

**38. `<fmt:formatDate>` 與 `<fmt:formatNumber>` 分別屬於哪一個 JSTL 標籤庫？其主要功能為何？**
*   屬於格式化標籤庫 (Formatting Tags) [10]。`<fmt:formatDate>` 將 Java 的 Date 物件格式化為字串；`<fmt:formatNumber>` 用於格式化數字、小數點及貨幣符號 [10]。

**39. JSTL 中的 `fn:contains` 與 `fn:substring` 等函式，本質上是呼叫了什麼 Java 類別的方法？**
*   本質上是呼叫 Java `String` 類別的方法 [10]。

**40. JSTL 的 Function Tags (如 `fn:length`) 需要搭配什麼技術語言才能在頁面中順利輸出結果？**
*   必須與 EL 搭配使用 [10]。

---

### 八、 J2EE 與其他 Web 技術進階考題 (外部補充資料)
> ⚠️ **注意**：以下 10 題為外部補充的通用 J2EE 面試題，不在目前提供的知識庫範圍內。

**41. Servlet Filter 是什麼？它在 Java Web 請求生命週期中扮演什麼角色？**
*   Servlet Filter 是一個伺服器端的攔截器，可以在請求到達 Servlet 之前，或響應傳回客戶端之前進行攔截。常被用來處理全域編碼設定、登入權限驗證與日誌記錄。

**42. Cookie 與 Session 在儲存位置、安全性與資料容量限制上有何根本區別？**
*   **Cookie**：資料存在客戶端瀏覽器，安全性較低，且有資料大小與數量限制（通常為 4KB）。
*   **Session**：資料存在伺服器端記憶體，相對安全，容量僅受限於伺服器的硬體資源。

**43. `HttpServletRequest.getAttribute()` 與 `HttpServletRequest.getParameter()` 有什麼差異？**
*   `getParameter()` 取得的是客戶端透過 HTTP 請求（如表單或 URL）傳遞來的字串資料。
*   `getAttribute()` 取得的是伺服器端在處理請求期間，透過 `setAttribute()` 存放的 Java 物件（Object 型態）。

**44. 簡述「請求轉發 (Forward)」與「重新導向 (Redirect)」在瀏覽器行為、次數與資料共享上的三大差異。**
*   **行為/次數**：Forward 是伺服器內部行為，只發生 1 次請求；Redirect 是伺服器請瀏覽器重新發出請求，共發生 2 次請求。
*   **URL 改變**：Forward 瀏覽器網址列不會改變；Redirect 會變成新的網址。
*   **資料共享**：Forward 共用同一個 request 作用域；Redirect 是新的請求，無法共用原 request 內的資料。

**45. 什麼是 ServletContextListener？通常用來處理什麼生命週期需求？**
*   它是 Servlet API 提供的一種監聽器，用來監聽整個 Web 應用程式 (ServletContext) 的啟動與銷毀事件。通常用於在伺服器啟動時初始化全域資源（如資料庫連線池、全域快取）。

**46. 在 J2EE 架構中，DAO (Data Access Object) 設計模式的主要目的是什麼？**
*   將資料庫存取與底層的 SQL 操作封裝在一個獨立的層級中，使得上層的業務邏輯 (Service) 可以與底層資料庫技術解耦，增加程式碼的可維護性。

**47. 在 `web.xml` 中設定 `<session-config>` 的 `session-timeout`，其預設的數字單位是什麼？**
*   單位為「分鐘」。

**48. 簡述 Servlet 的執行緒安全 (Thread Safety) 問題，以及開發時應如何避免資料衝突？**
*   Servlet 預設為「單例多執行緒 (Single Instance, Multiple Threads)」，多個請求會同時共用同一個 Servlet 實例。因此，應避免在 Servlet 中宣告會被更改的「實例變數 (Instance Variables)」，以防止發生資料競爭。

**49. 什麼是 MVC 設計模式？在傳統 Java Web 體系中，Model、View、Controller 通常各自對應哪些元件？**
*   **Model (模型)**：負責業務邏輯與資料存取（通常為 JavaBean、Service、DAO）。
*   **View (視圖)**：負責將資料呈現給使用者（如 JSP 頁面）。
*   **Controller (控制器)**：負責接收請求、呼叫 Model 處理業務，並選擇合適的 View 進行轉發（如 Servlet）。

**50. 為什麼現代 Java 企業級開發 (如 Spring Boot) 逐漸減少對 JSP 的依賴，而轉向 Thymeleaf 等模板引擎或前後端分離架構？**
*   JSP 需要依賴 Servlet 容器（如 Tomcat）編譯，且容易將 Java 邏輯與 HTML 視圖混雜在一起，難以做到真正的前後端解耦。Thymeleaf 提供更純粹的 HTML 模板，而前後端分離（如 Vue/React + RESTful API）則有更高的效能、開發彈性以及更好的跨平台能力。