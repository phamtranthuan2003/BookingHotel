package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class RommController {
    @RequestMapping("/room")
    public String room() {
        return "user/room/room";
    }
    @RequestMapping("/roomDetail")
    public String roomDetail() {
        return "user/roomDetail";
    }
}
