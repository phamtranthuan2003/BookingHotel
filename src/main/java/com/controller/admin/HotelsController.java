package com.controller.admin;
import com.entity.admin.Hotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import com.repository.HotelRepository;
import java.util.List;
@Controller
@RequestMapping("/admin")
public class HotelsController {

    @Autowired
    private HotelRepository hotelRepository;

    @GetMapping("/hotels")
    public String hotels(Model model) {
        List<Hotel> hotels = hotelRepository.findAll();
        model.addAttribute("hotels", hotels);
        return "admin/hotel/hotelsList";
    }
    @GetMapping("/addHotel")
    public String addHotel(Model model) {
        model.addAttribute("hotel", new Hotel());
        return "admin/hotel/addHotel";
    }
    @PostMapping("/addHotel")
    public String addHotel(@RequestParam String name,
                           @RequestParam String address,
                           @RequestParam String rating,
                           @RequestParam String description,
                           Model model) {
        Hotel hotel = new Hotel();
        hotel.setName(name);
        hotel.setAddress(address);
        hotel.setRating(Float.parseFloat(rating));
        hotel.setDescription(description);
        
        hotelRepository.save(hotel);
        model.addAttribute("Thông báo", "Thêm khách sạn thành công");
        return "redirect:/admin/hotels";
    }
    @GetMapping("/editHotel/{id}")
    public String editHotel(@PathVariable Long id, Model model) {
        Hotel hotel = hotelRepository.findById(id).orElse(null);
        if (hotel == null) {
            model.addAttribute("error", "Không tìm thấy khách sạn");
            return "admin/hotel/hotelsList";
        }
        model.addAttribute("hotel", hotel);
        return "admin/hotel/editHotel";
    }
    @PostMapping("/editHotel/{id}")
    public String editHotel(@PathVariable Long id,
                            @RequestParam String name,
                            @RequestParam String address,
                            @RequestParam String rating,
                            @RequestParam String description,
                            Model model) {
        Hotel hotel = hotelRepository.findById(id).orElse(null);
        if (hotel == null) {
            model.addAttribute("error", "Không tìm thấy khách sạn");
            return "admin/hotel/hotelsList";
        }
        hotel.setName(name);
        hotel.setAddress(address);
        hotel.setRating(Float.parseFloat(rating));
        hotel.setDescription(description);
        
        hotelRepository.save(hotel);
        model.addAttribute("message", "Hotel updated successfully");
        return "redirect:/admin/hotels";
    }
    @GetMapping("/deleteHotel/{id}")
    public String deleteHotel(@PathVariable Long id, Model model) {
        Hotel hotel = hotelRepository.findById(id).orElse(null);
        if (hotel == null) {
            model.addAttribute("error", "Không tìm thấy khách sạn");
            return "admin/hotel/hotelsList";
        }
        hotelRepository.delete(hotel);
        model.addAttribute("message", "Xóa khách sạn thành công");
        return "redirect:/admin/hotels";
    }
}
