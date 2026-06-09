package com.example.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/learning/jsp")
public class ScriptletController {

    @GetMapping("/scriptlet")
    public String scriptlet(Model model) {
        List<String> items = Arrays.asList("壽險保單", "意外險", "醫療險", "儲蓄險");
        model.addAttribute("policyList", items);
        return "scriptlet";
    }
}