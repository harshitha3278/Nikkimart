package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.Review;

import java.util.List;

public interface ReviewDAO {

    boolean addReview(int productId, int userId, int rating, String comment);

    List<Review> findByProduct(int productId);

    double getAverageRating(int productId);

    boolean hasUserReviewed(int productId, int userId);

    boolean hasCompletedOrder(int productId, int userId);
}