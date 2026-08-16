<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - Add Product</title>
</head>
<body>

<h2>Add New Product</h2>

<%
    String error = request.getParameter("error");
    if (error != null) {
%>
    <p style="color:red;">Please check your input — name, price, and stock quantity are required.</p>
<%
    }
%>

<form action="product" method="post">
    <label>Name:</label>
    <input type="text" name="name" required>
    <br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="40"></textarea>
    <br><br>

    <label>Price:</label>
    <input type="number" name="price" step="0.01" min="0.01" required>
    <br><br>

    <label>Stock Quantity:</label>
    <input type="number" name="stockQty" min="0" required>
    <br><br>

    <label>Category:</label>
    <input type="text" name="category">
    <br><br>

    <label>Image URL:</label>
    <input type="text" name="imageUrl">
    <br><br>

    <button type="submit">Add Product</button>
</form>

<p><a href="product?action=myProducts">View My Products</a></p>

</body>
</html>