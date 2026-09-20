<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Browse Products - Farm Mart</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #222;
        }

        /* HEADER */

        .header {
            background: #12355b;
            color: white;
            padding: 18px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .nav {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .nav a {
            text-decoration: none;
            color: white;
            padding: 9px 14px;
            border-radius: 6px;
            background: rgba(255,255,255,0.12);
            font-size: 14px;
        }

        .nav a:hover {
            background: rgba(255,255,255,0.25);
        }

        /* MAIN */

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 30px auto;
        }

        .page-title {
            margin-bottom: 20px;
        }

        .page-title h1 {
            color: #12355b;
            margin-bottom: 5px;
        }

        .page-title p {
            color: #666;
        }

        /* FILTER */

        .filter-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .filter-form {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .filter-form input,
        .filter-form select {
            padding: 11px 13px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .filter-form input {
            flex: 1;
            min-width: 220px;
        }

        .filter-form select {
            min-width: 170px;
        }

        .filter-btn {
            background: #12355b;
            color: white;
            border: none;
            padding: 11px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .filter-btn:hover {
            background: #0d2945;
        }

        .clear-btn {
            background: #e9ecef;
            color: #333;
            text-decoration: none;
            padding: 11px 20px;
            border-radius: 6px;
            font-size: 14px;
        }

        /* PRODUCTS */

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 22px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            transition: transform 0.2s ease;
        }

        .product-card:hover {
            transform: translateY(-3px);
        }

        .product-image {
            width: 100%;
            height: 210px;
            object-fit: cover;
            background: #eee;
            display: block;
        }

        .product-info {
            padding: 18px;
        }

        .product-name {
            font-size: 19px;
            font-weight: bold;
            color: #12355b;
            margin-bottom: 7px;
        }

        .product-category {
            display: inline-block;
            background: #e8f3ff;
            color: #1769aa;
            padding: 4px 9px;
            border-radius: 20px;
            font-size: 12px;
            margin-bottom: 10px;
        }

        .product-description {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
            min-height: 42px;
            margin-bottom: 12px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            color: #16803c;
            margin-bottom: 6px;
        }

        .stock {
            font-size: 13px;
            color: #666;
            margin-bottom: 15px;
        }

        .stock.available {
            color: #16803c;
        }

        .stock.empty {
            color: #d32f2f;
            font-weight: bold;
        }

        /* ACTIONS */

        .actions {
            display: flex;
            gap: 8px;
            align-items: stretch;
        }

        .btn {
            border: none;
            text-decoration: none;
            padding: 10px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .btn-primary {
            background: #12355b;
            color: white;
            flex: 1;
        }

        .btn-primary:hover {
            background: #0d2945;
        }

        .btn-cart {
            background: #16803c;
            color: white;
            width: 100%;
        }

        .btn-cart:hover {
            background: #116630;
        }

        .cart-form {
            flex: 1;
            margin: 0;
            display: flex;
        }

        .cart-form .btn {
            width: 100%;
        }

        .out-stock {
            background: #ddd;
            color: #777;
            flex: 1;
        }

        /* EMPTY */

        .empty-message {
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 10px;
            color: #666;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

        /* MOBILE */

        @media (max-width: 600px) {

            .header {
                padding: 15px 20px;
            }

            .container {
                width: 94%;
            }

            .filter-form {
                flex-direction: column;
            }

            .filter-form input,
            .filter-form select,
            .filter-btn,
            .clear-btn {
                width: 100%;
            }

            .products-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>

<!-- HEADER -->

<div class="header">

    <div class="logo">
        🌾 Farm Mart
    </div>

    <div class="nav">

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


<!-- MAIN -->

<div class="container">

    <div class="page-title">

        <h1>Browse Products</h1>

        <p>
            Fresh products from our sellers
        </p>

    </div>


    <!-- SEARCH / FILTER -->

    <div class="filter-box">

        <form
            class="filter-form"
            method="get"
            action="<%= request.getContextPath() %>/product">

            <input
                type="hidden"
                name="action"
                value="browse">

            <input
                type="text"
                name="keyword"
                placeholder="Search products..."
                value="<%= request.getAttribute("keyword") != null
                        ? request.getAttribute("keyword")
                        : "" %>">

            <select name="category">

                <option value="">All Categories</option>

                <option value="Keerai"
                    <%= "Keerai".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Keerai
                </option>

                <option value="Vegetables"
                    <%= "Vegetables".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Vegetables
                </option>

                <option value="Fruits"
                    <%= "Fruits".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Fruits
                </option>

                <option value="Grains"
                    <%= "Grains".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Grains
                </option>

                <option value="Pulses"
                    <%= "Pulses".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Pulses
                </option>

                <option value="Spices"
                    <%= "Spices".equals(request.getAttribute("category")) ? "selected" : "" %>>
                    Spices
                </option>

            </select>

            <button
                type="submit"
                class="filter-btn">
                Search
            </button>

            <a
                href="<%= request.getContextPath() %>/product?action=browse"
                class="clear-btn">
                Clear
            </a>

        </form>

    </div>


    <!-- PRODUCTS -->

    <%
        List<Product> products =
                (List<Product>) request.getAttribute("products");
    %>


    <% if (products == null || products.isEmpty()) { %>

        <div class="empty-message">

            <h3>No products found</h3>

            <p>
                Try another keyword or category.
            </p>

        </div>

    <% } else { %>


        <div class="products-grid">

            <% for (Product p : products) { %>

                <div class="product-card">

                    <!-- PRODUCT IMAGE -->

                    <%
                        String imageUrl = p.getImageUrl();

                        if (imageUrl == null || imageUrl.trim().isEmpty()) {
                            imageUrl =
                                "https://via.placeholder.com/500x400?text=Farm+Mart";
                        }
                    %>

                    <img
                        class="product-image"
                        src="<%= imageUrl %>"
                        alt="<%= p.getName() %>"
                        onerror="this.src='https://via.placeholder.com/500x400?text=No+Image';">


                    <div class="product-info">

                        <!-- NAME -->

                        <div class="product-name">
                            <%= p.getName() %>
                        </div>


                        <!-- CATEGORY -->

                        <span class="product-category">
                            <%= p.getCategory() %>
                        </span>


                        <!-- DESCRIPTION -->

                        <div class="product-description">

                            <%
                                String description = p.getDescription();

                                if (description == null ||
                                    description.trim().isEmpty()) {
                            %>

                                Fresh quality product from our trusted seller.

                            <% } else { %>

                                <%= description %>

                            <% } %>

                        </div>


                        <!-- PRICE -->

                        <div class="price">

                            ₹<%= p.getPrice() %>

                        </div>


                        <!-- STOCK -->

                        <% if (p.getStockQty() > 0) { %>

                            <div class="stock available">

                                Stock:
                                <%= p.getStockQty() %>

                            </div>

                        <% } else { %>

                            <div class="stock empty">

                                Out of Stock

                            </div>

                        <% } %>


                        <!-- ACTIONS -->

                        <div class="actions">

                            <!-- VIEW -->

                            <a
                                class="btn btn-primary"
                                href="<%= request.getContextPath() %>/product?action=view&id=<%= p.getId() %>">

                                View

                            </a>


                            <!-- ADD TO CART -->

                            <% if (p.getStockQty() > 0) { %>

                                <form
                                    class="cart-form"
                                    method="post"
                                    action="<%= request.getContextPath() %>/cart">

                                    <input
                                        type="hidden"
                                        name="action"
                                        value="add">

                                    <input
                                        type="hidden"
                                        name="productId"
                                        value="<%= p.getId() %>">

                                    <input
                                        type="hidden"
                                        name="quantity"
                                        value="1">

                                    <button
                                        type="submit"
                                        class="btn btn-cart">

                                        Add to Cart

                                    </button>

                                </form>

                            <% } else { %>

                                <span class="btn out-stock">

                                    Out of Stock

                                </span>

                            <% } %>

                        </div>

                    </div>

                </div>

            <% } %>

        </div>

    <% } %>

</div>

</body>
</html>