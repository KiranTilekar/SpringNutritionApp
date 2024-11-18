<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - Contact Application </title>
        <style>
            /* Wrapper div */
            .page-wrapper {
                position: relative;
                top: 0;
                left: 0;
                right: 0;
                height: auto;
                z-index: 1000;
            }

            /* Header */
            .header {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                background-color: #f9f9f9;
                border-bottom: 1px solid #ddd;
                padding: 10px;
                z-index: 1001;
            }

            /* Menu */
            .menu {
                margin-top: 40px; /* Adjust based on header height */
            }

            /* Main content */
            .content-wrapper {
                padding-top: 80px; /* Adjust based on wrapper height */
            }

            /* Other styles remain unchanged */
            .login-container {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            h2 {
                color: #333;
                text-align: center;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #666;
            }

            input[type="text"], input[type="password"] {
                width: 96%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            .login-button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                transition: all 0.3s ease;
            }

            .login-button:hover {
                background-color: #0056b3;
            }

            .register-link {
                text-align: center;
                margin-top: 20px;
                color: #007bff;
            }

            .error-message {
                font-size: 14px;
                color: red;
                padding: 5px;
                border-radius: 4px;
                background-color: #f8d7da;
                margin-bottom: 15px;
            }

            .success-message {
                font-size: 14px;
                color: black;
                padding: 5px;
                border-radius: 4px;
                background-color: #00cc22;
                margin-bottom: 15px;
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <div class="page-wrapper">
            <jsp:include page = "include/header.jsp"/>

            <!-- Menu -->
            <div class="menu">
                <jsp:include page = "include/menu.jsp"/>
            </div>
        </div>

        <div class="content-wrapper">
            <div class="login-container">
                <h2>Login Here...</h2>

                <c:if test="${err!=null}">
                    <div class="error-message">${err}</div>
                </c:if>

                <c:if test="${param.act eq 'lo'}">
                    <div class="success-message">Logout Successfully! Thanks for using our application.</div>
                </c:if>

                <c:if test="${param.act eq 'reg'}">
                    <div class="success-message">Registered successfully. Please login</div>
                </c:if>

                <form action="login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="loginName" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <button type="submit" class="login-button">Login</button>
                </form>

                <p class="register-link"><a href="reg_form">New User Registration</a></p>
            </div>

            <!-- Footer -->
            <jsp:include page = "include/footer.jsp"/>
        </div>
    </body>
</html>
