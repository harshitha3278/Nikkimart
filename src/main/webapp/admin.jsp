<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.nikki.nikkimart.model.User" %>
<%@ page import="com.nikki.nikkimart.model.Order" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Admin Dashboard</title>

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
            box-shadow: 0 3px 15px rgba(0,0,0,.15);
        }

        .brand {
            color: white;
            text-decoration: none;
            font-size: 23px;
            font-weight: 800;
        }

        .brand span {
            color: #22c55e;
        }

        .admin-badge {
            margin-left: auto;
            background: #7c3aed;
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .logout {
            margin-left: 15px;
            padding: 9px 15px;
            border-radius: 7px;
            background: #dc2626;
            color: white;
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
        }

        .logout:hover {
            background: #b91c1c;
        }

        /* MAIN */

        .container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 42px 25px 60px;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h1 {
            margin: 0 0 8px;
            font-size: 30px;
            color: #0f172a;
        }

        .page-header p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        /* SUMMARY */

        .summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 22px;
            box-shadow: 0 5px 18px rgba(15,23,42,.06);
        }

        .summary-card .icon {
            font-size: 25px;
            margin-bottom: 12px;
        }

        .summary-card h3 {
            margin: 0 0 5px;
            font-size: 14px;
            color: #64748b;
        }

        .summary-card .number {
            font-size: 28px;
            font-weight: 800;
            color: #0f172a;
        }

        /* SECTION */

        .section {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 24px;
            margin-bottom: 25px;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
        }

        .section-header {
            margin-bottom: 18px;
        }

        .section-header h2 {
            margin: 0 0 5px;
            font-size: 20px;
            color: #0f172a;
        }

        .section-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        /* TABLE */

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th {
            padding: 13px 14px;
            text-align: left;
            background: #f8fafc;
            color: #475569;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: .4px;
            border-bottom: 1px solid #e2e8f0;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #eef2f7;
            color: #334155;
            font-size: 14px;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .id {
            font-weight: 800;
            color: #0f172a;
        }

        /* ROLE */

        .role {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .buyer {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .seller {
            background: #dcfce7;
            color: #166534;
        }

        .admin {
            background: #ede9fe;
            color: #6d28d9;
        }

        /* STATUS */

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #fef3c7;
            color: #92400e;
            font-size: 11px;
            font-weight: 700;
        }

        /* PRICE */

        .price {
            color: #15803d;
            font-weight: 800;
        }

        /* DELETE */

        .delete-btn {
            background: #dc2626;
            color: white;
            border: none;
            padding: 7px 12px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 700;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        /* EMPTY */

        .empty {
            padding: 35px;
            background: #f8fafc;
            border-radius: 10px;
            text-align: center;
            color: #64748b;
        }

        .empty-icon {
            font-size: 32px;
            margin-bottom: 8px;
        }

        /* FOOTER */

        .footer {
            text-align: center;
            color: #94a3b8;
            font-size: 13px;
            margin-top: 30px;
        }

        /* RESPONSIVE */

        @media (max-width: 800px) {

            .navbar {
                padding: 0 18px;
            }

            .summary {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 28px 15px 45px;
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
       href="<%= request.getContextPath() %>/admin">
        🛒 Nikki<span>Mart</span>
    </a>

    <div class="admin-badge">
        ADMIN PANEL
    </div>

    <a class="logout"
       href="<%= request.getContextPath() %>/logout">
        Logout
    </a>

</nav>


<!-- MAIN -->

<div class="container">

    <div class="page-header">

        <h1>Admin Dashboard 👑</h1>

        <p>
            Manage users, orders and product listings across NikkiMart.
        </p>

    </div>


    <%
        List<User> users =
                (List<User>) request.getAttribute("users");

        List<Order> orders =
                (List<Order>) request.getAttribute("orders");

        List<Product> products =
                (List<Product>) request.getAttribute("products");

        int userCount =
                users == null ? 0 : users.size();

        int orderCount =
                orders == null ? 0 : orders.size();

        int productCount =
                products == null ? 0 : products.size();
    %>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <div class="icon">👥</div>

            <h3>Total Users</h3>

            <div class="number">
                <%= userCount %>
            </div>

        </div>


        <div class="summary-card">

            <div class="icon">📦</div>

            <h3>Total Orders</h3>

            <div class="number">
                <%= orderCount %>
            </div>

        </div>


        <div class="summary-card">

            <div class="icon">🛍️</div>

            <h3>Product Listings</h3>

            <div class="number">
                <%= productCount %>
            </div>

        </div>

    </div>


    <!-- USERS -->

    <div class="section">

        <div class="section-header">

            <h2>👥 Users</h2>

            <p>
                Registered NikkiMart accounts and their roles.
            </p>

        </div>

        <%
            if (users == null || users.isEmpty()) {
        %>

            <div class="empty">
                <div class="empty-icon">👤</div>
                No users found.
            </div>

        <%
            } else {
        %>

        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (User user : users) {
                %>

                    <tr>

                        <td class="id">
                            #<%= user.getId() %>
                        </td>

                        <td>
                            <%= user.getName() %>
                        </td>

                        <td>
                            <%= user.getEmail() %>
                        </td>

                        <td>

                            <%
                                String role = user.getRole();

                                String roleClass = "buyer";

                                if ("SELLER".equalsIgnoreCase(role)) {
                                    roleClass = "seller";
                                } else if ("ADMIN".equalsIgnoreCase(role)) {
                                    roleClass = "admin";
                                }
                            %>

                            <span class="role <%= roleClass %>">
                                <%= role %>
                            </span>

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

    </div>


    <!-- ORDERS -->

    <div class="section">

        <div class="section-header">

            <h2>📦 All Orders</h2>

            <p>
                Monitor orders placed by buyers.
            </p>

        </div>

        <%
            if (orders == null || orders.isEmpty()) {
        %>

            <div class="empty">
                <div class="empty-icon">📭</div>
                No orders found.
            </div>

        <%
            } else {
        %>

        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>
                        <th>Order ID</th>
                        <th>Buyer ID</th>
                        <th>Status</th>
                        <th>Total Amount</th>
                        <th>Created At</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (Order order : orders) {
                %>

                    <tr>

                        <td class="id">
                            #<%= order.getId() %>
                        </td>

                        <td>
                            Buyer #<%= order.getBuyerId() %>
                        </td>

                        <td>

                            <span class="status">
                                <%= order.getStatus() %>
                            </span>

                        </td>

                        <td class="price">
                            ₹<%= order.getTotalAmount() %>
                        </td>

                        <td>
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

    </div>


    <!-- PRODUCTS -->

    <div class="section">

        <div class="section-header">

            <h2>🛍️ Product Listings</h2>

            <p>
                Review and moderate products listed by sellers.
            </p>

        </div>

        <%
            if (products == null || products.isEmpty()) {
        %>

            <div class="empty">
                <div class="empty-icon">📦</div>
                No products found.
            </div>

        <%
            } else {
        %>

        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>
                        <th>ID</th>
                        <th>Seller ID</th>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Action</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    for (Product product : products) {
                %>

                    <tr>

                        <td class="id">
                            #<%= product.getId() %>
                        </td>

                        <td>
                            Seller #<%= product.getSellerId() %>
                        </td>

                        <td>
                            <strong>
                                <%= product.getName() %>
                            </strong>
                        </td>

                        <td>
                            <%= product.getCategory() %>
                        </td>

                        <td class="price">
                            ₹<%= product.getPrice() %>
                        </td>

                        <td>
                            <%= product.getStockQty() %>
                        </td>

                        <td>

                            <form
                                action="<%= request.getContextPath() %>/admin"
                                method="post"
                                onsubmit="return confirm('Remove this product?');">

                                <input
                                    type="hidden"
                                    name="action"
                                    value="deleteProduct">

                                <input
                                    type="hidden"
                                    name="productId"
                                    value="<%= product.getId() %>">

                                <button
                                    type="submit"
                                    class="delete-btn">

                                    Remove

                                </button>

                            </form>

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

    </div>


    <div class="footer">
        NikkiMart Admin Panel · Marketplace Management
    </div>

</div>

</body>

</html>