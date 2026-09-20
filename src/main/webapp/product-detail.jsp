<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.nikki.nikkimart.model.Product" %>
<%@ page import="com.nikki.nikkimart.model.Review" %>
<%@ page import="com.nikki.nikkimart.model.User" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>NikkiMart - Product Details</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f8f6;
            color: #263238;
        }

        /* NAVBAR */

        .navbar {
            background: #12355b;
            color: white;
            padding: 17px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 10px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 9px 13px;
            border-radius: 7px;
            background: rgba(255,255,255,0.12);
            font-size: 14px;
        }

        .nav-links a:hover {
            background: rgba(255,255,255,0.23);
        }

        /* MAIN */

        .container {
            width: 92%;
            max-width: 1050px;
            margin: 35px auto;
        }

        .product-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
        }

        .product-top {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
        }

        /* IMAGE */

        .image-box {
            background: #f4f7f5;
            border-radius: 15px;
            min-height: 350px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .product-image {
            width: 100%;
            max-width: 400px;
            height: 330px;
            object-fit: contain;
            border-radius: 12px;
        }

        /* PRODUCT INFO */

        .product-info h1 {
            margin: 0 0 12px;
            color: #12355b;
            font-size: 32px;
        }

        .category {
            display: inline-block;
            background: #e8f3ff;
            color: #1769aa;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .description {
            color: #667085;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .price {
            font-size: 30px;
            font-weight: bold;
            color: #16803c;
            margin: 15px 0 8px;
        }

        .stock {
            font-size: 14px;
            color: #16803c;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .rating-box {
            background: #fff8e7;
            padding: 12px 15px;
            border-radius: 10px;
            display: inline-block;
            margin-top: 8px;
        }

        .rating-number {
            font-size: 19px;
            font-weight: bold;
        }

        /* MESSAGES */

        .message-success {
            margin-top: 25px;
            padding: 13px 15px;
            background: #e8f7ed;
            border: 1px solid #b8e5c5;
            color: #176b35;
            border-radius: 9px;
        }

        .message-error {
            margin-top: 25px;
            padding: 13px 15px;
            background: #fff0f0;
            border: 1px solid #f3c2c2;
            color: #a52828;
            border-radius: 9px;
        }

        /* REVIEWS */

        .review-section {
            margin-top: 35px;
            padding-top: 30px;
            border-top: 1px solid #e3e7ea;
        }

        .review-section h2 {
            color: #12355b;
            margin-bottom: 20px;
        }

        .review-form {
            background: #f8faf9;
            padding: 22px;
            border-radius: 12px;
            max-width: 650px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        select,
        textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #d0d7dc;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        select:focus,
        textarea:focus {
            outline: none;
            border-color: #16803c;
        }

        .submit-btn {
            border: none;
            background: #16803c;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #116630;
        }

        .login-btn {
            display: inline-block;
            background: #12355b;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 8px;
            margin-top: 8px;
        }

        /* REVIEW CARDS */

        .review-card {
            background: #f8faf9;
            padding: 18px;
            border-radius: 12px;
            margin-top: 14px;
            border: 1px solid #e6ebe8;
        }

        .review-user {
            font-weight: bold;
            color: #12355b;
        }

        .stars {
            font-size: 19px;
            margin: 7px 0;
        }

        .review-comment {
            color: #4b5563;
            line-height: 1.5;
        }

        .review-date {
            color: #8a9299;
            font-size: 12px;
        }

        /* BACK */

        .back-link {
            display: inline-block;
            margin-top: 28px;
            color: #12355b;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 750px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 12px;
            }

            .product-top {
                grid-template-columns: 1fr;
                gap: 25px;
            }

            .product-card {
                padding: 22px;
            }

            .image-box {
                min-height: 260px;
            }

            .product-image {
                height: 250px;
            }

            .product-info h1 {
                font-size: 26px;
            }

        }

    </style>

</head>

<body>

<%
    Product product =
            (Product) request.getAttribute("product");

    List<Review> reviews =
            (List<Review>) request.getAttribute("reviews");

    Double avgRating =
            (Double) request.getAttribute("avgRating");

    Boolean canReview =
            (Boolean) request.getAttribute("canReview");

    Boolean alreadyReviewed =
            (Boolean) request.getAttribute("alreadyReviewed");

    User currentUser =
            (User) session.getAttribute("user");
%>


<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        🛒 NikkiMart
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/product?action=browse">
            Products
        </a>

        <a href="<%= request.getContextPath() %>/cart">
            🛒 Cart
        </a>

        <a href="<%= request.getContextPath() %>/order?action=history">
            Orders
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<div class="container">

    <div class="product-card">

        <!-- PRODUCT -->

        <div class="product-top">

            <div class="image-box">

                <%
                    if (product.getImageUrl() != null &&
                        !product.getImageUrl().isBlank()) {
                %>

                    <img
                        src="<%= product.getImageUrl() %>"
                        alt="<%= product.getName() %>"
                        class="product-image">

                <%
                    } else {
                %>

                    <div style="font-size:70px;">
                        🥬
                    </div>

                <%
                    }
                %>

            </div>


            <div class="product-info">

                <span class="category">
                    <%= product.getCategory() %>
                </span>

                <h1>
                    <%= product.getName() %>
                </h1>

                <p class="description">

                    <%
                        if (product.getDescription() != null &&
                            !product.getDescription().isBlank()) {
                    %>

                        <%= product.getDescription() %>

                    <%
                        } else {
                    %>

                        Fresh quality product from our trusted seller.

                    <%
                        }
                    %>

                </p>


                <div class="price">
                    ₹<%= product.getPrice() %>
                </div>


                <%
                    if (product.getStockQty() > 0) {
                %>

                    <div class="stock">
                        ✓ <%= product.getStockQty() %> items available
                    </div>

                <%
                    } else {
                %>

                    <div style="color:#d32f2f;font-weight:bold;">
                        ✕ Out of Stock
                    </div>

                <%
                    }
                %>


                <div class="rating-box">

                    ⭐

                    <span class="rating-number">

                    <%
                        if (avgRating != null && avgRating > 0) {
                    %>

                        <%= String.format("%.1f", avgRating) %> / 5

                    <%
                        } else {
                    %>

                        No ratings yet

                    <%
                        }
                    %>

                    </span>

                </div>

            </div>

        </div>


        <!-- REVIEW STATUS -->

        <%
            String reviewStatus =
                    request.getParameter("review");

            if ("success".equals(reviewStatus)) {
        %>

            <div class="message-success">
                ⭐ Review submitted successfully!
            </div>

        <%
            }

            if ("failed".equals(reviewStatus)) {
        %>

            <div class="message-error">
                Review could not be submitted.
                You need a completed order containing this product,
                and you can submit only one review.
            </div>

        <%
            }
        %>


        <!-- WRITE REVIEW -->

        <div class="review-section">

            <h2>⭐ Write a Review</h2>

            <%
                if (currentUser == null) {
            %>

                <p>
                    Please login to write a review.
                </p>

                <a
                    class="login-btn"
                    href="<%= request.getContextPath() %>/login.jsp">
                    Login
                </a>


            <%
                } else if (Boolean.TRUE.equals(canReview)) {
            %>

                <form
                    class="review-form"
                    action="<%= request.getContextPath() %>/review"
                    method="post">

                    <input
                        type="hidden"
                        name="productId"
                        value="<%= product.getId() %>">


                    <div class="form-group">

                        <label>
                            Rating
                        </label>

                        <select
                            name="rating"
                            required>

                            <option value="">
                                Select Rating
                            </option>

                            <option value="5">
                                ⭐⭐⭐⭐⭐
                            </option>

                            <option value="4">
                                ⭐⭐⭐⭐
                            </option>

                            <option value="3">
                                ⭐⭐⭐
                            </option>

                            <option value="2">
                                ⭐⭐
                            </option>

                            <option value="1">
                                ⭐
                            </option>

                        </select>

                    </div>


                    <div class="form-group">

                        <label>
                            Comment
                        </label>

                        <textarea
                            name="comment"
                            rows="5"
                            maxlength="500"
                            placeholder="Share your experience..."
                            required></textarea>

                    </div>


                    <button
                        type="submit"
                        class="submit-btn">
                        ⭐ Submit Review
                    </button>

                </form>


            <%
                } else if (Boolean.TRUE.equals(alreadyReviewed)) {
            %>

                <p>
                    ✅ You have already reviewed this product.
                </p>


            <%
                } else {
            %>

                <p>
                    🔒 You can review this product after
                    completing an order containing it.
                </p>

            <%
                }
            %>

        </div>


        <!-- CUSTOMER REVIEWS -->

        <div class="review-section">

            <h2>💬 Customer Reviews</h2>


            <%
                if (reviews == null || reviews.isEmpty()) {
            %>

                <p style="color:#777;">
                    No reviews yet. Be the first to review this product!
                </p>


            <%
                } else {

                    for (Review review : reviews) {
            %>

                <div class="review-card">

                    <div class="review-user">
                        <%= review.getUserName() %>
                    </div>


                    <div class="stars">

                        <%
                            for (int i = 0;
                                 i < review.getRating();
                                 i++) {
                        %>

                            ⭐

                        <%
                            }
                        %>

                    </div>


                    <div class="review-comment">
                        <%= review.getComment() %>
                    </div>


                    <div class="review-date">
                        <%= review.getCreatedAt() %>
                    </div>

                </div>

            <%
                    }
                }
            %>

        </div>


        <a
            class="back-link"
            href="<%= request.getContextPath() %>/product?action=browse">
            ← Back to Products
        </a>

    </div>

</div>

</body>

</html>