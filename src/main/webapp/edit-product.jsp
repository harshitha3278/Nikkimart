<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - Edit Product</title>
</head>
<body>

<h2>Edit Product</h2>

<%
    Product product = (Product) request.getAttribute("product");
    String error = request.getParameter("error");
    if (error != null) {
%>
    <p style="color:red;">Please check your input.</p>
<%
    }
%>

<form action="product" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= product.getId() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= product.getName() %>" required>
    <br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="40"><%= product.getDescription() != null ? product.getDescription() : "" %></textarea>
    <br><br>

    <label>Price:</label>
    <input type="number" name="price" step="0.01" min="0.01" value="<%= product.getPrice() %>" required>
    <br><br>

    <label>Stock Quantity:</label>
    <input type="number" name="stockQty" min="0" value="<%= product.getStockQty() %>" required>
    <br><br>

    <label>Category:</label>
    <input type="text" name="category" value="<%= product.getCategory() != null ? product.getCategory() : "" %>">
    <br><br>

    <label>Image URL:</label>
    <input type="text" name="imageUrl" value="<%= product.getImageUrl() != null ? product.getImageUrl() : "" %>">
    <br><br>

    <button type="submit">Save Changes</button>
</form>

<p><a href="product?action=myProducts">Back to My Products</a></p>

</body>
</html>