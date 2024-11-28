<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Created Meal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

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
        }
        .meal-card {
            background-color: white;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            margin-bottom: 20px;
            margin-right: 20px;
        }

        .meal-image {
            height: 250px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            width: 100%;
        }
        .nutrition-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
        }
        .info-item {
            flex: 1;
            text-align: center;
            margin: 10px;
            padding: 10px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            min-width: 120px;
        }
        .info-item span:first-child {
            font-weight: bold;
            color: #6c757d;
            margin-bottom: 5px;
            display: block;
        }
        .info-item span:last-child {
            font-size: 1.2em;
            color: #2c3e50;
        }
        .meal-details {
            padding: 15px;
        }

        .total-nutrition-card {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 30px auto;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .total-nutrition-header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .total-nutrition-header i {
            margin-right: 10px;
            color: #007bff;
            font-size: 24px;
        }

        .total-nutrition-header h4 {
            margin: 0;
            color: #2c3e50;
            font-weight: 600;
        }

        .total-nutrition-content {
            padding: 25px;
        }

        .nutrition-tiles {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .nutrition-tile {
            background-color: #f4f6f9;
            border-radius: 12px;
            padding: 20px;
            width: calc(33.333% - 20px);
            min-width: 200px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
        }

        .nutrition-tile:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-color: #007bff;
        }

        .nutrition-tile .nutrition-icon {
            font-size: 40px;
            margin-bottom: 15px;
            opacity: 0.7;
        }

        .nutrition-tile .nutrition-label {
            font-weight: 600;
            color: #6c757d;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9em;
        }

        .nutrition-tile .nutrition-value {
            font-size: 1.8em;
            color: #2c3e50;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <jsp:include page="include/menu.jsp"/>

    <div class="container mt-5">
        <h1 class="mb-4 text-center">
            <i class="bi bi-bowl-fill me-2"></i>Your Created Meal
        </h1>

        <div class="row">
            <c:forEach var="r" items="${recommendedMeal}">
                <div class="col-md-6 mb-4">
                    <div class="meal-card">
                        <div class="image">
                            <img src="displayFoodImage/${r.foodId}" alt="${r.name} Image" class="meal-image"/>
                        </div>
                        <div class="meal-details">
                            <h3 class="text-center mb-3">${r.name}</h3>
                            <div class="nutrition-info">
                                <div class="info-item">
                                    <span>Carbohydrates</span>
                                    <span>${r.carbohydrate}g</span>
                                </div>
                                <div class="info-item">
                                    <span>Protein</span>
                                    <span>${r.protein}g</span>
                                </div>
                                <div class="info-item">
                                    <span>Fat</span>
                                    <span>${r.fat}g</span>
                                </div>
                                <div class="info-item">
                                    <span>Iron</span>
                                    <span>${r.iron}mg</span>
                                </div>
                                <div class="info-item">
                                    <span>Magnesium</span>
                                    <span>${r.magnesium}mg</span>
                                </div>
                                <div class="info-item">
                                    <span>Phosphorus</span>
                                    <span>${r.phosphorous}mg</span>
                                </div>
                                <div class="info-item">
                                    <span>Calories</span>
                                    <span>${r.calories}cal</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="total-nutrition-card">
        <div class="total-nutrition-header">
            <i class="bi bi-graph-up"></i>
            <h4>Total Nutrition Summary</h4>
        </div>
        <div class="total-nutrition-content">
            <div class="nutrition-tiles">
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/carbsIcon.png" alt="Carbohydrate" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Carbohydrate</div>
                    <div class="nutrition-value">${nutritionSummary.carbohydrate} g</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/proteinIcon.png" alt="Protein" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Protein</div>
                    <div class="nutrition-value">${nutritionSummary.protein} g</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/fatIcon.png" alt="Fat" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Fat</div>
                    <div class="nutrition-value">${nutritionSummary.fat} g</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/ironIcon.png" alt="Iron" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Iron</div>
                    <div class="nutrition-value">${nutritionSummary.iron} mg</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/magnesiumIcon.png" alt="Magnesium" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Magnesium</div>
                    <div class="nutrition-value">${nutritionSummary.magnesium} mg</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/phosphorousIcon.png" alt="Phosphorus" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Phosphorus</div>
                    <div class="nutrition-value">${nutritionSummary.phosphorous} mg</div>
                </div>
                <div class="nutrition-tile">
                    <div class="nutrition-icon">
                        <img src="static/images/fire.png" alt="Calories" class="img-fluid" style="max-width: 50px;">
                    </div>
                    <div class="nutrition-label">Calories</div>
                    <div class="nutrition-value">${nutritionSummary.calories} cal</div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="include/footer.jsp"/>

</body>
</html>