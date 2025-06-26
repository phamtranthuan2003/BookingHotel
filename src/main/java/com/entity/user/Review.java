package com.entity.user;

import lombok.Data;
import lombok.NoArgsConstructor;
import com.entity.admin.Hotel;
import com.entity.admin.Room;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    private String status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }
    public String getCreatedAtFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return createdAt != null ? createdAt.format(formatter) : "";
    }

}
