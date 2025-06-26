package com.repository;
import com.entity.user.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByStatus(String status);
    List<Review> findByRoomId(Long roomId);
}
