<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Order" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Incoming Orders</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #172033;
        }

        /* NAVBAR */

        .navbar {
            height: 70px;
            background: #0f172a;
            display: flex;
            align-items: center;
            padding: 0 42px;
            gap: 28px;
            box-shadow: 0 3px 15px rgba(0,0,0,.15);
        }

        .brand {
            color: white;
            text-decoration: none;
            font-size: 23px;
            font-weight: 800;
            margin-right: auto;
        }

        .brand span {
            color: #22c55e;
        }

        .nav-link {
            color: #cbd5e1;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding: 9px 12px;
            border-radius: 7px;
        }

        .nav-link:hover {
            color: white;
            background: #1e293b;
        }

        .logout {
            background: #dc2626;
            color: white;
        }

        .logout:hover {
            background: #b91c1c;
        }

        /* PAGE */

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 42px 25px 60px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .page-header h1 {
            margin: 0 0 7px;
            font-size: 30px;
            color: #0f172a;
        }

        .page-header p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .order-badge {
            background: #dbeafe;
            color: #1d4ed8;
            padding: 9px 15px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
        }

        /* TABLE CARD */

        .table-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 22px;
            box-shadow: 0 5px 18px rgba(15,23,42,.06);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 720px;
        }

        th {
            background: #f8fafc;
            color: #475569;
            text-align: left;
            padding: 14px 15px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: .4px;
            border-bottom: 1px solid #e2e8f0;
        }

        td {
            padding: 16px 15px;
            border-bottom: 1px solid #eef2f7;
            font-size: 14px;
            color: #334155;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .order-id {
            font-weight: 800;
            color: #0f172a;
        }

        .buyer-id {
            color: #475569;
            font-weight: 600;
        }

        .amount {
            font-weight: 800;
            color: #15803d;
        }

        .date {
            color: #64748b;
            font-size: 13px;
        }

        /* STATUS */

        .status {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 20px;
            background: #fef3c7;
            color: #92400e;
            font-size: 12px;
            font-weight: 700;
        }

        /* EMPTY */

        .empty {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 60px 25px;
            text-align: center;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
        }

        .empty-icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .empty h2 {
            margin: 0 0 8px;
            color: #0f172a;
            font-size: 22px;
        }

        .empty p {
            margin: 0;
            color: #64748b;
        }

        /* BACK BUTTON */

        .actions {
            margin-top: 22px;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 17px;
            background: #0f172a;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
        }

        .back-btn:hover {
            background: #1e293b;
        }

        /* RESPONSIVE */

        @media (max-width: 700px) {

            .navbar {
                height: auto;
                padding: 15px;
                flex-wrap: wrap;
                gap: 8px;
            }

            .brand {
                width: 100%;
                margin-bottom: 5px;
            }

            .nav-link {
                font-size: 12px;
                padding: 8px;
            }

            .container {
                padding: 28px 15px 45px;
            }

            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .page-header h1 {
                font-size: 25px;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <a class="brand"
       href="<%= request.getContextPath() %>/seller-dashboard.jsp">
        🛒 Nikki<span>Mart</span>
    </a>

    <a class="nav-link"
       href="<%= request.getContextPath() %>/seller-dashboard.jsp">
        Dashboard
    </a>

    <a class="nav-link"
       href="<%= request.getContextPath() %>/product?action=seller">
        My Products
    </a>

    <a class="nav-link"
       href="<%= request.getContextPath() %>/order?action=seller">
        Orders
    </a>

    <a class="nav-link logout"
       href="<%= request.getContextPath() %>/logout">
        Logout
    </a>

</nav>


<!-- CONTENT -->

<div class="container">

    <div class="page-header">

        <div>
            <h1>Incoming Orders 📦</h1>

            <p>
                Orders placed by buyers for your products.
            </p>
        </div>

        <div class="order-badge">
            SELLER ORDERS
        </div>

    </div>


    <%
        List<Order> orders =
                (List<Order>) request.getAttribute("orders");

        if (orders == null || orders.isEmpty()) {
    %>

        <div class="empty">

            <div class="empty-icon">📭</div>

            <h2>No Incoming Orders</h2>

            <p>
                You don't have any orders for your products yet.
            </p>

        </div>

    <%
        } else {
    %>

        <div class="table-card">

            <table>

                <thead>

                    <tr>
                        <th>Order ID</th>
                        <th>Buyer ID</th>
                        <th>Status</th>
                        <th>Total Amount</th>
                        <th>Placed On</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (Order order : orders) {
                %>

                    <tr>

                        <td class="order-id">
                            #<%= order.getId() %>
                        </td>

                        <td class="buyer-id">
                            Buyer #<%= order.getBuyerId() %>
                        </td>

                        <td>
                            <span class="status">
                                <%= order.getStatus() %>
                            </span>
                        </td>

                        <td class="amount">
                            ₹<%= order.getTotalAmount() %>
                        </td>

                        <td class="date">
                            <%= order.getCreatedAt() %>
                        </td>

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        </div>

    <%
        }
    %>


    <div class="actions">

        <a class="back-btn"
           href="<%= request.getContextPath() %>/product?action=browse">
            ← Back to Products
        </a>

    </div>

</div>

</body>
</html>