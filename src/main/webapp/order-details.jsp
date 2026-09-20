<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nikki.nikkimart.model.OrderItem" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <title>NikkiMart - Order Details</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f8f6;
            color: #263238;
        }

        .navbar {
            background: #12355b;
            color: white;
            padding: 17px 35px;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .container {
            width: 92%;
            max-width: 950px;
            margin: 35px auto;
        }

        .card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.07);
        }

        h1 {
            margin: 0 0 8px;
            color: #12355b;
        }

        .subtitle {
            color: #718096;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
        }

        th {
            background: #f1f5f3;
            color: #374151;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 16px 15px;
            border-top: 1px solid #edf0ef;
        }

        .price {
            color: #16803c;
            font-weight: bold;
        }

        .review-btn {
            display: inline-block;
            background: #16803c;
            color: white;
            text-decoration: none;
            padding: 9px 13px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: bold;
        }

        .review-btn:hover {
            background: #116630;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            background: #eef3f7;
            color: #12355b;
            text-decoration: none;
            padding: 11px 17px;
            border-radius: 8px;
            font-weight: bold;
        }

        .back-btn:hover {
            background: #e2e9ef;
        }

        @media (max-width: 650px) {

            .container {
                width: 94%;
            }

            .card {
                padding: 20px;
                overflow-x: auto;
            }

            table {
                min-width: 650px;
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

        <h1>📦 Order Details</h1>

        <p class="subtitle">
            Items included in this order
        </p>


<%
    List<OrderItem> items =
            (List<OrderItem>) request.getAttribute("orderItems");
%>


        <table>

            <tr>

                <th>Product ID</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Review</th>

            </tr>


            <%
                if (items != null) {

                    for (OrderItem item : items) {
            %>

            <tr>

                <td>
                    #<%= item.getProductId() %>
                </td>

                <td>
                    <%= item.getQuantity() %>
                </td>

                <td class="price">
                    ₹<%= item.getUnitPrice() %>
                </td>

                <td>

                    <a
                        class="review-btn"
                        href="<%= request.getContextPath() %>/product?action=view&id=<%= item.getProductId() %>">
                        ⭐ Review Product
                    </a>

                </td>

            </tr>

            <%
                    }
                }
            %>

        </table>


        <a
            class="back-btn"
            href="<%= request.getContextPath() %>/order?action=history">
            ← Back to Orders
        </a>

    </div>

</div>

</body>

</html>