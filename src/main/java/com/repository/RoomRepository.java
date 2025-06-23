package com.repository;

import com.entity.admin.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Long> {
    Room findByRoomNumber(String roomNumber);
}
