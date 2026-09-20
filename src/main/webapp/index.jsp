<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Farm Fresh Marketplace</title>

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

        .nav-actions {
            margin-left: auto;
            display: flex;
            gap: 10px;
        }

        .nav-btn {
            text-decoration: none;
            color: #cbd5e1;
            padding: 9px 14px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-btn:hover {
            background: #1e293b;
            color: white;
        }

        .nav-login {
            background: #16a34a;
            color: white;
        }

        .nav-login:hover {
            background: #15803d;
            color: white;
        }

        /* HERO */

        .hero {
            min-height: 470px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 25px;
            background:
                linear-gradient(
                    rgba(15,23,42,.72),
                    rgba(15,23,42,.72)
                ),
                linear-gradient(
                    135deg,
                    #166534,
                    #0f172a
                );
            text-align: center;
            color: white;
        }

        .hero-content {
            max-width: 760px;
        }

        .hero-badge {
            display: inline-block;
            background: rgba(34,197,94,.18);
            border: 1px solid rgba(134,239,172,.35);
            color: #bbf7d0;
            padding: 8px 15px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .hero h1 {
            margin: 0 0 15px;
            font-size: 48px;
            line-height: 1.1;
        }

        .hero h1 span {
            color: #4ade80;
        }

        .hero p {
            margin: 0 auto 28px;
            max-width: 620px;
            color: #dbe4ee;
            font-size: 17px;
            line-height: 1.7;
        }

        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .button {
            display: inline-block;
            padding: 13px 22px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
        }

        .primary {
            background: #16a34a;
            color: white;
        }

        .primary:hover {
            background: #15803d;
        }

        .secondary {
            background: white;
            color: #0f172a;
        }

        .secondary:hover {
            background: #f1f5f9;
        }

        /* FEATURES */

        .features {
            max-width: 1100px;
            margin: 0 auto;
            padding: 55px 25px;
        }

        .features-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .features-title h2 {
            margin: 0 0 8px;
            color: #0f172a;
            font-size: 28px;
        }

        .features-title p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .feature-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 5px 18px rgba(15,23,42,.05);
        }

        .feature-icon {
            font-size: 30px;
            margin-bottom: 13px;
        }

        .feature-card h3 {
            margin: 0 0 8px;
            color: #172033;
            font-size: 17px;
        }

        .feature-card p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
            line-height: 1.6;
        }

        /* FOOTER */

        .footer {
            background: #0f172a;
            color: #94a3b8;
            text-align: center;
            padding: 25px;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 750px) {

            .navbar {
                height: auto;
                padding: 16px 18px;
                flex-wrap: wrap;
                gap: 12px;
            }

            .brand {
                width: 100%;
            }

            .nav-actions {
                margin-left: 0;
            }

            .hero {
                min-height: 430px;
            }

            .hero h1 {
                font-size: 36px;
            }

            .feature-grid {
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

    <div class="nav-actions">

        <a href="product?action=browse"
           class="nav-btn">
            Browse Products
        </a>

        <a href="register.jsp"
           class="nav-btn">
            Register
        </a>

        <a href="login.jsp"
           class="nav-btn nav-login">
            Login
        </a>

    </div>

</nav>


<!-- HERO -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-badge">
            🌱 FARM FRESH MARKETPLACE
        </div>

        <h1>
            Welcome to <span>NikkiMart</span>
        </h1>

        <p>
            Discover fresh products from trusted sellers,
            shop conveniently, and manage your orders
            all in one place.
        </p>

        <div class="hero-buttons">

            <a href="product?action=browse"
               class="button primary">
                🛍️ Browse Products
            </a>

            <a href="register.jsp"
               class="button secondary">
                Create Account
            </a>

        </div>

    </div>

</section>


<!-- FEATURES -->

<section class="features">

    <div class="features-title">

        <h2>Everything You Need</h2>

        <p>
            A simple marketplace experience for buyers and sellers.
        </p>

    </div>


    <div class="feature-grid">

        <div class="feature-card">

            <div class="feature-icon">
                🛍️
            </div>

            <h3>Shop Fresh Products</h3>

            <p>
                Browse products from multiple sellers
                and find what you need easily.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                🛒
            </div>

            <h3>Easy Shopping</h3>

            <p>
                Add products to your cart and place
                orders with a simple checkout flow.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                ⭐
            </div>

            <h3>Reviews & Ratings</h3>

            <p>
                Share your experience by rating products
                after completing your purchase.
            </p>

        </div>

    </div>

</section>


<!-- FOOTER -->

<footer class="footer">

    © 2026 NikkiMart · Farm Fresh Products Marketplace

</footer>

</body>

</html>