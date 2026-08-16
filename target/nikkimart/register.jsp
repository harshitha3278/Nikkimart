<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - Register</title>
</head>

<body>

<h2>Create Your NikkiMart Account</h2>

<form action="register" method="post">

    <label>Name:</label>
    <input type="text" name="name" required>
    <br><br>

    <label>Email:</label>
    <input type="email" name="email" required>
    <br><br>

    <label>Password:</label>
    <input type="password" name="password" required>
    <br><br>

    <button type="submit">Register</button>

</form>

<p>
    Already have an account?
    <a href="login.jsp">Login</a>
</p>

</body>
</html>