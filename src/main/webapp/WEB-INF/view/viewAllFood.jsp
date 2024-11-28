<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Items</title>
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
            text-align: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }

    </style>
</head>
<body>

    <jsp:include page="include/menu.jsp" />

    <div class="container">
        <h1>Food Items</h1>

        <table>
            <thead>
                <tr>
                    <th>Food ID</th>
                    <th>Name</th>
                    <th>Carbohydrate (g)</th>
                    <th>Protein (g)</th>
                    <th>Fat (g)</th>
                    <th>Iron (mg)</th>
                    <th>Magnesium (mg)</th>
                    <th>Phosphorous (mg)</th>
                    <th>Calories</th>
                    <th>Category</th>
                    <th>Preference</th>
                    <th>Measurement</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${viewAllFood}">
                    <tr>
                        <td>${v.foodId}</td>
                        <td>${v.name}</td>
                        <td>${v.carbohydrate}</td>
                        <td>${v.protein}</td>
                        <td>${v.fat}</td>
                        <td>${v.iron}</td>
                        <td>${v.magnesium}</td>
                        <td>${v.phosphorous}</td>
                        <td>${v.calories}</td>
                        <td>${v.category}</td>
                        <td>${v.preference}</td>
                        <td>${v.measurement}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

        <jsp:include page="include/footer.jsp" />

</body>
</html>