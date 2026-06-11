package com.example.demo.controller;

import com.example.demo.mapper.CustomerMapper;
import com.example.demo.mapper.PolicyMapper;
import com.example.demo.model.Policy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/policy")
public class PolicyController {

    @Autowired
    private PolicyMapper policyMapper;

    @Autowired
    private CustomerMapper customerMapper; // 依需求注入，可用於延伸關聯查詢

    /**
     * 保單查詢頁面 (支援分頁與多重條件篩選)
     */
    @GetMapping
    public String list(
            @RequestParam(name = "policyNumber", defaultValue = "") String policyNumber,
            @RequestParam(name = "type", defaultValue = "") String type,
            @RequestParam(name = "startDate", defaultValue = "") String startDate,
            @RequestParam(name = "endDate", defaultValue = "") String endDate,
            @RequestParam(name = "page", defaultValue = "1") int page,
            Model model) {

        int pageSize = 10; // 預設每 10 筆 1 頁
        int offset = (page - 1) * pageSize;

        // 查詢符合條件的總筆數
        long totalRecords = policyMapper.countByConditions(policyNumber, type, startDate, endDate);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        if (totalPages == 0) totalPages = 1;

        // 分頁獲取保單資料
        List<Policy> policies = policyMapper.findByConditionsPaged(policyNumber, type, startDate, endDate, pageSize, offset);

        // 將參數傳遞到 JSP
        model.addAttribute("policies", policies);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalRecords", totalRecords);
        model.addAttribute("searchPolicyNumber", policyNumber);
        model.addAttribute("searchType", type);
        model.addAttribute("searchStartDate", startDate);
        model.addAttribute("searchEndDate", endDate);

        return "policy";
    }
}
