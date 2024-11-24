<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<%@page import="com.yash.nutritionapp.domain.User"%>

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
                margin: 0;
                padding: 0;
                background-color: #f0f8f0;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .dashboard-content {
                flex: 1;
                margin-left: 60px;
                padding: 40px;
                transition: 0.5s;
            }

            .dashboard-content.expanded {
                margin-left: 250px;
            }

            .welcome-message {
                font-size: 1.8em;
                color: #333;
                margin-bottom: 30px;
                font-weight: 500;
            }

            .welcome-message strong {
                color: #4CAF50;
            }

            .stats-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-tile {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
                transition: transform 0.3s ease;
            }



            .stat-tile label {
                color: #666;
                font-size: 1em;
                display: block;
                margin-bottom: 8px;
            }

            .stat-tile .value {
                font-size: 1.4em;
                font-weight: bold;
                color: #4CAF50;
            }

            .sidebar {
                height: 100%;
                width: 60px;
                position: fixed;
                z-index: 1;
                top: 60px;
                left: 0;
                background-color: #ffffff;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 15px;
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

            .meal-section {
                background: rgba(255, 255, 255, 0.9);
                padding: 25px;
                border-radius: 10px;
                margin-top: 20px;
                text-align: center;
                max-width: 100%;
            }

            .meal-section p {
                font-size: 1.2em;
                color: #555;
                margin-bottom: 30px;
                margin-top: 5px;
            }

            .meal-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 25px;
                font-size: 1.1em;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                text-decoration: none;
            }

            .meal-button:hover {
                background-color: #388E3C;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .meal-button i {
                margin-right: 8px;
            }

            @media screen and (max-width: 768px) {
                .dashboard-content {
                    margin-left: 60px;
                    padding: 20px;
                }
                .user-info, .meal-section {
                    margin: 15px auto;
                }
            }
        </style>

        <script>
            function toggleSidebar() {
                const sidebar = document.getElementById("mySidebar");
                const dashboardContent = document.querySelector(".dashboard-content");
                sidebar.classList.toggle("expanded");
                dashboardContent.classList.toggle("expanded");
            }
        </script>
    </head>

    <%-- Header --%>
    <jsp:include page="include/menu.jsp"/>

    <body>
        <div class="sidebar" id="mySidebar">
            <button class="toggle-btn" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>

            <a href="recommendedMeal"><i class="fas fa-utensils"></i> <span>Get Customized Meal</span></a>
            <a href="makeYourMeal"><i class="fas fa-utensils"></i> <span>Make Your Meal</span></a>
            <a href="seeMeal"><i class="fas fa-clipboard-list"></i> <span>See Your Meal</span></a>
            <a href="bmiCalculator" class="calculator-link"><i class="fas fa-calculator"></i> <span>BMI Calculator</span></a>
        </div>


                <div class="dashboard-content">
                    <% User user = (User) session.getAttribute("user"); %>
                    <div class="welcome-message">
                        Welcome, <strong><%= user.getName() %></strong>
                    </div>

                    <div class="stats-container">
                        <div class="stat-tile">
                            <label>Your BMI</label>
                            <div class="value"><%= String.format("%.1f", user.getBMI()) %></div>
                        </div>
                        <div class="stat-tile">
                            <label>Category</label>
                            <div class="value"><%= user.getCategory() %></div>
                        </div>
                </div>

               <div class="meal-section">
                   <p>Here is your meal according to your category</p>
                   <a href="recommendedMeal" class="meal-button">
                       <i class="fas fa-utensils"></i>
                       See Meal
                   </a>
                   </div>
               </div>
    </body>

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp"/>
</html>