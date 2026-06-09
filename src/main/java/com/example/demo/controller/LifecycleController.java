package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/learning/jsp")
public class LifecycleController {

    @GetMapping("/lifecycle")
    public String lifecycle(Model model) {
        return "lifecycle";
    }

    @PostMapping("/lifecycle/login")
    public String simulateLogin(@RequestParam String username, HttpSession session) {
        // 將資料存入 Session，JSP 將透過隱含物件 session 讀取
        session.setAttribute("currentUser", username);
        return "redirect:/learning/jsp/lifecycle";
    }

    @GetMapping("/lifecycle/logout")
    public String logout(HttpSession session) {
        // 銷毀 Session
        session.invalidate();
        return "redirect:/learning/jsp/lifecycle";
    }
}
