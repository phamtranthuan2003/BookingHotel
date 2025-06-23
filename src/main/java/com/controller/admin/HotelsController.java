package com.controller.admin;
import com.entity.admin.Hotel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
@Controller
@RequestMapping("/admin")
public class HotelsController {

    @GetMapping("/hotels")
    public String hotels() {
        return "admin/hotel/hotelsList";
    }
    @GetMapping("/addHotel")
    public String addHotel(Model model) {
        model.addAttribute("hotel", new Hotel());
        return "admin/hotel/addHotel";
    }
}
