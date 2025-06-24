package com.entity.admin;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.entity.user.Customer;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
    private String status;
    private String note;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    public String getCheckInFormatted() {
        return checkIn != null ? checkIn.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }
    public String getCheckOutFormatted() {
        return checkOut != null ? checkOut.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }
}
