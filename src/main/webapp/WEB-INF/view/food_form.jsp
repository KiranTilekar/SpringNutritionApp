<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Form - Contact Application </title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>

            body {
                margin: 0;
                padding: 0;
                background-color: #f0f8f0;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            .food-list-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .food-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                padding: 20px 0;
            }

            .food-tile {
                background: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .food-tile:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            }

            .food-image {
                width: 100%;
                height: 200px;
                object-fit: cover;
                background-color: #f8f9fa;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .food-image i {
                font-size: 48px;
                color: #4CAF50;
            }

            .food-content {
                padding: 15px;
            }

            .food-name {
                font-size: 1.2em;
                font-weight: bold;
                color: #333;
                margin-bottom: 10px;
            }

            .food-actions {
                display: flex;
                gap: 10px;
                margin-top: 15px;
            }

            .food-button {
                flex: 1;
                padding: 8px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                font-weight: 500;
                transition: background-color 0.3s ease;
            }

            .view-btn {
                background-color: #e9ecef;
                color: #495057;
            }

            .view-btn:hover {
                background-color: #dee2e6;
            }

            .add-btn {
                background-color: #4CAF50;
                color: white;
            }

            .add-btn:hover {
                background-color: #45a049;
            }

            .success {
                background-color: #d4edda;
                color: #155724;
                padding: 15px;
                border-radius: 6px;
                margin: 20px 0;
                text-align: center;
                font-weight: 500;
            }

            .container-header {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
                font-size: 1.5em;
            }
        </style>
    </head>

    <body>
        <jsp:include page="include/menu.jsp"/>

        <div class="food-list-container">
            <h3 class="container-header">You can add below food items to your meal</h3>

            <c:if test="${param.ac eq 'sv'}">
                <div class="success">
                    <i class="fas fa-check-circle"></i> Food Added Successfully
                </div>
            </c:if>

            <div class="food-grid">
                <c:forEach var="f" items="${foodList}">

                    <div class="food-tile">
                        <div class="food-image">
                                <img src="displayFoodImage/${f.foodId}" alt="${food.name} Image" class="food-image"/>
                        </div>
                        <div class="food-content">
                            <div class="food-name">${f.name}</div>
                            <div class="food-actions">
                                <a href="<c:url value="/getFoodById?foodId=${f.foodId}"/>" class="food-button view-btn">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <a href="<c:url value="/setFoodById?foodId=${f.foodId}"/>" class="food-button add-btn">
                                    <i class="fas fa-plus"></i> Add to Meal
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <br><jsp:include page="include/footer.jsp"/>
    </body>
</html>