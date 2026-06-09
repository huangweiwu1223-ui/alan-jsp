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

    @GetMapping("/jstl")
    public String jstl(Model model) {
        // 1. 基礎與複雜物件列表
        List<Map<String, Object>> advancedPolicies = new ArrayList<>();
        advancedPolicies.add(Map.of("id", "P001", "name", "超值壽險", "price", 5000, "active", true));
        advancedPolicies.add(Map.of("id", "P002", "name", "高端醫療", "price", 12000, "active", true));
        advancedPolicies.add(Map.of("id", "P003", "name", "過期保單", "price", 2000, "active", false));
        advancedPolicies.add(Map.of("id", "P004", "name", "微型保險", "price", 500, "active", true));
        model.addAttribute("advList", advancedPolicies);

        // 2. 用於 c:forTokens 的字串 (模擬 CSV 資料)
        model.addAttribute("csvTags", "壽險,醫療,意外,儲蓄,投資,防疫");

        // 3. 用於演示 c:forEach 進階屬性 (數字序列)
        List<Integer> scores = List.of(90, 85, 77, 92, 60, 45, 88);
        model.addAttribute("scoreList", scores);

        // 4. 用於測試 c:if 與 c:choose
        model.addAttribute("userRole", "ADMIN");
        model.addAttribute("isLoggedIn", true);
        model.addAttribute("accountBalance", 15000);

        return "jstl";
    }
}
