package com.example.demo.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private ResourceLoader resourceLoader;

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

        return options;
    }

    /**
     * 實作任務：讀取 docs 目錄下的 Markdown 檔案內容
     * @param name 檔案名稱 (不含副檔名)
     * @return Markdown 純文字內容
     */
    @GetMapping("/docs/content")
    public String getDocContent(@RequestParam String name) {
        try {
            // 從 classpath 讀取 static/docs/ 目錄下的 .md 檔案
            Resource resource = resourceLoader.getResource("classpath:static/docs/" + name + ".md");
            
            if (resource.exists()) {
                // 將資源流轉換為 UTF-8 字串
                return StreamUtils.copyToString(resource.getInputStream(), StandardCharsets.UTF_8);
            } else {
                return "找不到文件: " + name + ".md";
            }
        } catch (IOException e) {
            return "讀取文件時發生錯誤: " + e.getMessage();
        }
    }

    private Map<String, String> createOption(String id, String name) {
        Map<String, String> option = new HashMap<>();
        option.put("id", id);
        option.put("name", name);
        return option;
    }
}
