package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/learning/jsp")
public class ElController {

    @GetMapping("/el")
    public String elLab(Model model, HttpSession session) {
        // 1. 準備基礎物件
        model.addAttribute("testUser", Map.of(
                "name", "阿龍",
                "age", 25,
                "role", "Senior Developer",
                "email", "alan@example.com"));

        // 2. 準備集合資料 (用於 Stream API 測試)
        List<Map<String, Object>> products = new ArrayList<>();
        products.add(Map.of("id", 1, "name", "MacBook Pro", "price", 60000, "stock", 5));
        products.add(Map.of("id", 2, "name", "iPad Air", "price", 18000, "stock", 0));
        products.add(Map.of("id", 3, "name", "iPhone 15", "price", 29000, "stock", 12));
        products.add(Map.of("id", 4, "name", "Magic Mouse", "price", 2200, "stock", 25));

        model.addAttribute("productList", products);

        // 3. 設定一些可能會是空的變數 (用於 empty 測試)
        model.addAttribute("emptyList", new ArrayList<>());
        model.addAttribute("nullVar", null);

        // 4. 新增練習用屬性（約30個練習）
        model.addAttribute("numA", 10);
        model.addAttribute("numB", 3);
        model.addAttribute("pi", 3.14159);
        model.addAttribute("str1", "Hello");
        model.addAttribute("str2", "World");
        model.addAttribute("longStr", "  Jakarta EE  ");
        model.addAttribute("numberList", List.of(5, 2, 9, 1, 7));
        model.addAttribute("userMap", Map.of("Alice", 30, "Bob", 25, "Charlie", 35));
        model.addAttribute("nestedObj", Map.of("address", Map.of("city", "Taipei", "zip", "100")));
        model.addAttribute("boolTrue", true);
        model.addAttribute("boolFalse", false);
        model.addAttribute("emptyStr", "");

        return "el";
    }
}
