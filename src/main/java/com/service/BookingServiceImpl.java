package com.service;
import com.entity.admin.Booking;
import org.springframework.stereotype.Service;
import java.util.List;
import com.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingRepository bookingRepository;
        
    @Override
    public List<Booking> findAll() {
        List<Booking> bookings = bookingRepository.findAll();
        return bookings;
    }
}
