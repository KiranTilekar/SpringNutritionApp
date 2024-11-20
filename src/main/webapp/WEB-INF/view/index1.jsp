<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

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
        }

        main {
            flex: 1;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(90vh - 130px);
            font-size: 3rem;
            color: #4F7942;
        }

        .success-message {

        }

        .nutrient-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .nutrient-tile {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 15px;
            text-align: center;
            transition: transform 0.3s ease;
            margin: 20px;
        }

        .nutrient-tile:hover {
            transform: translateY(-5px);
        }

        .nutrient-icon {
            width: 200px;  /* increased width */
            height: 150px; /* different height to create rectangle */
            object-fit: cover;
            border-radius: 8px; /* slight rounded corners */
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* subtle shadow */
        }

        .nutrient-name {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            margin: 10px 0;
        }

        .nutrient-description {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 10px;
        }

        .learn-more-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .learn-more-btn:hover {
            background-color: #388E3C;
        }


        </style>
    </head>
    <body>

        <jsp:include page="include/menu.jsp" />



        <main>
            <div class="content-container">
                <h2>Welcome to Nutrition App</h2>
                <p>Your journey to a healthier lifestyle begins here!</p>
            </div>
        </main>

        <div class="nutrient-grid">
            <!-- Proteins -->
            <div class="nutrient-tile">
                <img src="static/images/protein.avif" alt="Proteins" class="nutrient-icon">
                <h3 class="nutrient-name">Proteins</h3>
                <p class="nutrient-description">Essential for muscle building and repair</p>
                <a href="learnMore?id=1" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Carbohydrates -->
            <div class="nutrient-tile">
                <img src="static/images/carbs.avif" alt="Carbohydrates" class="nutrient-icon">
                <h3 class="nutrient-name">Carbohydrates</h3>
                <p class="nutrient-description">Primary source of energy for the body</p>
                <a href="learnMore?id=2" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Fats -->
            <div class="nutrient-tile">
                <img src="static/images/fats.jpg" alt="Fats" class="nutrient-icon">
                <h3 class="nutrient-name">Fats</h3>
                <p class="nutrient-description">Important for hormone production and cell health</p>
                <a href="learnMore?id=3" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Vitamins -->
            <div class="nutrient-tile">
                <img src="static/images/vitamins.png" alt="Vitamins" class="nutrient-icon">
                <h3 class="nutrient-name">Vitamins</h3>
                <p class="nutrient-description">Essential for various bodily functions</p>
                <a href="learnMore?id=4" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Minerals -->
            <div class="nutrient-tile">
                <img src="static/images/iron.jpg" alt="Iron" class="nutrient-icon">
                <h3 class="nutrient-name">Iron</h3>
                <p class="nutrient-description">Essential for hemoglobin formation and oxygen
                    transport in blood.</p>
                <a href="learnMore?id=5" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Fiber -->
            <div class="nutrient-tile">
                <img src="static/images/magnesium.webp" alt="Magnesium" class="nutrient-icon">
                <h3 class="nutrient-name">Magnesium</h3>
                <p class="nutrient-description">Crucial for nerve and muscle function, blood
                    sugar control, and blood pressure regulation.</p>
                <a href="learnMore?id=6" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Water -->
            <div class="nutrient-tile">
                <img src="static/images/phosphorous.png" alt="Phosphorous" class="nutrient-icon">
                <h3 class="nutrient-name">Phosphorous</h3>
                <p class="nutrient-description">Important for bone and teeth health, energy
                    production, and cell repair.</p>
                <a href="learnMore?id=7" class="learn-more-btn">Learn More</a>
            </div>

            <!-- Antioxidants -->
            <div class="nutrient-tile">
                <img src="static/images/water.jpg" alt="Water" class="nutrient-icon">
                <h3 class="nutrient-name">Water</h3>
                <p class="nutrient-description">Vital for all body functions and hydration</p>
                <a href="learnMore?id=8" class="learn-more-btn">Learn More</a>
            </div>
        </div>


        <jsp:include page="include/footer.jsp" />

    </body>
    </html>