# EL (Expression Language) 深度解析 (Day 1-3)

本單元設計為 120 分鐘的實戰內容，旨在讓學生掌握從 JSP Scriptlet (`<% %>`) 轉型為更簡潔、更安全的 EL 表達式。

## 1. 課程大綱
- **[30m] 基礎運算與 Null 安全**：學習 `empty` 運算子與三元運算的強大之處。
- **[30m] 隱含物件全攻略**：不透過 Java 代碼，直接讀取 URL 參數 (`param`) 與 Header。
- **[40m] EL 3.0 進階特性**：實作 Lambda 表達式、Stream API 過濾與字串串接。
- **[20m] 集合建構練習**：在 JSP 頁面直接動態生成 List 與 Map。

## 2. 核心觀念：為什麼使用 EL？
1. **簡潔性**：`${user.name}` 遠優於 `<%= ((User)request.getAttribute("user")).getName() %>`。
2. **容錯性**：當物件為 null 時，EL 會顯示空字串而非噴出 `NullPointerException`。
3. **可讀性**：讓 JSP 看起來更像 HTML，易於與前端工程師協作。

## 3. 實作任務
### 實驗 1：邏輯與空值檢查
- 使用 `empty` 同時判斷物件是否為 null 或集合是否為空。
- 實作三元運算，根據 `user.age` 顯示「成年」或「未成年」。

### 實驗 2：EL 3.0 Stream 魔法
- 在 Controller 傳入一個產品清單。
- 在 JSP 使用 `stream().filter().map().toList()` 過濾出高單價產品。

## 4. 關鍵語法清單
- `${not empty var}`: 判斷變數存在且有值。
- `${param.id}`: 取得 GET/POST 傳入的 `id` 參數。
- `${'Code: ' += item.code}`: EL 3.0 的字串串接語法。

## 5. 課後練習 (30m)
### 挑戰 1：動態 URL 生成器
- **目標**：利用 `${pageContext.request.contextPath}` 與參數串接。
- **實作**：在頁面新增一個按鈕，點擊後跳轉到 `/learning/jsp/el?type=vip`。

### 挑戰 2：Lambda 計算機
- **目標**：在 JSP 頂部定義一個 Lambda 函式。
- **實作**：定義一個計算折扣的函式 `calcDiscount = (p, d) -> p * d`，並在表格中顯示原價 1000 元打 8 折後的結果。
