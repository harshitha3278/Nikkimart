<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NikkiMart - Farm Fresh Marketplace</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f8f2;
            text-align: center;
        }

        .header {
            background-color: #2e7d32;
            color: white;
            padding: 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
        }

        .container {
            margin: 70px auto;
            max-width: 700px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .container h2 {
            color: #2e7d32;
        }

        .container p {
            color: #555;
            font-size: 17px;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .register {
            background-color: #2e7d32;
            color: white;
        }

        .login {
            background-color: #ffffff;
            color: #2e7d32;
            border: 2px solid #2e7d32;
        }

        .browse {
            background-color: #ff9800;
            color: white;
        }

        .button:hover {
            opacity: 0.85;
        }

        .footer {
            margin-top: 50px;
            color: #777;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>🌱 NikkiMart</h1>
        <p>Farm Fresh Products Marketplace</p>
    </div>

    <div class="container">

        <h2>Welcome to NikkiMart 🛒</h2>

        <p>
            A simple multi-seller marketplace where buyers can
            discover fresh products and sellers can showcase their products.
        </p>

        <a href="register.jsp" class="button register">
            Create Account
        </a>

        <a href="login.jsp" class="button login">
            Login
        </a>

        <br>

        <a href="#" class="button browse">
            Browse Products
        </a>

    </div>

    <div class="footer">
        <p>© 2026 NikkiMart | Farm Fresh Marketplace</p>
    </div>

</body>
</html>