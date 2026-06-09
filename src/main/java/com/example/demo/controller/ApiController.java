package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    /**
     * 第二天學習重點：提供 JSON 資料給 AJAX 呼叫
     * 模擬返回下拉選單的選項
     */
    @GetMapping("/options")
    public List<Map<String, String>> getOptions() {
        List<Map<String, String>> options = new ArrayList<>();

        options.add(createOption("1", "後端開發 (Java)"));
        options.add(createOption("2", "前端技術 (JavaScript)"));
        options.add(createOption("3", "資料庫管理 (SQL)"));
        options.add(createOption("4", "雲端佈署 (Docker)"));
        options.add(createOption("5", "test"));

        return options;
    }

    private Map<String, String> createOption(String id, String name) {
        Map<String, String> option = new HashMap<>();
        option.put("id", id);
        option.put("name", name);
        return option;
    }
}
