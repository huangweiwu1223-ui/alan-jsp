package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/learning/jsp")
public class JstlController {

    @GetMapping("/jstl/core")
    public String jstlCore(Model model) {
        // 核心標籤入門所需資料
        model.addAttribute("userRole", "ADMIN");
        model.addAttribute("isLoggedIn", true);
        model.addAttribute("accountBalance", 15000);

        // 用於 c:out 展示 XSS 防護的字串
        model.addAttribute("unsafeContent", "<script>alert('XSS')</script><b>安全文字</b>");

        // 練習用分數
        model.addAttribute("practiceScore", 85);

        return "jstl_core";
    }

    @GetMapping("/jstl/iteration")
    public String jstlIteration(Model model) {
        // 進階迭代所需資料
        List<Map<String, Object>> advancedPolicies = new ArrayList<>();
        advancedPolicies.add(Map.of("id", "P001", "name", "超值壽險", "price", 5000, "active", true));
        advancedPolicies.add(Map.of("id", "P002", "name", "高端醫療", "price", 12000, "active", true));
        advancedPolicies.add(Map.of("id", "P003", "name", "過期保單", "price", 2000, "active", false));
        advancedPolicies.add(Map.of("id", "P004", "name", "微型保險", "price", 500, "active", true));
        model.addAttribute("advList", advancedPolicies);

        model.addAttribute("csvTags", "壽險,醫療,意外,儲蓄,投資,防疫");

        List<Integer> scores = List.of(90, 85, 77, 92, 60, 45, 88);
        model.addAttribute("scoreList", scores);

        return "jstl_iteration";
    }

    @GetMapping("/jstl/url")
    public String jstlUrl(Model model) {
        // URL 處理頁面不需要特殊資料，可動態展示
        return "jstl_url";
    }

    @GetMapping("/jstl/ajax")
    public String jstlAjax(Model model) {
        // AJAX 頁面可直接使用後端 API，不需 Model 資料
        return "jstl_ajax";
    }
}
