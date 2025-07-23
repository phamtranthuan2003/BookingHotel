package com.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FilenameUtils;

import com.entity.admin.Room;
import com.entity.admin.RoomImage;
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
            @RequestParam("images") List<MultipartFile> imageFiles,
            Model model) {

        Hotel hotel = hotelRepository.findById(hotelId).orElse(null);
        if (hotel == null) {
            model.addAttribute("error", "Khách sạn không tồn tại");
            return "admin/room/addRoom";
        }

        // 1. Tạo Room
        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setType(type);
        room.setCapacity(capacity);
        room.setPrice(price);
        room.setDescription(description);
        room.setHotel(hotel);
        room.setStatus(status);

        // 2. Lưu tạm để có roomId
        roomRepository.save(room);

        // 3. Xử lý file – bọc trong try‑catch để bắt IOException
        try {
            String uploadDir = "uploads/rooms/" + room.getId();
            Path dirPath = Paths.get(uploadDir);
            Files.createDirectories(dirPath);

            for (MultipartFile file : imageFiles) {
                if (file.isEmpty())
                    continue;
                if (!file.getContentType().startsWith("image/"))
                    continue;

                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String filename = UUID.randomUUID() + "." + ext;
                Path filePath = dirPath.resolve(filename);
                Files.write(filePath, file.getBytes());

                RoomImage ri = new RoomImage();
                ri.setPath("/" + uploadDir + "/" + filename);
                ri.setRoom(room);
                room.getImages().add(ri);
            }
        } catch (IOException e) { // ✅ Bắt IOException
            e.printStackTrace();
            model.addAttribute("error", "Lỗi khi lưu ảnh.");
            return "admin/room/addRoom";
        }

        roomRepository.save(room); // cascade ALL sẽ lưu RoomImage
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
            @RequestParam(value = "images", required = false) List<MultipartFile> imageFiles,
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

        // Cập nhật thông tin
        room.setRoomNumber(roomNumber);
        room.setType(type);
        room.setCapacity(capacity);
        room.setPrice(price);
        room.setDescription(description);
        room.setHotel(hotel);
        room.setStatus(status);

        // Nếu có ảnh mới được upload → xử lý thêm vào danh sách
        if (imageFiles != null && !imageFiles.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/uploads/rooms/" + room.getId();
                Path dirPath = Paths.get(uploadDir);
                Files.createDirectories(dirPath);

                for (MultipartFile file : imageFiles) {
                    if (file.isEmpty())
                        continue;
                    if (!file.getContentType().startsWith("image/"))
                        continue;

                    String ext = org.apache.commons.io.FilenameUtils.getExtension(file.getOriginalFilename());
                    String filename = UUID.randomUUID() + "." + ext;
                    Path filePath = dirPath.resolve(filename);
                    Files.write(filePath, file.getBytes());

                    RoomImage ri = new RoomImage();
                    ri.setPath("/" + uploadDir + "/" + filename);
                    ri.setRoom(room);
                    room.getImages().add(ri);
                }
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("error", "Lỗi khi upload ảnh");
                return "admin/room/editRoom";
            }
        }

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
