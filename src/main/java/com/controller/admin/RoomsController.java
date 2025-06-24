package com.controller.admin;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.entity.admin.Room;
import com.entity.admin.Hotel;
import com.repository.HotelRepository;
import com.repository.RoomRepository;

@Controller
@RequestMapping("/admin")
public class RoomsController {

    @Autowired
    private HotelRepository hotelRepository;

    @Autowired
    private RoomRepository roomRepository;

    // Danh sách phòng
    @GetMapping("/rooms")
    public String rooms(Model model) {
        List<Room> rooms = roomRepository.findAll();
        List<Hotel> hotels = hotelRepository.findAll();
        model.addAttribute("hotels", hotels);
        model.addAttribute("rooms", rooms);
        return "admin/room/roomsList";
    }

    // Hiển thị form thêm
    @GetMapping("/addRoom")
    public String addRoom(Model model) {
        List<Hotel> hotels = hotelRepository.findAll();
        model.addAttribute("hotels", hotels);
        model.addAttribute("room", new Room());
        return "admin/room/addRoom";
    }

    // Xử lý thêm phòng
    @PostMapping("/addRoom")
    public String addRoomSubmit(@RequestParam String roomNumber,
                                @RequestParam String type,
                                @RequestParam Integer capacity,
                                @RequestParam BigDecimal price,
                                @RequestParam String description,
                                @RequestParam Long hotelId,
                                @RequestParam String status,
                                Model model) {

        Hotel hotel = hotelRepository.findById(hotelId).orElse(null);
        if (hotel == null) {
            model.addAttribute("error", "Khách sạn không tồn tại");
            return "admin/room/addRoom";
        }

        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setType(type);
        room.setCapacity(capacity);
        room.setPrice(price);
        room.setDescription(description);
        room.setHotel(hotel);
        room.setStatus(status);

        roomRepository.save(room);
        return "redirect:/admin/rooms";
    }
    // Hiển thị form sửa
    @GetMapping("/editRoom/{id}")   
    public String editRoom(@PathVariable Long id, Model model) {
            Room room = roomRepository.findById(id).orElse(null);
            if (room == null) {
                model.addAttribute("error", "Phòng không tồn tại");
                return "admin/room/roomsList";
            }
            List<Hotel> hotels = hotelRepository.findAll();
            model.addAttribute("hotels", hotels);
            model.addAttribute("room", room);
            return "admin/room/editRoom";
    }
    @PostMapping("/editRoom/{id}")
    public String editRoomSubmit(@PathVariable Long id,
                                @RequestParam String roomNumber,
                                @RequestParam String type,
                                @RequestParam Integer capacity,
                                @RequestParam BigDecimal price,
                                @RequestParam String description,
                                @RequestParam Long hotelId,
                                @RequestParam String status,
                                Model model) {
    
            Room room = roomRepository.findById(id).orElse(null);
            if (room == null) {
                model.addAttribute("error", "Phòng không tồn tại");
                return "admin/room/roomsList";
            }
    
            Hotel hotel = hotelRepository.findById(hotelId).orElse(null);
            if (hotel == null) {
                model.addAttribute("error", "Khách sạn không tồn tại");
                return "admin/room/editRoom";
            }
    
            room.setRoomNumber(roomNumber);
            room.setType(type);
            room.setCapacity(capacity);
            room.setPrice(price);
            room.setDescription(description);
            room.setHotel(hotel);
            room.setStatus(status);
    
            roomRepository.save(room);
            return "redirect:/admin/rooms";
        }
    // Xóa phòng
    @GetMapping("/deleteRoom/{id}")
    public String deleteRoom(@PathVariable Long id, Model model) {
        Room room = roomRepository.findById(id).orElse(null);
        if (room == null) {
            model.addAttribute("error", "Phòng không tồn tại");
            return "admin/room/roomsList";
        }
        roomRepository.delete(room);
        return "redirect:/admin/rooms";
    }
}
