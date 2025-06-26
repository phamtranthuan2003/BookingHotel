package com.service;

import java.util.List;
import com.entity.admin.Room;

public interface RoomService {
    List<Room> findAllRooms();



    // <!----------user------------->
    List<Room> getAllRooms();
}
