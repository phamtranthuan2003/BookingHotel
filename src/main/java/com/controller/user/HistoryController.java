package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class HistoryController {
    @GetMapping("/history")
    public String home() {
        return "user/history";
    }
}
