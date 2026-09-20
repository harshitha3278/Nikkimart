<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Order" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - My Orders</title>

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

        .container {
            width: 92%;
            max-width: 1050px;
            margin: 35px auto;
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

        .success-msg {
            background: #e8f7ed;
            border: 1px solid #b8e5c5;
            color: #176b35;
            padding: 13px 15px;
            border-radius: 9px;
            margin: 20px 0;
        }

        .orders-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 7px 25px rgba(0,0,0,0.07);
            margin-top: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #f1f5f3;
            color: #374151;
            padding: 16px;
            text-align: left;
        }

        td {
            padding: 17px 16px;
            border-top: 1px solid #edf0ef;
        }

        .order-id {
            font-weight: bold;
            color: #12355b;
        }

        .status {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #fff4d6;
            color: #946200;
            font-size: 12px;
            font-weight: bold;
        }

        .total {
            color: #16803c;
            font-weight: bold;
        }

        .view-btn {
            display: inline-block;
            background: #12355b;
            color: white;
            text-decoration: none;
            padding: 9px 14px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
        }

        .view-btn:hover {
            background: #0d2945;
        }

        .empty-card {
            background: white;
            border-radius: 16px;
            padding: 55px 25px;
            text-align: center;
            margin-top: 25px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.07);
        }

        .empty-icon {
            font-size: 55px;
        }

        .empty-card h2 {
            color: #12355b;
        }

        .empty-card p {
            color: #718096;
        }

        .shop-btn {
            display: inline-block;
            margin-top: 12px;
            background: #16803c;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .bottom-link {
            display: inline-block;
            margin-top: 25px;
            color: #12355b;
            text-decoration: none;
            font-weight: bold;
        }

        @media (max-width: 700px) {

            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 12px;
            }

            .container {
                width: 94%;
            }

            .orders-card {
                overflow-x: auto;
            }

            table {
                min-width: 750px;
            }

        }

    </style>

</head>

<body>

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

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<div class="container">

    <div class="page-header">

        <h1>📦 My Orders</h1>

        <p>
            Track your previous orders and review purchased products.
        </p>

    </div>


    <% if ("1".equals(request.getParameter("placed"))) { %>

        <div class="success-msg">
            ✅ Order placed successfully!
        </div>

    <% } %>


<%
    List<Order> orders =
            (List<Order>) request.getAttribute("orders");

    if (orders == null || orders.isEmpty()) {
%>

    <div class="empty-card">

        <div class="empty-icon">
            📦
        </div>

        <h2>No orders yet</h2>

        <p>
            Your placed orders will appear here.
        </p>

        <a
            class="shop-btn"
            href="<%= request.getContextPath() %>/product?action=browse">
            Start Shopping
        </a>

    </div>


<%
    } else {
%>

    <div class="orders-card">

        <table>

            <tr>

                <th>Order ID</th>
                <th>Status</th>
                <th>Total</th>
                <th>Placed On</th>
                <th>Details</th>

            </tr>


            <%
                for (Order order : orders) {
            %>

            <tr>

                <td class="order-id">
                    #<%= order.getId() %>
                </td>

                <td>

                    <span class="status">
                        <%= order.getStatus() %>
                    </span>

                </td>

                <td class="total">
                    ₹<%= order.getTotalAmount() %>
                </td>

                <td>
                    <%= order.getCreatedAt() %>
                </td>

                <td>

                    <a
                        class="view-btn"
                        href="<%= request.getContextPath() %>/order?action=view&orderId=<%= order.getId() %>">
                        View Order
                    </a>

                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>

<%
    }
%>


    <a
        class="bottom-link"
        href="<%= request.getContextPath() %>/product?action=browse">
        ← Continue Shopping
    </a>

</div>

</body>

</html>