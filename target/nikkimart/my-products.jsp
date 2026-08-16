<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - My Products</title>
</head>
<body>

<h2>My Products</h2>

<p><a href="product?action=addForm">Add New Product</a></p>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null || products.isEmpty()) {
%>
    <p>You haven't listed any products yet.</p>
<%
    } else {
%>
    <table border="1" cellpadding="8">
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
    <%
        for (Product p : products) {
    %>
        <tr>
            <td><%= p.getName() %></td>
            <td>₹<%= p.getPrice() %></td>
            <td><%= p.getStockQty() %></td>
            <td><%= p.getCategory() %></td>
            <td>
                <a href="product?action=edit&id=<%= p.getId() %>">Edit</a>
                &nbsp;|&nbsp;
                <form action="product" method="post" style="display:inline;"
                      onsubmit="return confirm('Delete this product?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    <%
        }
    %>
    </table>
<%
    }
%>

</body>
</html>