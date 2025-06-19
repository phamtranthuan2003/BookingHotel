package com.entity.user;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.entity.admin.Booking;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Entity
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private BigDecimal amount;
    private String paymentMethod; // CreditCard, Momo, etc.
    private String paymentStatus; // PAID, FAILED
    private LocalDateTime paymentDate;

    @OneToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;

    @PrePersist
    public void prePersist() {
        this.paymentDate = LocalDateTime.now();
    }
}
