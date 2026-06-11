# 請幫我建立 客戶查詢的查詢結果清單**分頁器**

## 問題

- 幫我實作一個 jsp 畫面，有查詢條件 card。下方是查詢結果的 table，要支援分頁

## 我的需求

- CustomerController:
  - @RequestMapping：幫我設定 **/customer**
  - 視情況添加查詢等相關方法
  - 需注入 CustomerMapper，且能根據查詢條件查詢
- customer.jsp:
  - 上方要有查詢條件 card
    - 要能根據客戶名稱(name)查詢
      - CustomerMapper 需增加 findByName
  - 下方要有查詢結果 card
    - 要有 queryResult table
      - 需完整呈現所有的 Customer 的欄位
      - 需要用 **JSTL**完成。要包含c:forEach、c:if、c:choose、c:out、c:set
      - 預設每 5筆 1頁
      - 要支援第1頁、下1頁、上1頁、最後1頁
- 設計風格要類似 el.jsp

