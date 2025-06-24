package com.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.service.ReviewService;
import com.entity.user.Review;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ReviewsController {

    @Autowired
    private ReviewService reviewService;

    // Hiển thị tất cả đánh giá
    @GetMapping("/reviews")
    public String reviews(Model model) {
        List<Review> reviews = reviewService.findAllReviews();
        model.addAttribute("reviews", reviews);
        model.addAttribute("status", "ALL");
        return "admin/review/reviewsList";
    }

    @GetMapping("/reviewsHide/{id}")
    public String reviewsHide(@PathVariable Long id, Model model) {
        reviewService.hideReviewById(id);
        List<Review> reviews = reviewService.findAllReviewsByStatus("HIDE");
        model.addAttribute("reviews", reviews);
        model.addAttribute("status", "HIDE");
        return "admin/review/reviewsList";
    }

    @GetMapping("/reviewsShow/{id}")
    public String reviewsShow(@PathVariable Long id, Model model) {
        reviewService.showReviewById(id);
        List<Review> reviews = reviewService.findAllReviewsByStatus("SHOW");
        model.addAttribute("reviews", reviews);
        model.addAttribute("status", "SHOW");
        return "admin/review/reviewsList";
    }
    @GetMapping("/deleteReview/{id}")
    public String deleteReview(@PathVariable Long id) {
        reviewService.deleteReviewById(id);
        return "redirect:/admin/reviews";
    }
}
