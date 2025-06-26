package com.controller.user;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import com.entity.admin.Room;
import com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Controller
@RequestMapping("/user")
public class RoomController {
    @Autowired
    private RoomService roomService;
    @RequestMapping("/room")
    public String room(Model model) {
        List<Room> rooms = roomService.getAllRooms();
        model.addAttribute("rooms", rooms);
        return "user/room/room";
    }
    @RequestMapping("/roomDetail")
    public String roomDetail(Model model) {
        List<Room> rooms = roomService.getAllRooms();
        model.addAttribute("rooms", rooms);
        return "user/room/roomDetail";
    }
}
