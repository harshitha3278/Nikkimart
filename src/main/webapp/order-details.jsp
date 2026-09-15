<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.OrderItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head><title>Order Details</title></head>
<body>

<h2>Order Details</h2>

<%
    List<OrderItem> items = (List<OrderItem>) request.getAttribute("orderItems");
%>
<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Product ID</th>
        <th>Quantity</th>
        <th>Unit Price</th>
    </tr>
    <%
        for (OrderItem item : items) {
    %>
    <tr>
        <td><%= item.getProductId() %></td>
        <td><%= item.getQuantity() %></td>
        <td>₹<%= item.getUnitPrice() %></td>
    </tr>
    <%
        }
    %>
</table>

<p><a href="order?action=history">Back to Orders</a></p>

</body>
</html>