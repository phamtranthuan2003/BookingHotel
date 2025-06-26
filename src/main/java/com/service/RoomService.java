package com.service;

import java.util.List;
import com.entity.admin.Room;

public interface RoomService {
    // <!----------admin------------->
    List<Room> findAllRooms();
    Room findRoomById(Long id);



    // <!----------user------------->
    List<Room> getAllRooms();
}
