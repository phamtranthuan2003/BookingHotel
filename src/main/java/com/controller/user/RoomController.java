package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import com.entity.admin.Room;
import com.entity.user.Review;
import com.service.RoomService;
import com.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Controller
@RequestMapping("/user")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/room")
    public String room(Model model) {
        List<Room> rooms = roomService.getAllRooms();
        model.addAttribute("rooms", rooms);
        return "user/room/room";
    }
    @RequestMapping("/roomDetail/{id}")
    public String roomDetail(@PathVariable("id") long id, Model model) {
        Room room = roomService.findRoomById(id);
        if (room == null) {
            return "redirect:/user/room";
        }
        List<Review> reviews = reviewService.getReviewsByRoomId(id);
        model.addAttribute("room", room);
        model.addAttribute("reviews", reviews);
        return "user/room/roomDetail";
    }
}
