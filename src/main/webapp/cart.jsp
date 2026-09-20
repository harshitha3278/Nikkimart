<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - My Cart</title>

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

        /* CONTAINER */

        .container {
            width: 92%;
            max-width: 1100px;
            margin: 35px auto;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0;
            color: #12355b;
            font-size: 30px;
        }

        .page-header p {
            color: #718096;
            margin-top: 7px;
        }

        /* CART CARD */

        .cart-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 7px 25px rgba(0,0,0,0.07);
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th {
            background: #f1f5f3;
            color: #374151;
            text-align: left;
            padding: 16px;
            font-size: 14px;
        }

        .cart-table td {
            padding: 18px 16px;
            border-top: 1px solid #edf0ef;
            vertical-align: middle;
        }

        .product-name {
            font-weight: bold;
            color: #12355b;
            font-size: 16px;
        }

        .price {
            color: #16803c;
            font-weight: bold;
        }

        .subtotal {
            font-weight: bold;
            color: #12355b;
        }

        /* QUANTITY */

        .quantity-form {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .quantity-input {
            width: 70px;
            padding: 9px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            text-align: center;
            font-size: 14px;
        }

        .update-btn {
            border: none;
            background: #12355b;
            color: white;
            padding: 9px 12px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 13px;
        }

        .update-btn:hover {
            background: #0d2945;
        }

        /* REMOVE */

        .remove-btn {
            border: none;
            background: #fff0f0;
            color: #c62828;
            padding: 9px 13px;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .remove-btn:hover {
            background: #ffe0e0;
        }

        /* TOTAL */

        .total-row td {
            background: #f8faf9;
            border-top: 2px solid #dfe7e2;
            font-size: 18px;
            font-weight: bold;
        }

        .total-label {
            text-align: right;
            color: #374151;
        }

        .total-price {
            color: #16803c;
            font-size: 23px;
        }

        /* BOTTOM ACTIONS */

        .cart-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px;
            gap: 15px;
        }

        .continue-btn {
            text-decoration: none;
            color: #12355b;
            font-weight: bold;
            padding: 12px 18px;
            border-radius: 8px;
            background: #eef3f7;
        }

        .continue-btn:hover {
            background: #e2e9ef;
        }

        .order-btn {
            border: none;
            background: #16803c;
            color: white;
            padding: 13px 24px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
        }

        .order-btn:hover {
            background: #116630;
        }

        /* EMPTY CART */

        .empty-card {
            background: white;
            border-radius: 16px;
            padding: 60px 25px;
            text-align: center;
            box-shadow: 0 7px 25px rgba(0,0,0,0.07);
        }

        .empty-icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .empty-card h2 {
            color: #12355b;
            margin-bottom: 8px;
        }

        .empty-card p {
            color: #718096;
            margin-bottom: 25px;
        }

        .browse-btn {
            display: inline-block;
            background: #16803c;
            color: white;
            text-decoration: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
        }

        .browse-btn:hover {
            background: #116630;
        }

        /* MOBILE */

        @media (max-width: 750px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 12px;
            }

            .container {
                width: 94%;
            }

            .cart-card {
                overflow-x: auto;
            }

            .cart-table {
                min-width: 700px;
            }

            .cart-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .continue-btn,
            .order-btn {
                text-align: center;
            }

        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        🛒 NikkiMart
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/product?action=browse">
            Products
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

<%
    List<CartItem> items =
            (List<CartItem>) request.getAttribute("items");

    BigDecimal total =
            (BigDecimal) request.getAttribute("total");
%>


    <div class="page-header">

        <h1>🛒 My Cart</h1>

        <p>
            Review your items before placing your order.
        </p>

    </div>


<%
    if (items == null || items.isEmpty()) {
%>

    <!-- EMPTY CART -->

    <div class="empty-card">

        <div class="empty-icon">
            🛒
        </div>

        <h2>Your cart is empty</h2>

        <p>
            Looks like you haven't added anything yet.
        </p>

        <a
            class="browse-btn"
            href="<%= request.getContextPath() %>/product?action=browse">
            Browse Products
        </a>

    </div>


<%
    } else {
%>

    <!-- CART -->

    <div class="cart-card">

        <table class="cart-table">

            <tr>

                <th>Product</th>

                <th>Price</th>

                <th>Quantity</th>

                <th>Subtotal</th>

                <th>Actions</th>

            </tr>


            <%
                for (CartItem item : items) {
            %>

            <tr>

                <td>

                    <div class="product-name">
                        <%= item.getProductName() %>
                    </div>

                </td>


                <td>

                    <span class="price">
                        ₹<%= item.getProductPrice() %>
                    </span>

                </td>


                <td>

                    <form
                        class="quantity-form"
                        action="<%= request.getContextPath() %>/cart"
                        method="post">

                        <input
                            type="hidden"
                            name="action"
                            value="update">

                        <input
                            type="hidden"
                            name="cartItemId"
                            value="<%= item.getId() %>">

                        <input
                            class="quantity-input"
                            type="number"
                            name="quantity"
                            min="1"
                            value="<%= item.getQuantity() %>"
                            required>

                        <button
                            class="update-btn"
                            type="submit">
                            Update
                        </button>

                    </form>

                </td>


                <td>

                    <span class="subtotal">
                        ₹<%= item.getSubtotal() %>
                    </span>

                </td>


                <td>

                    <form
                        action="<%= request.getContextPath() %>/cart"
                        method="post"
                        onsubmit="return confirm('Remove this item?');">

                        <input
                            type="hidden"
                            name="action"
                            value="remove">

                        <input
                            type="hidden"
                            name="cartItemId"
                            value="<%= item.getId() %>">

                        <button
                            type="submit"
                            class="remove-btn">
                            🗑 Remove
                        </button>

                    </form>

                </td>

            </tr>

            <%
                }
            %>


            <tr class="total-row">

                <td
                    colspan="3"
                    class="total-label">
                    Cart Total
                </td>

                <td
                    colspan="2"
                    class="total-price">
                    ₹<%= total %>
                </td>

            </tr>

        </table>


        <div class="cart-actions">

            <a
                class="continue-btn"
                href="<%= request.getContextPath() %>/product?action=browse">
                ← Continue Shopping
            </a>


            <form
                action="<%= request.getContextPath() %>/order"
                method="post">

                <input
                    type="hidden"
                    name="action"
                    value="place">

                <button
                    type="submit"
                    class="order-btn">
                    🛍 Place Order
                </button>

            </form>

        </div>

    </div>

<%
    }
%>

</div>

</body>

</html>