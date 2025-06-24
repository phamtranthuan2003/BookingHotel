package com.service;

import com.entity.user.Review;
import java.util.List;

public interface ReviewService {
    List<Review> findAllReviews();
    void hideReviewById(Long id);
    void showReviewById(Long id);
    void deleteReviewById(Long id);
    List<Review> findAllReviewsByStatus(String status);

}
