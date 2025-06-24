package com.service;

import com.entity.user.Review;
import com.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Override
    public List<Review> findAllReviews() {
        return reviewRepository.findAll();
    }

    @Override
    public List<Review> findAllReviewsByStatus(String status) {
        return reviewRepository.findByStatus(status);
    }

    @Override
    public void hideReviewById(Long id) {
        Review review = reviewRepository.findById(id).orElse(null);
        if (review != null) {
            review.setStatus("HIDE");
            reviewRepository.save(review);
        }
    }

    @Override
    public void showReviewById(Long id) {
        Review review = reviewRepository.findById(id).orElse(null);
        if (review != null) {
            review.setStatus("SHOW");
            reviewRepository.save(review);
        }
    }
    @Override
    public void deleteReviewById(Long id) {
        reviewRepository.deleteById(id);
    }
}
