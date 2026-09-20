<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>NikkiMart - My Products</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f8f5;
            color: #263238;
        }

        .navbar {
            background: #12355b;
            color: white;
            padding: 18px 35px;
            font-size: 25px;
            font-weight: bold;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .container {
            max-width: 1100px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            gap: 15px;
        }

        h1 {
            margin: 0;
            color: #12355b;
            font-size: 30px;
        }

        .subtitle {
            margin-top: 7px;
            color: #718096;
        }

        .add-btn {
            background: #16803c;
            color: white;
            padding: 12px 18px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: bold;
        }

        .add-btn:hover {
            background: #116b32;
        }

        .empty {
            background: white;
            padding: 45px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        }

        .empty-icon {
            font-size: 45px;
        }

        .table-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #12355b;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 16px 15px;
            border-bottom: 1px solid #edf0f2;
        }

        tr:hover {
            background: #f8fbf8;
        }

        .product-name {
            font-weight: bold;
            color: #12355b;
        }

        .price {
            color: #16803c;
            font-weight: bold;
        }

        .stock {
            font-weight: bold;
        }

        .category {
            background: #eef5ff;
            color: #315b91;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 12px;
        }

        .edit-btn {
            color: #12355b;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .delete-btn {
            background: #fff1f1;
            color: #c62828;
            border: 1px solid #ffcaca;
            padding: 7px 10px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .delete-btn:hover {
            background: #ffe2e2;
        }

        @media (max-width: 700px) {

            .top-section {
                flex-direction: column;
                align-items: flex-start;
            }

            .table-card {
                overflow-x: auto;
            }

            table {
                min-width: 700px;
            }

        }

    </style>

</head>

<body>

<div class="navbar">
    🛒 NikkiMart
</div>

<div class="container">

    <div class="top-section">

        <div>
            <h1>My Products</h1>
            <p class="subtitle">
                Manage your products and inventory
            </p>
        </div>

        <a class="add-btn" href="product?action=addForm">
            + Add New Product
        </a>

    </div>


<%
    List<Product> products =
            (List<Product>) request.getAttribute("products");

    if (products == null || products.isEmpty()) {
%>

    <div class="empty">

        <div class="empty-icon">📦</div>

        <h2>No Products Yet</h2>

        <p>
            You haven't listed any products yet.
        </p>

        <br>

        <a class="add-btn" href="product?action=addForm">
            + Add Your First Product
        </a>

    </div>

<%
    } else {
%>

    <div class="table-card">

        <table>

            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>

<%
        for (Product p : products) {
%>

            <tr>

                <td class="product-name">
                    <%= p.getName() %>
                </td>

                <td class="price">
                    ₹<%= p.getPrice() %>
                </td>

                <td class="stock">
                    <%= p.getStockQty() %>
                </td>

                <td>
                    <span class="category">
                        <%= p.getCategory() != null &&
                            !p.getCategory().isBlank()
                            ? p.getCategory()
                            : "General" %>
                    </span>
                </td>

                <td>

                    <a
                        class="edit-btn"
                        href="product?action=edit&id=<%= p.getId() %>">
                        ✏️ Edit
                    </a>

                    <form
                        action="product"
                        method="post"
                        style="display:inline;"
                        onsubmit="return confirm('Delete this product?');">

                        <input
                            type="hidden"
                            name="action"
                            value="delete">

                        <input
                            type="hidden"
                            name="id"
                            value="<%= p.getId() %>">

                        <button
                            type="submit"
                            class="delete-btn">
                            🗑 Delete
                        </button>

                    </form>

                </td>

            </tr>

<%
        }
%>

        </table>

    </div>

<%
    }
%>

</div>

</body>
</html>