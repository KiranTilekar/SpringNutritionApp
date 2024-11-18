<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard - Nutrition App</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
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
                margin: 0;
                padding: 0;
            }

            .sidebar {
                height: 100%;
                width: 60px; /* Start collapsed */
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #ffffff;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }

            .sidebar.expanded {
                width: 250px;
            }

            .sidebar a {
                padding: 15px 25px;
                text-decoration: none;
                font-size: 16px;
                color: #333;
                display: flex;
                align-items: center;
                transition: 0.3s;
                white-space: nowrap;
                overflow: hidden;
            }

            .sidebar a span {
                opacity: 0;
                transition: opacity 0.3s;
            }

            .sidebar.expanded a span {
                opacity: 1;
            }

            .sidebar a:hover {
                background-color: #4CAF50;
                color: white;
            }

            .sidebar i {
                min-width: 35px;
                font-size: 20px;
            }

            .toggle-btn {
                top: 10px;
                right: -40px;
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 0 5px 5px 0;
                transition: 0.3s;
            }

            .toggle-btn:hover {
                background-color: #388E3C;
            }

            .content {
                margin-left: 60px; /* Match collapsed sidebar width */
                padding: 20px;
                transition: 0.5s;
            }

            .content.expanded {
                margin-left: 250px;
            }

            @media screen and (max-width: 768px) {
                .sidebar {
                    width: 60px;
                }
                .content {
                    margin-left: 60px;
                }
            }
        </style>
    </head>

    <%-- Header --%>
    <jsp:include page="include/menu.jsp"/>

    <body>
        <div class="sidebar" id="mySidebar">
            <button class="toggle-btn" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <a href="#profile"><i class="fas fa-user"></i> <span>Your Profile</span></a>
            <a href="#meal"><i class="fas fa-utensils"></i> <span>Get Customized Meal</span></a>
            <a href="makeYourMeal"><i class="fas fa-utensils"></i> <span>Make Your Meal</span></a>
            <a href="seeMeal"><i class="fas fa-clipboard-list"></i> <span>See Your Meal</span></a>
            <a href="#progress"><i class="fas fa-chart-line"></i> <span>Track Your Progress</span></a>
            <a href="#goal"><i class="fas fa-bullseye"></i> <span>Set Your Goal</span></a>
            <a href="#recipes"><i class="fas fa-book-open"></i> <span>Learn Recipes</span></a>
            <a href="#notifications"><i class="fas fa-bell"></i> <span>Notifications</span></a>
            <a href="#shop"><i class="fas fa-shopping-cart"></i> <span>Buy Health Products</span></a>
        </div>

        <script>
            function toggleSidebar() {
                const sidebar = document.getElementById("mySidebar");
                const content = document.querySelector(".content");
                sidebar.classList.toggle("expanded");
                content.classList.toggle("expanded");
            }
        </script>
    </body>

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp"/>
</html>