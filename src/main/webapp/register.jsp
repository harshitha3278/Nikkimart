<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NikkiMart - Register</title>
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
            margin: 50px auto;
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

    <h2>Create Your Account</h2>

    <form action="register" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Register</button>

    </form>

    <div class="link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>