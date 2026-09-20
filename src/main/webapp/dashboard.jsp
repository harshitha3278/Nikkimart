<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.nikki.nikkimart.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>NikkiMart - Dashboard</title>

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
            padding: 0 45px;
            box-shadow: 0 3px 15px rgba(0,0,0,.15);
        }

        .brand {
            color: white;
            font-size: 24px;
            font-weight: 800;
        }

        .brand span {
            color: #22c55e;
        }

        .nav-links {
            margin-left: auto;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            padding: 9px 13px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-links a:hover {
            background: #1e293b;
            color: white;
        }

        .logout {
            background: #dc2626 !important;
            color: white !important;
        }

        .logout:hover {
            background: #b91c1c !important;
        }

        /* MAIN */

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 45px 25px;
        }

        .welcome {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
        }

        .welcome h1 {
            margin: 0 0 8px;
            font-size: 30px;
            color: #0f172a;
        }

        .welcome h1 span {
            color: #16a34a;
        }

        .welcome p {
            margin: 0;
            color: #64748b;
            font-size: 15px;
        }

        .role {
            display: inline-block;
            margin-top: 16px;
            padding: 6px 12px;
            border-radius: 20px;
            background: #dcfce7;
            color: #166534;
            font-size: 12px;
            font-weight: 700;
        }

        /* CARDS */

        .section-title {
            margin: 30px 0 15px;
            font-size: 20px;
            color: #0f172a;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
            transition: .2s;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 9px 25px rgba(15,23,42,.09);
        }

        .icon {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .card h3 {
            margin: 0 0 8px;
            font-size: 18px;
            color: #172033;
        }

        .card p {
            margin: 0 0 20px;
            color: #64748b;
            font-size: 13px;
            line-height: 1.6;
        }

        .button {
            display: inline-block;
            text-decoration: none;
            background: #16a34a;
            color: white;
            padding: 10px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
        }

        .button:hover {
            background: #15803d;
        }

        .seller-card {
            border-top: 4px solid #16a34a;
        }

        /* INFO */

        .info {
            margin-top: 25px;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            border-radius: 14px;
            padding: 20px;
        }

        .info h3 {
            margin: 0 0 7px;
            color: #1e3a8a;
            font-size: 16px;
        }

        .info p {
            margin: 0;
            color: #475569;
            font-size: 13px;
        }

        /* FOOTER */

        .footer {
            margin-top: 30px;
            background: #0f172a;
            color: #94a3b8;
            text-align: center;
            padding: 22px;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 800px) {

            .navbar {
                height: auto;
                padding: 16px 20px;
                flex-wrap: wrap;
                gap: 12px;
            }

            .nav-links {
                margin-left: 0;
                flex-wrap: wrap;
            }

            .grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="brand">
        🛒 Nikki<span>Mart</span>
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/index.jsp">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/product?action=browse">
            Browse Products
        </a>

        <% if ("SELLER".equals(user.getRole())) { %>

            <a href="<%= request.getContextPath() %>/product?action=myProducts">
                My Products
            </a>

            <a href="<%= request.getContextPath() %>/product?action=addForm">
                Add Product
            </a>

        <% } %>

        <a href="<%= request.getContextPath() %>/logout"
           class="logout">
            Logout
        </a>

    </div>

</nav>


<!-- MAIN -->

<main class="container">

    <section class="welcome">

        <h1>
            Welcome, <span><%= user.getName() %></span> 👋
        </h1>

        <p>
            Manage your NikkiMart account and explore the marketplace.
        </p>

        <span class="role">
            <%= user.getRole() %>
        </span>

    </section>


    <h2 class="section-title">
        Quick Actions
    </h2>


    <div class="grid">

        <!-- SHOP -->

        <div class="card">

            <div class="icon">
                🛍️
            </div>

            <h3>
                Browse Products
            </h3>

            <p>
                Explore fresh products from sellers
                and find something you like.
            </p>

            <a href="<%= request.getContextPath() %>/product?action=browse"
               class="button">
                Browse Now
            </a>

        </div>


        <!-- CART -->

        <div class="card">

            <div class="icon">
                🛒
            </div>

            <h3>
                My Cart
            </h3>

            <p>
                View your selected products and
                continue to checkout.
            </p>

            <a href="<%= request.getContextPath() %>/cart"
               class="button">
                View Cart
            </a>

        </div>


        <!-- ORDERS -->

        <div class="card">

            <div class="icon">
                📦
            </div>

            <h3>
                My Orders
            </h3>

            <p>
                Track your orders and view your
                previous purchases.
            </p>

            <a href="<%= request.getContextPath() %>/order?action=history"
               class="button">
                View Orders
            </a>

        </div>


        <% if ("SELLER".equals(user.getRole())) { %>

        <!-- SELLER PRODUCTS -->

        <div class="card seller-card">

            <div class="icon">
                🌱
            </div>

            <h3>
                My Products
            </h3>

            <p>
                Add, edit and manage products
                listed in your store.
            </p>

            <a href="<%= request.getContextPath() %>/product?action=myProducts"
               class="button">
                Manage Products
            </a>

        </div>


        <!-- ADD PRODUCT -->

        <div class="card seller-card">

            <div class="icon">
                ➕
            </div>

            <h3>
                Add Product
            </h3>

            <p>
                Add a new product to your
                NikkiMart store.
            </p>

            <a href="<%= request.getContextPath() %>/product?action=addForm"
               class="button">
                Add Product
            </a>

        </div>


        <!-- SELLER ORDERS -->

        <div class="card seller-card">

            <div class="icon">
                📋
            </div>

            <h3>
                Seller Orders
            </h3>

            <p>
                View incoming customer orders
                for your products.
            </p>

            <a href="<%= request.getContextPath() %>/order?action=seller"
               class="button">
                View Orders
            </a>

        </div>

        <% } %>

    </div>


    <div class="info">

        <h3>
            🔒 Your Account
        </h3>

        <p>
            You are signed in as
            <strong><%= user.getEmail() %></strong>.
            Keep your account credentials secure.
        </p>

    </div>

</main>


<footer class="footer">

    © 2026 NikkiMart · Farm Fresh Products Marketplace

</footer>

</body>

</html>