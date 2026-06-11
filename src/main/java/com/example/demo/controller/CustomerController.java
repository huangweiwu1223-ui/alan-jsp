package com.example.demo.controller;

import com.example.demo.mapper.CustomerMapper;
import com.example.demo.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 客戶查詢頁面 (支援分頁與名稱過濾)
     */
    @GetMapping
    public String list(
            @RequestParam(name = "name", defaultValue = "") String name,
            @RequestParam(name = "page", defaultValue = "1") int page,
            Model model) {

        int pageSize = 5;
        int offset = (page - 1) * pageSize;

        // 取得總筆數並計算總頁數
        long totalRecords = customerMapper.countByName(name);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        if (totalPages == 0) totalPages = 1;

        // 查詢當頁資料
        List<Customer> customers = customerMapper.findByNamePaged(name, pageSize, offset);

        // 傳遞參數至 JSP
        model.addAttribute("customers", customers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchName", name);
        model.addAttribute("totalRecords", totalRecords);

        return "customer";
    }
}
