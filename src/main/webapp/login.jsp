<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>NikkiMart - Login</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;

            /* Background image */
            background:
                linear-gradient(
                    rgba(0, 0, 0, 0.42),
                    rgba(0, 0, 0, 0.42)
                ),
                url("<%= request.getContextPath() %>/images/login-bg.jpg");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

            color: #263238;
        }

        /* HEADER */

        .header {
            background: rgba(18, 53, 91, 0.94);
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.2);
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .tagline {
            margin: 0;
            font-size: 14px;
            opacity: 0.92;
        }

        /* LOGIN AREA */

        .page {
            min-height: calc(100vh - 105px);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 35px 20px;
        }

        .login-card {
            width: 100%;
            max-width: 420px;

            background: rgba(255, 255, 255, 0.97);

            padding: 38px;

            border-radius: 18px;

            box-shadow:
                0 15px 45px rgba(0,0,0,0.25);

            backdrop-filter: blur(5px);
        }

        /* ICON */

        .icon {
            width: 62px;
            height: 62px;

            margin: 0 auto 15px;

            border-radius: 50%;

            background: #e8f4eb;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 29px;
        }

        /* TITLE */

        .login-card h2 {
            text-align: center;

            margin: 0;

            color: #12355b;

            font-size: 28px;
        }

        .subtitle {
            text-align: center;

            color: #718096;

            font-size: 14px;

            margin: 8px 0 28px;
        }

        /* FORM */

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;

            margin-bottom: 7px;

            font-size: 14px;

            font-weight: 600;

            color: #374151;
        }

        .form-group input {
            width: 100%;

            padding: 13px 14px;

            border: 1px solid #d1d5db;

            border-radius: 9px;

            font-size: 15px;

            outline: none;

            transition: 0.2s;
        }

        .form-group input:focus {
            border-color: #16803c;

            box-shadow:
                0 0 0 3px rgba(22,128,60,0.12);
        }

        /* LOGIN BUTTON */

        .login-btn {
            width: 100%;

            padding: 13px;

            margin-top: 8px;

            border: none;

            border-radius: 9px;

            background: #16803c;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.2s;
        }

        .login-btn:hover {
            background: #116b32;

            transform: translateY(-1px);
        }

        /* ERROR */

        .message {
            margin-top: 18px;

            padding: 11px 12px;

            border-radius: 7px;

            background: #fff1f1;

            border: 1px solid #ffcaca;

            color: #c62828;

            text-align: center;

            font-size: 14px;
        }

        /* REGISTER */

        .register-section {
            text-align: center;

            margin-top: 25px;

            padding-top: 20px;

            border-top: 1px solid #eeeeee;

            color: #6b7280;

            font-size: 14px;
        }

        .register-section a {
            color: #16803c;

            font-weight: bold;

            text-decoration: none;

            margin-left: 4px;
        }

        .register-section a:hover {
            text-decoration: underline;
        }

        /* SECURITY */

        .secure-text {
            text-align: center;

            margin-top: 18px;

            font-size: 12px;

            color: #8a8f98;
        }

        /* MOBILE */

        @media (max-width: 500px) {

            .header {
                padding: 18px 15px;
            }

            .logo {
                font-size: 25px;
            }

            .page {
                padding: 25px 15px;
            }

            .login-card {
                padding: 28px 22px;
            }
        }

    </style>

</head>

<body>


<!-- HEADER -->

<div class="header">

    <div class="logo">
        🛒 NikkiMart
    </div>

    <p class="tagline">
        Farm Fresh Products Marketplace
    </p>

</div>


<!-- LOGIN -->

<div class="page">

    <div class="login-card">

        <div class="icon">
            🔐
        </div>

        <h2>Welcome Back</h2>

        <p class="subtitle">
            Login to continue to your NikkiMart account
        </p>


        <!-- LOGIN FORM -->

        <form
            action="<%= request.getContextPath() %>/login"
            method="post">

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
                    placeholder="Enter your password"
                    autocomplete="current-password"
                    required>

            </div>


            <button
                type="submit"
                class="login-btn">

                Login

            </button>

        </form>


        <!-- ERROR MESSAGE -->

        <%
            String error = request.getParameter("error");

            if ("1".equals(error)) {
        %>

            <div class="message">
                Invalid email or password. Please try again.
            </div>

        <%
            }
        %>


        <!-- REGISTER -->

        <div class="register-section">

            Don't have an account?

            <a href="<%= request.getContextPath() %>/register.jsp">
                Create Account
            </a>

        </div>


        <div class="secure-text">
            🔒 Your account information is securely handled.
        </div>

    </div>

</div>

</body>
</html>