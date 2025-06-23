package com.repository;

import com.entity.admin.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HotelRepository extends JpaRepository<Hotel, Long> {
    Hotel findByName(String name);
}
