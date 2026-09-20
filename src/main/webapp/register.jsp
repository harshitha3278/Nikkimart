<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Farm Mart - Create Account</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef7ee, #f8fbf7);
            min-height: 100vh;
            color: #263238;
        }

        .header {
            background: #12355b;
            color: white;
            padding: 22px 20px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.12);
        }

        .logo {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .tagline {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }

        .page {
            min-height: calc(100vh - 105px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 35px 20px;
        }

        .register-card {
            width: 100%;
            max-width: 450px;
            background: white;
            padding: 38px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.10);
        }

        .icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #e8f4eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        h2 {
            text-align: center;
            margin: 0;
            color: #12355b;
            font-size: 27px;
        }

        .subtitle {
            text-align: center;
            color: #718096;
            font-size: 14px;
            margin: 8px 0 25px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        input,
        select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #12355b;
            box-shadow: 0 0 0 3px rgba(18,53,91,0.10);
        }

        .register-btn {
            width: 100%;
            padding: 13px;
            margin-top: 8px;
            border: none;
            border-radius: 8px;
            background: #12355b;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .register-btn:hover {
            background: #0d2945;
        }

        .login-section {
            text-align: center;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #eeeeee;
            color: #6b7280;
            font-size: 14px;
        }

        .login-section a {
            color: #16803c;
            font-weight: bold;
            text-decoration: none;
            margin-left: 4px;
        }

        .login-section a:hover {
            text-decoration: underline;
        }

        .secure-text {
            text-align: center;
            margin-top: 15px;
            font-size: 12px;
            color: #8a8f98;
        }

        .error-message {
            background: #fff1f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 13px;
        }

        .success-message {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 13px;
        }

        @media (max-width: 500px) {

            .page {
                padding: 25px 15px;
            }

            .register-card {
                padding: 28px 22px;
            }

            .logo {
                font-size: 25px;
            }
        }

    </style>

</head>

<body>

<div class="header">

    <div class="logo">
        🌾 Farm Mart
    </div>

    <p class="tagline">
        Farm Fresh Products Marketplace
    </p>

</div>


<div class="page">

    <div class="register-card">

        <div class="icon">
            👤
        </div>

        <h2>Create Your Account</h2>

        <p class="subtitle">
            Join Farm Mart and start shopping or selling
        </p>


        <% String error = request.getParameter("error"); %>

        <% if ("missing".equals(error)) { %>

            <div class="error-message">
                Please fill in all required fields.
            </div>

        <% } else if ("password".equals(error)) { %>

            <div class="error-message">
                Passwords do not match.
            </div>

        <% } else if ("short".equals(error)) { %>

            <div class="error-message">
                Password must contain at least 6 characters.
            </div>

        <% } else if ("exists".equals(error)) { %>

            <div class="error-message">
                An account with this email already exists.
            </div>

        <% } else if ("registration".equals(error)) { %>

            <div class="error-message">
                Registration failed. Please try again.
            </div>

        <% } %>


        <form action="<%= request.getContextPath() %>/register" method="post">


            <div class="form-group">

                <label for="name">
                    Full Name
                </label>

                <input
                    type="text"
                    id="name"
                    name="name"
                    placeholder="Enter your full name"
                    required>

            </div>


            <div class="form-group">

                <label for="email">
                    Email Address
                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email"
                    autocomplete="email"
                    required>

            </div>


            <div class="form-group">

                <label for="password">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Create a password"
                    minlength="6"
                    autocomplete="new-password"
                    required>

            </div>


            <div class="form-group">

                <label for="confirmPassword">
                    Confirm Password
                </label>

                <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                    placeholder="Re-enter your password"
                    minlength="6"
                    autocomplete="new-password"
                    required>

            </div>


            <div class="form-group">

                <label for="role">
                    Account Type
                </label>

                <select id="role" name="role" required>

                    <option value="">
                        Select account type
                    </option>

                    <option value="BUYER">
                        Buyer
                    </option>

                    <option value="SELLER">
                        Seller
                    </option>

                </select>

            </div>


            <button
                type="submit"
                class="register-btn">

                Create Account

            </button>

        </form>


        <div class="login-section">

            Already have an account?

            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>

        </div>


        <div class="secure-text">
            🔒 Your account information is securely handled.
        </div>

    </div>

</div>

</body>
</html>