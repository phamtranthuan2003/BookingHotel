package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class HomesController {

    @GetMapping("/homes")
    public String homes() {
        return "admin/homes";
    }
}
