<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.User" %>
<%@ page import="com.nikki.nikkimart.model.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="navbar">🌱 NikkiMart — Admin</div>

<div class="container">

    <h1>Admin Panel</h1>

    <h2>All Users</h2>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        <%
            for (User u : users) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRole() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <h2>All Orders</h2>
    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
    %>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Buyer ID</th>
            <th>Status</th>
            <th>Total</th>
            <th>Placed On</th>
        </tr>
        <%
            for (Order o : orders) {
        %>
        <tr>
            <td><%= o.getId() %></td>
            <td><%= o.getBuyerId() %></td>
            <td><%= o.getStatus() %></td>
            <td>₹<%= o.getTotalAmount() %></td>
            <td><%= o.getCreatedAt() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <p><a href="index.jsp">Back to Home</a></p>

</div>

</body>
</html>