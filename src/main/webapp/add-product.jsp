<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Add Product</title>

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
            max-width: 700px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.08);
        }

        h1 {
            margin: 0;
            color: #12355b;
            font-size: 28px;
        }

        .subtitle {
            color: #718096;
            margin: 7px 0 28px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            font-size: 14px;
            color: #374151;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            font-family: Arial, sans-serif;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input:focus,
        textarea:focus {
            border-color: #16803c;
            box-shadow: 0 0 0 3px rgba(22,128,60,0.10);
        }

        .hint {
            font-size: 12px;
            color: #8a8f98;
            margin-top: 5px;
        }

        .error {
            background: #fff1f1;
            border: 1px solid #ffcaca;
            color: #c62828;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .add-btn {
            flex: 1;
            border: none;
            border-radius: 9px;
            padding: 13px;
            background: #16803c;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-btn:hover {
            background: #116b32;
        }

        .back-btn {
            flex: 1;
            text-align: center;
            padding: 13px;
            border-radius: 9px;
            background: #eef2f5;
            color: #374151;
            text-decoration: none;
            font-weight: bold;
        }

        .back-btn:hover {
            background: #e2e7eb;
        }

        @media (max-width: 600px) {

            .card {
                padding: 25px 20px;
            }

            .buttons {
                flex-direction: column;
            }

        }

    </style>

</head>

<body>

<div class="navbar">
    🛒 NikkiMart
</div>


<div class="container">

    <div class="card">

        <h1>➕ Add New Product</h1>

        <p class="subtitle">
            Add a new product to your NikkiMart store
        </p>


<%
    String error = request.getParameter("error");

    if (error != null) {
%>

        <div class="error">
            ⚠️ Please check your input. Name, price and stock quantity are required.
        </div>

<%
    }
%>


        <form action="product" method="post">

            <div class="form-group">

                <label for="name">
                    Product Name *
                </label>

                <input
                    type="text"
                    id="name"
                    name="name"
                    placeholder="Enter product name"
                    required>

            </div>


            <div class="form-group">

                <label for="description">
                    Description
                </label>

                <textarea
                    id="description"
                    name="description"
                    rows="4"
                    placeholder="Describe your product..."></textarea>

            </div>


            <div class="form-group">

                <label for="price">
                    Price (₹) *
                </label>

                <input
                    type="number"
                    id="price"
                    name="price"
                    step="0.01"
                    min="0.01"
                    placeholder="Enter price"
                    required>

            </div>


            <div class="form-group">

                <label for="stockQty">
                    Stock Quantity *
                </label>

                <input
                    type="number"
                    id="stockQty"
                    name="stockQty"
                    min="0"
                    placeholder="Enter available quantity"
                    required>

            </div>


            <div class="form-group">

                <label for="category">
                    Category
                </label>

                <input
                    type="text"
                    id="category"
                    name="category"
                    placeholder="Example: Vegetables, Fruits, Grocery">

            </div>


            <div class="form-group">

                <label for="imageUrl">
                    Product Image URL
                </label>

                <input
                    type="text"
                    id="imageUrl"
                    name="imageUrl"
                    placeholder="Paste image URL">

                <div class="hint">
                    Optional — add an image URL for your product.
                </div>

            </div>


            <div class="buttons">

                <a
                    class="back-btn"
                    href="product?action=myProducts">
                    ← Back
                </a>

                <button
                    type="submit"
                    class="add-btn">
                    Add Product
                </button>

            </div>

        </form>

    </div>

</div>

</body>
</html>