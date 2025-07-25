package com.service;
import com.entity.admin.Room;
import com.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomRepository roomRepository;
    // -----------------------------admin-----------------------------
    @Override
    public List<Room> findAllRooms() {
        return roomRepository.findAll();
    }
    @Override
    public Room findRoomById(Long id) {
        return roomRepository.findById(id).orElse(null);
    }
    // -----------------------------user-----------------------------
    @Override
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }
}

