package com.nikki.nikkimart.controller;

import com.nikki.nikkimart.dao.ReviewDAOImpl;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {

    private ReviewService reviewService;

    @Override
    public void init() {
        reviewService =
                new ReviewService(new ReviewDAOImpl());
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() +
                            "/login.jsp"
            );
            return;
        }

        User loggedInUser =
                (User) session.getAttribute("user");

        int userId =
                loggedInUser.getId();

        String productIdParam =
                request.getParameter("productId");

        String ratingParam =
                request.getParameter("rating");

        String comment =
                request.getParameter("comment");

        if (productIdParam == null ||
                ratingParam == null) {

            response.sendRedirect(
                    request.getContextPath() +
                            "/product?action=browse"
            );
            return;
        }

        try {

            int productId =
                    Integer.parseInt(productIdParam);

            int rating =
                    Integer.parseInt(ratingParam);

            boolean success =
                    reviewService.addReview(
                            productId,
                            userId,
                            rating,
                            comment
                    );

            if (success) {

                response.sendRedirect(
                        request.getContextPath() +
                                "/product?action=view&id=" +
                                productId +
                                "&review=success"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath() +
                                "/product?action=view&id=" +
                                productId +
                                "&review=failed"
                );
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid review data"
            );
        }
    }
}