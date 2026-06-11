package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/learning/jsp/jstl")
public class JstlController {

    // 1. forEach
    @GetMapping("/forEach")
    public String forEach(Model model) {
        List<Map<String, Object>> advList = new ArrayList<>();
        advList.add(Map.of("id", "P001", "name", "超值壽險", "price", 5000));
        advList.add(Map.of("id", "P002", "name", "高端醫療", "price", 12000));
        model.addAttribute("advList", advList);
        return "jstl_forEach";
    }

    // 2. if
    @GetMapping("/if")
    public String jstlIf(Model model) {
        model.addAttribute("isLoggedIn", true);
        model.addAttribute("accountBalance", 15000);
        return "jstl_if";
    }

    // 3. choose
    @GetMapping("/choose")
    public String jstlChoose(Model model) {
        model.addAttribute("userRole", "ADMIN");
        model.addAttribute("practiceScore", 85);
        return "jstl_choose_when_otherwise";
    }

    // 4. out
    @GetMapping("/out")
    public String jstlOut(Model model) {
        model.addAttribute("unsafeContent", "<script>alert('XSS')</script><b>安全文字</b>");
        return "jstl_out";
    }

    // 5. set
    @GetMapping("/set")
    public String jstlSet() {
        return "jstl_set";
    }

    // 6. url
    @GetMapping("/url")
    public String jstlUrl() {
        return "jstl_url";
    }

    // 7. param
    @GetMapping("/param")
    public String jstlParam() {
        return "jstl_param";
    }

    // 8. remove
    @GetMapping("/remove")
    public String jstlRemove(Model model) {
        model.addAttribute("tempMsg", "這是一次性訊息");
        return "jstl_remove";
    }

    // 9. import
    @GetMapping("/import")
    public String jstlImport() {
        return "jstl_import";
    }

    // 10. redirect
    @GetMapping("/redirect")
    public String jstlRedirect() {
        return "jstl_redirect";
    }

    // 11. catch
    @GetMapping("/catch")
    public String jstlCatch() {
        return "jstl_catch";
    }

    // 12. forTokens
    @GetMapping("/forTokens")
    public String jstlForTokens(Model model) {
        model.addAttribute("csvTags", "壽險,醫療,意外,儲蓄,投資");
        return "jstl_forTokens";
    }

    @GetMapping("/ajax")
    public String jstlAjax() {
        return "jstl_ajax";
    }
}
