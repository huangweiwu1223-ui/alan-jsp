package com.example.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    /**
     * 當訪問 / 或 /index 時，導向 index.jsp (左右框架主頁)
     * 第一天學習重點：使用 Model 傳遞資料，並在 JSP 中以 EL/JSTL 顯示
     */
    @GetMapping({ "/", "/index" })
    public String index(Model model) {
        return "index";
    }

    /**
     * 歡迎頁面 (顯示課程介紹與 AJAX 下拉選單)
     * 供 index.jsp 的 iframe 預設載入
     */
    @GetMapping("/welcome")
    public String welcome(Model model) {
        // 複製原有首頁所需的屬性
        List<String> items = Arrays.asList("Spring Boot", "JSP", "JSTL", "EL", "jQuery AJAX");
        model.addAttribute("courseName", "JSP 兩日極速實戰");
        model.addAttribute("items", items);
        model.addAttribute("isUserLoggedIn", true);
        return "welcome";
    }
}
