<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null || !"SELLER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Seller Dashboard</title>

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
            font-size: 23px;
            font-weight: 800;
            margin-right: auto;
            text-decoration: none;
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
            color: white;
        }

        /* MAIN */

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 42px 25px 60px;
        }

        .welcome {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
        }

        .welcome h1 {
            margin: 0 0 8px;
            font-size: 30px;
            color: #0f172a;
        }

        .welcome p {
            margin: 0;
            color: #64748b;
            font-size: 15px;
        }

        .seller-badge {
            background: #dcfce7;
            color: #166534;
            padding: 9px 15px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
        }

        /* STAT CARDS */

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
            margin-bottom: 32px;
        }

        .card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 5px 18px rgba(15,23,42,.06);
            transition: .2s;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 9px 24px rgba(15,23,42,.10);
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #ecfdf5;
            font-size: 23px;
        }

        .card h3 {
            margin: 18px 0 8px;
            font-size: 19px;
            color: #172033;
        }

        .card p {
            margin: 0 0 20px;
            color: #64748b;
            line-height: 1.5;
            font-size: 14px;
        }

        .action-btn {
            display: inline-block;
            padding: 10px 17px;
            border-radius: 8px;
            background: #16a34a;
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
        }

        .action-btn:hover {
            background: #15803d;
        }

        /* QUICK ACTIONS */

        .section {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
        }

        .section-header {
            margin-bottom: 22px;
        }

        .section h2 {
            margin: 0 0 6px;
            font-size: 21px;
            color: #0f172a;
        }

        .section-header p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
        }

        .quick {
            display: block;
            border: 1px solid #e2e8f0;
            padding: 20px;
            border-radius: 12px;
            text-decoration: none;
            color: #172033;
            transition: .2s;
            background: #fafafa;
        }

        .quick:hover {
            border-color: #86efac;
            background: #f0fdf4;
            transform: translateY(-2px);
        }

        .quick strong {
            display: block;
            margin-bottom: 7px;
            font-size: 16px;
        }

        .quick span {
            color: #64748b;
            font-size: 13px;
            line-height: 1.5;
        }

        /* FOOTER */

        .footer {
            text-align: center;
            color: #94a3b8;
            font-size: 13px;
            margin-top: 35px;
        }

        /* RESPONSIVE */

        @media (max-width: 850px) {

            .navbar {
                padding: 0 18px;
                gap: 8px;
            }

            .nav-link {
                font-size: 12px;
                padding: 8px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .welcome {
                align-items: flex-start;
                gap: 15px;
                flex-direction: column;
            }
        }

        @media (max-width: 550px) {

            .brand {
                font-size: 19px;
            }

            .navbar {
                height: auto;
                padding: 15px;
                flex-wrap: wrap;
            }

            .brand {
                width: 100%;
                margin-bottom: 5px;
            }

            .container {
                padding: 28px 15px 45px;
            }

            .welcome h1 {
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


<!-- MAIN CONTENT -->

<div class="container">

    <!-- WELCOME -->

    <div class="welcome">

        <div>
            <h1>Seller Dashboard 👋</h1>

            <p>
                Welcome back,
                <strong><%= user.getName() %></strong>.
                Manage your NikkiMart store from here.
            </p>
        </div>

        <div class="seller-badge">
            SELLER ACCOUNT
        </div>

    </div>


    <!-- MAIN CARDS -->

    <div class="cards">

        <!-- PRODUCTS -->

        <div class="card">

            <div class="card-top">

                <div class="card-icon">
                    📦
                </div>

            </div>

            <h3>My Products</h3>

            <p>
                Create, edit and manage your product listings,
                prices and stock.
            </p>

            <a class="action-btn"
               href="<%= request.getContextPath() %>/product?action=seller">
                Manage Products
            </a>

        </div>


        <!-- ORDERS -->

        <div class="card">

            <div class="card-top">

                <div class="card-icon">
                    🛒
                </div>

            </div>

            <h3>Incoming Orders</h3>

            <p>
                View orders placed by buyers for your
                products.
            </p>

            <a class="action-btn"
               href="<%= request.getContextPath() %>/order?action=seller">
                View Orders
            </a>

        </div>


        <!-- ADD PRODUCT -->

        <div class="card">

            <div class="card-top">

                <div class="card-icon">
                    ➕
                </div>

            </div>

            <h3>Add Product</h3>

            <p>
                Add a new product with price, stock,
                category and description.
            </p>

            <a class="action-btn"
               href="<%= request.getContextPath() %>/product?action=add">
                Add Product
            </a>

        </div>

    </div>


    <!-- QUICK ACTIONS -->

    <div class="section">

        <div class="section-header">

            <h2>Quick Actions</h2>

            <p>
                Manage your store using these shortcuts.
            </p>

        </div>


        <div class="quick-actions">

            <a class="quick"
               href="<%= request.getContextPath() %>/product?action=add">

                <strong>➕ Add New Product</strong>

                <span>
                    Create a new listing with price,
                    stock, category and image.
                </span>

            </a>


            <a class="quick"
               href="<%= request.getContextPath() %>/product?action=seller">

                <strong>📦 Manage My Products</strong>

                <span>
                    Edit or remove your existing
                    product listings.
                </span>

            </a>


            <a class="quick"
               href="<%= request.getContextPath() %>/order?action=seller">

                <strong>🛍️ Manage Orders</strong>

                <span>
                    Check incoming orders from buyers
                    and monitor order status.
                </span>

            </a>


            <a class="quick"
               href="<%= request.getContextPath() %>/product?action=browse">

                <strong>🏪 View Marketplace</strong>

                <span>
                    See the marketplace from a
                    buyer's perspective.
                </span>

            </a>

        </div>

    </div>


    <div class="footer">
        NikkiMart Seller Center · Manage your store with ease
    </div>

</div>

</body>
</html>