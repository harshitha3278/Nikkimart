<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - My Orders</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="navbar">🌱 NikkiMart</div>

<div class="container">

    <h2>My Orders</h2>

    <% if ("1".equals(request.getParameter("placed"))) { %>
        <div class="success-msg">✅ Order placed successfully!</div>
    <% } %>

    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");

        if (orders == null || orders.isEmpty()) {
    %>
        <p>You haven't placed any orders yet.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Status</th>
                <th>Total</th>
                <th>Placed On</th>
                <th>Details</th>
            </tr>
            <%
                for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getStatus() %></td>
                <td>₹<%= order.getTotalAmount() %></td>
                <td><%= order.getCreatedAt() %></td>
                <td><a href="order?action=view&orderId=<%= order.getId() %>">View</a></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <p><a href="product?action=browse">Continue Shopping</a></p>

</div>

</body>
</html>