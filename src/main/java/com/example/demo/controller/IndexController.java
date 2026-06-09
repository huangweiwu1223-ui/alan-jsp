package com.example.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    /**
     * 當訪問 / 或 /index 時，導向 index.jsp
     * 第一天學習重點：使用 Model 傳遞資料，並在 JSP 中以 EL/JSTL 顯示
     */
    @GetMapping({ "/", "/index" })
    public String index(Model model) {
        // 模擬從資料庫取得的清單資料
        List<String> items = Arrays.asList("Spring Boot", "JSP", "JSTL", "EL", "jQuery AJAX");

        // 將資料放入 Model
        model.addAttribute("courseName", "JSP 兩日極速實戰");
        model.addAttribute("items", items);
        model.addAttribute("isUserLoggedIn", true);

        // 根據 application.properties 設定，會對應到 /WEB-INF/jsp/index.jsp
        return "index";
    }
}
