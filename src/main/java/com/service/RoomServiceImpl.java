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

    public List<Room> findAll() {
        List<Room> rooms = roomRepository.findAll();
        return rooms;
    }

    @Override
    public List<Room> findAllRooms() {
        return roomRepository.findAll();
    }
}
