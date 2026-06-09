package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/learning/jsp")
public class LifecycleController {

    @GetMapping("/lifecycle")
    public String lifecycle(Model model) {
        // 無需傳遞屬性，JSP中將透過隱含物件直接展示生命週期相關資訊
        return "learning/lifecycle";
    }

}