<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Food Item</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f8f0;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .register-container {
            max-width: 500px;
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

        .form-control {
            width: 95%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .submit-button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 20px;
        }

        .submit-button:hover {
            background-color: #45a049;
        }

        .view-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .view-link:hover {
            color: #45a049;
        }

        .error-message {
            font-size: 14px;
            color: red;
            padding: 5px;
            border-radius: 4px;
            background-color: #f8d7da;
            margin-bottom: 15px;
            text-align: center;
        }

        .success-message {
            font-size: 14px;
            color: green;
            padding: 5px;
            border-radius: 4px;
            background-color: #00cc22;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <jsp:include page="include/menu.jsp" />

    <div class="register-container">




        <h2>Add New Food Item</h2>

        <c:if test="${err!=null}">
            <div class="error-message">${err}</div>
        </c:if>

        <f:form action="addFood" modelAttribute="command" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Food Name</label>
                <f:input path="food.name" id="name" type="text" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="carbohydrate">Carbohydrate (g)</label>
                <f:input path="food.carbohydrate" id="carbohydrate" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="protein">Protein (g)</label>
                <f:input path="food.protein" id="protein" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="fat">Fat (g)</label>
                <f:input path="food.fat" id="fat" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="iron">Iron (mg)</label>
                <f:input path="food.iron" id="iron" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="magnesium">Magnesium (mg)</label>
                <f:input path="food.magnesium" id="magnesium" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="phosphorous">Phosphorous (mg)</label>
                <f:input path="food.phosphorous" id="phosphorous" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="calories">Calories (kcal)</label>
                <f:input path="food.calories" id="calories" type="number" step="0.01" required="required" cssClass="form-control"/>
            </div>

            <div class="form-group">
                <label for="category">Meal Preference</label>
                <f:select path="food.category" id="category" cssClass="form-control" required="required">
                    <f:option value="">Select Category</f:option>
                    <f:option value="Underweight">Underweight</f:option>
                    <f:option value="Normal Weight">Normal Weight</f:option>
                    <f:option value="Overweight">Overweight</f:option>
                </f:select>
            </div>

            <div class="form-group">
                <label for="preference">Meal Preference</label>
                <f:select path="food.preference" id="preference" cssClass="form-control" required="required">
                    <f:option value="">Select Meal Preference</f:option>
                    <f:option value="Veg">Veg</f:option>
                    <f:option value="Nonveg">Nonveg</f:option>
                </f:select>
            </div>

            <div class="form-group">
                Add Image: <input type="file" name="file" accept="image/*" required>
            </div>

            <button type="submit" class="submit-button">Add Food Item</button>
        </f:form>

        <a href="viewImages" class="view-link">View All Food Items</a>
    </div>
    <jsp:include page="include/footer.jsp" />
</body>
</html>