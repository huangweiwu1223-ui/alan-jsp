package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/learning/jsp")
public class ScopesController {

    @Autowired
    private ServletContext context;

    @GetMapping("/scopes")
    public String courseScopes(Model model, HttpSession session) {
        // 1. 設定四種作用域的標準資料
        model.addAttribute("requestData", "這是在 Request 範圍的資料");
        session.setAttribute("sessionData", "這是在 Session 範圍的資料");
        context.setAttribute("applicationData", "這是在 Application 範圍的資料");

        // 2. 教學亮點：故意設定同名的屬性，測試 EL 優先權 (Conflict Test)
        // 順序應該是: page (JSP設定) > request > session > application
        model.addAttribute("conflictVar", "來自 Request 的衝突變數");
        session.setAttribute("conflictVar", "來自 Session 的衝突變數");
        context.setAttribute("conflictVar", "來自 Application 的衝突變數");

        return "learning/scopes";
    }
}
