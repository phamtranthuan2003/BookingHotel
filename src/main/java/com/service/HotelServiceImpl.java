package com.service;
import com.entity.admin.Hotel;
import com.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class HotelServiceImpl implements HotelService {
    @Autowired
    private HotelRepository hotelRepository;

    public List<Hotel> findAll() {
        List<Hotel> hotels = hotelRepository.findAll();
        return hotels;
    }
}
