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
        /* (Existing CSS styles omitted for brevity) */

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
    </style>
</head>
<body>

    <jsp:include page="include/menu.jsp" />

    <main>
        <div class="login-container">
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