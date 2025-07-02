package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BlogsController {
    
    @GetMapping("/blogsList")
    public String blogsList(){
        return "/admin/blog/blogsList";
    }
}
