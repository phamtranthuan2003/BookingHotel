package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class HotelsController {

    @GetMapping("/hotels")
    public String hotels() {
        return "admin/hotels";
    }
}
