package com.entity.admin;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.entity.user.Customer;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate checkIn;
    private LocalDate checkOut;
    private BigDecimal totalPrice;
    private String status; // PENDING, CONFIRMED, CANCELLED

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Customer user;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;
}
