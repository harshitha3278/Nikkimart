`<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NikkiMart - Login</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f8f2;
        }

        .header {
            background-color: #2e7d32;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .box {
            width: 350px;
            margin: 70px auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background-color: #2e7d32;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.85;
        }

        .message {
            text-align: center;
            color: red;
            margin-top: 15px;
        }

        .link {
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: #2e7d32;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>🌱 NikkiMart</h1>
    <p>Farm Fresh Products Marketplace</p>
</div>

<div class="box">

    <h2>Login</h2>

    <form action="login" method="post">

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

    </form>

    <%
        String error = request.getParameter("error");

        if ("1".equals(error)) {
    %>
        <div class="message">
            Invalid email or password.
        </div>
    <%
        }
    %>

    <div class="link">
        Don't have an account?
        <a href="register.jsp">Create Account</a>
    </div>

</div>

</body>
</html>