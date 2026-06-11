# 請幫我建立 保單查詢的查詢結果清單**分頁器**

## 問題

- 幫我實作一個 jsp 畫面，有查詢條件 card。下方是查詢結果的 table，要支援分頁

## 我的需求

- PolicyController:
  - @RequestMapping：幫我設定 **/policy**
  - 視情況添加查詢等相關方法
  - 需注入 CustomerMapper，且能根據查詢條件查詢
- policy.jsp:
  - 上方要有查詢條件 card
    - 要能根據保單號碼(policy_number)、保險類型(type)、保險類型(type)、起保日期(start_date)、結束日期(end_date)查詢
  - 下方要有查詢結果 card
    - 要有 queryResult table
      - 需完整呈現所有的 policy 的欄位
      - 需要用 **JSTL**完成。要包含c:forEach、c:if、c:choose、c:out、c:set
      - 預設每 10筆 1頁
      - 要支援第1頁、下1頁、上1頁、最後1頁
- 設計風格要類似 customer.jsp

