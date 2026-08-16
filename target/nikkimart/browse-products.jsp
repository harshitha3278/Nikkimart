<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>NikkiMart - Browse Products</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .product-grid { display: flex; flex-wrap: wrap; gap: 16px; margin-top: 20px; }
        .product-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            width: 220px;
            padding: 12px;
        }
        .product-card img {
            width: 100%;
            height: 140px;
            object-fit: cover;
            border-radius: 4px;
        }
        .product-name { font-weight: bold; margin-top: 8px; }
        .product-price { color: #2e7d32; font-weight: bold; }
        .product-category { color: #777; font-size: 0.9em; }
        form.search-form { margin-bottom: 16px; }
    </style>
</head>
<body>

<h2>🌱 Browse Products</h2>

<form class="search-form" action="product" method="get">
    <input type="hidden" name="action" value="browse">
    <input type="text" name="keyword" placeholder="Search by name..."
           value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    <input type="text" name="category" placeholder="Category..."
           value="<%= request.getParameter("category") != null ? request.getParameter("category") : "" %>">
    <button type="submit">Search</button>
    <a href="product?action=browse">Clear</a>
</form>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null || products.isEmpty()) {
%>
    <p>No products found.</p>
<%
    } else {
%>
    <div class="product-grid">
    <%
        for (Product p : products) {
            String img = (p.getImageUrl() != null && !p.getImageUrl().isBlank())
                    ? p.getImageUrl()
                    : "https://placehold.co/220x140?text=No+Image";
    %>
        <div class="product-card">
            <img src="<%= img %>" alt="<%= p.getName() %>">
            <div class="product-name"><%= p.getName() %></div>
            <div class="product-category"><%= p.getCategory() != null ? p.getCategory() : "" %></div>
            <div class="product-price">₹<%= p.getPrice() %></div>
            <p><%= p.getStockQty() > 0 ? p.getStockQty() + " in stock" : "Out of stock" %></p>
        </div>
    <%
        }
    %>
    </div>
<%
    }
%>

<p><a href="index.jsp">Back to Home</a></p>

</body>
</html>