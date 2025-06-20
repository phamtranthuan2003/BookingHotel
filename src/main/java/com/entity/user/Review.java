package com.entity.user;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.entity.admin.Hotel;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer rating;
    private String comment;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Customer user;

    @ManyToOne
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }
}
