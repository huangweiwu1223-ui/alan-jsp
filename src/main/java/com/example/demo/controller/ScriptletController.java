package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Customer;
import com.example.demo.model.Policy;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/learning/jsp")
public class ScriptletController {

    @GetMapping("/scriptlet")
    public String scriptlet(Model model, HttpServletRequest request) {
        // 1. 準備保單清單
        List<String> items = Arrays.asList("國泰人壽 L3 壽險", "新光產險 A1 意外險", "富邦人壽 H2 醫療險");
        model.addAttribute("policyList", items);

        // 2. 準備使用者清單
        List<Map<String, String>> userList = new ArrayList<>();
        userList.add(Map.of("id", "A001", "name", "張小明", "status", "已繳費"));
        userList.add(Map.of("id", "A002", "name", "李小華", "status", "催繳中"));
        userList.add(Map.of("id", "A003", "name", "王大同", "status", "已過期"));

        // model.addAttribute (推薦用法)：
        // - Spring 的抽象層：這是 Spring MVC 推薦的方式。當 Controller 回傳 String (視圖名稱) 時，Spring 會自動將
        // Model 裡的資料同步到 request 的屬性中，讓 JSP 可以透過 ${name} 或 <%=
        // request.getAttribute("name") %> 取出。
        // - 優點：它隱藏了底層 Servlet API，讓你之後如果要更換視圖引擎 (例如改用 Thymeleaf) 時，Controller
        // 的代碼幾乎不需要大幅更動。
        model.addAttribute("users", userList);

        // 3. 設定 Server 標籤
        // request.setAttribute (原生用法)：
        // - 直接操作 Servlet API：這是傳統 Java Web (Servlet/JSP) 的做法。你在 HttpServletRequest
        // 物件中直接注入資料。
        // - 情境建議：通常僅在需要與過時的第三方過濾器 (Filter)、舊版 Servlet 元件或極度底層的請求處理交互時才會使用。在現代 Spring
        // MVC 開發中，使用它是「非必要且較髒」的寫法。
        request.setAttribute("serverTag", "Prod-Server-01");

        // 4. 準備 Policy 物件清單 (供 JSP Scriptlet 練習用，不用 Map)

        List<Policy> policies = Arrays.asList(
                new Policy("P001", "壽險", 1_000_000),
                new Policy("P002", "意外險", 500_000),
                new Policy("P003", "醫療險", 200_000),
                new Policy("P004", "壽險", 3_000_000));
        model.addAttribute("policies", policies);

        // 5. 準備 Customer 物件清單
        List<Customer> customers = Arrays.asList(
                new Customer("李大仁", 35, 36_000.0),
                new Customer("程又青", 30, 28_000.0),
                new Customer("丁立威", 40, 45_000.0));
        model.addAttribute("customers", customers);

        // 6. 準備空清單，示範無資料處理
        model.addAttribute("emptyList", new ArrayList<Policy>());

        return "scriptlet";
    }

    @GetMapping("/scriptlet-jstl")
    public String scriptletJstl(Model model, HttpServletRequest request) {
        // 1. 準備保單清單
        List<String> items = Arrays.asList("國泰人壽 L3 壽險", "新光產險 A1 意外險", "富邦人壽 H2 醫療險");
        model.addAttribute("policyList", items);

        // 2. 準備使用者清單
        List<Map<String, String>> userList = new ArrayList<>();
        userList.add(Map.of("id", "A001", "name", "張小明", "status", "已繳費"));
        userList.add(Map.of("id", "A002", "name", "李小華", "status", "催繳中"));
        userList.add(Map.of("id", "A003", "name", "王大同", "status", "已過期"));

        // model.addAttribute (推薦用法)：
        // - Spring 的抽象層：這是 Spring MVC 推薦的方式。當 Controller 回傳 String (視圖名稱) 時，Spring 會自動將
        // Model 裡的資料同步到 request 的屬性中，讓 JSP 可以透過 ${name} 或 <%=
        // request.getAttribute("name") %> 取出。
        // - 優點：它隱藏了底層 Servlet API，讓你之後如果要更換視圖引擎 (例如改用 Thymeleaf) 時，Controller
        // 的代碼幾乎不需要大幅更動。
        model.addAttribute("users", userList);

        // 3. 設定 Server 標籤
        // request.setAttribute (原生用法)：
        // - 直接操作 Servlet API：這是傳統 Java Web (Servlet/JSP) 的做法。你在 HttpServletRequest
        // 物件中直接注入資料。
        // - 情境建議：通常僅在需要與過時的第三方過濾器 (Filter)、舊版 Servlet 元件或極度底層的請求處理交互時才會使用。在現代 Spring
        // MVC 開發中，使用它是「非必要且較髒」的寫法。
        request.setAttribute("serverTag", "Prod-Server-01");

        // 4. 準備 Policy 物件清單 (供 JSP Scriptlet 練習用，不用 Map)

        List<Policy> policies = Arrays.asList(
                new Policy("P001", "壽險", 1_000_000),
                new Policy("P002", "意外險", 500_000),
                new Policy("P003", "醫療險", 200_000),
                new Policy("P004", "壽險", 3_000_000));
        model.addAttribute("policies", policies);

        // 5. 準備 Customer 物件清單
        List<Customer> customers = Arrays.asList(
                new Customer("李大仁", 35, 36_000.0),
                new Customer("程又青", 30, 28_000.0),
                new Customer("丁立威", 40, 45_000.0));
        model.addAttribute("customers", customers);

        // 6. 準備空清單，示範無資料處理
        model.addAttribute("emptyList", new ArrayList<Policy>());

        return "scriptlet-jstl";
    }

    // 模擬轉發後的目標頁面 (僅用於教學演示)
    @GetMapping("/admin-page")
    public String adminPage() {
        return "admin_mock"; // 需另建 admin_mock.jsp，或僅觀察 URL 變化
    }

}
