<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nutrition App</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f0f8f0;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 2rem;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #4CAF50;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .login-container input {
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        .login-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0.75rem 1rem;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #388E3C;
        }

        .login-container p {
            text-align: center;
            margin-top: 1rem;
        }

        .login-container a {
            color: #4CAF50;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }

        .success-message {
            color: #4CAF50;
            font-size: large;
        }

        .error-message {
            color: red;
        }
    </style>
</head>
<body>

    <jsp:include page="include/menu.jsp" />

    <main>
        <div class="login-container">

            <c:if test="${err!=null}">
                <div class="error-message">${err}</div>
            </c:if>

            <c:if test="${param.act eq 'reg'}">
                <div class="success-message">Registered successfully. Please login</div>
            </c:if>

            <h2>Login Here...</h2>
            <form action="login" method="post">
                <input type="text" placeholder="Username" name="loginName" required>
                <input type="password" placeholder="Password" name="password" required>
                <button type="submit">Login</button>
            </form>
            <p>New User? <a href="reg_form">Register</a></p>
        </div>
    </main>

    <jsp:include page="include/footer.jsp" />

</body>
</html>