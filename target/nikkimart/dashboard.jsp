<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    com.nikki.nikkimart.model.User user =
        (com.nikki.nikkimart.model.User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NikkiMart - Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f8f2;
        }

        .header {
            background-color: #2e7d32;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .box {
            width: 600px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        h2 {
            color: #2e7d32;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            background-color: #2e7d32;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>🌱 NikkiMart</h1>
</div>

<div class="box">

    <h2>Welcome, <%= user.getName() %>! 🎉</h2>

    <p>You are successfully logged in.</p>

    <p>
        Account:
        <strong><%= user.getEmail() %></strong>
    </p>

    <p>
        Role:
        <strong><%= user.getRole() %></strong>
    </p>

    <a href="#" class="button">Browse Products</a>

    <a href="index.jsp" class="button">Home</a>

</div>

</body>
</html>