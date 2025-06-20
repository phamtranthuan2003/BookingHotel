package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class StatisticsController {

    @GetMapping("/statistics")
    public String statistics() {
        return "admin/statistics";
    }
}
