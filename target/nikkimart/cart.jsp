<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - My Cart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="navbar">🌱 NikkiMart</div>

<div class="container">

    <h2>🛒 My Cart</h2>

    <%
        List<CartItem> items = (List<CartItem>) request.getAttribute("items");
        BigDecimal total = (BigDecimal) request.getAttribute("total");

        if (items == null || items.isEmpty()) {
    %>
        <p>Your cart is empty.</p>
        <p><a href="product?action=browse">Browse Products</a></p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Actions</th>
            </tr>
            <%
                for (CartItem item : items) {
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td>₹<%= item.getProductPrice() %></td>
                <td>
                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="cartItemId" value="<%= item.getId() %>">
                        <input type="number" name="quantity" min="1" value="<%= item.getQuantity() %>">
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td>₹<%= item.getSubtotal() %></td>
                <td>
                    <form action="cart" method="post" style="display:inline;"
                          onsubmit="return confirm('Remove this item?');">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="cartItemId" value="<%= item.getId() %>">
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr class="total-row">
                <td colspan="3">Total</td>
                <td colspan="2">₹<%= total %></td>
            </tr>
        </table>

        <p><a href="product?action=browse">Continue Shopping</a></p>

        <form action="order" method="post" style="margin-top:10px;">
            <input type="hidden" name="action" value="place">
            <button type="submit">Place Order</button>
        </form>
    <%
        }
    %>

</div>

</body>
</html>