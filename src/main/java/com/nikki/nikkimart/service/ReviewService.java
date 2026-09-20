package com.nikki.nikkimart.service;

import com.nikki.nikkimart.dao.ReviewDAO;
import com.nikki.nikkimart.model.Review;

import java.util.List;

public class ReviewService {

    private final ReviewDAO reviewDAO;

    public ReviewService(ReviewDAO reviewDAO) {
        this.reviewDAO = reviewDAO;
    }

    public boolean addReview(int productId,
                             int userId,
                             int rating,
                             String comment) {

        if (rating < 1 || rating > 5) {
            return false;
        }

        if (!reviewDAO.hasCompletedOrder(productId, userId)) {
            return false;
        }

        if (reviewDAO.hasUserReviewed(productId, userId)) {
            return false;
        }

        if (comment == null) {
            comment = "";
        }

        comment = comment.trim();

        return reviewDAO.addReview(
                productId,
                userId,
                rating,
                comment
        );
    }

    public List<Review> getReviews(int productId) {
        return reviewDAO.findByProduct(productId);
    }

    public double getAverageRating(int productId) {
        return reviewDAO.getAverageRating(productId);
    }

    public boolean hasUserReviewed(int productId, int userId) {
        return reviewDAO.hasUserReviewed(productId, userId);
    }

    public boolean canReview(int productId, int userId) {

        return reviewDAO.hasCompletedOrder(productId, userId)
                && !reviewDAO.hasUserReviewed(productId, userId);
    }
}