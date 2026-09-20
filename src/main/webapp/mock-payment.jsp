<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>NikkiMart - Mock Payment</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="navbar">
    🌱 NikkiMart
</div>

<div class="container">

    <h2>Mock Payment Confirmation</h2>

    <p>Please confirm your payment to place the order.</p>

    <div class="payment-box">

        <h3>Payment Details</h3>

        <p>
            <strong>Payment Method:</strong>
            Demo Payment
        </p>

        <p>
            <strong>Status:</strong>
            Ready for Confirmation
        </p>

        <p>
            This is a mock payment for the
            NikkiMart project demonstration.
        </p>

    </div>

    <form action="<%= request.getContextPath() %>/order"
          method="post">

        <input type="hidden"
               name="action"
               value="confirmPayment">

        <button type="submit">
            Confirm Payment
        </button>

    </form>

    <br>

    <a href="<%= request.getContextPath() %>/cart">
        Cancel
    </a>

</div>

</body>
</html>