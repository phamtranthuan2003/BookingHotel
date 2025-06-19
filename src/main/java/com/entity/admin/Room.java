package com.entity.admin;

import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String roomNumber;
    private String type; // Single, Double, Suite
    private Integer capacity;
    private BigDecimal price;
    private Boolean isAvailable;

    @ManyToOne
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;

    // Getters/setters nếu không dùng Lombok
}
