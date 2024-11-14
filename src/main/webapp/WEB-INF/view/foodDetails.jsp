<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Details Form - Nutrition App </title>

        <style>
            .nutrient-info-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .nutrient-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0 10px;
            }

            .nutrient-table th,
            .nutrient-table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #e9ecef;
            }

            .nutrient-table th {
                font-weight: bold;
                color: #333;
                background-color: #f8f9fa;
            }

            .food-row {
                background-color: #f5f7fa;
            }
        </style>
    </head>



        <jsp:include page="include/header.jsp"/><br>

        <jsp:include page="include/menu.jsp"/><br>

        <div class="nutrient-info-container">
            <h3>Nutrients of Food Below..... </h3>

            <div class="nutrient-table">
                <table>
                    <thead>
                        <tr>
                            <th>NAME</th>
                            <th>CARBOHYDRATE</th>
                            <th>PROTEIN</th>
                            <th>FAT</th>
                            <th>IRON</th>
                            <th>MAGNESIUM</th>
                            <th>PHOSPHOROUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="food-row">
                            <td>${foodById.name}</td>
                            <td>${foodById.carbohydrate}</td>
                            <td>${foodById.protein}</td>
                            <td>${foodById.fat}</td>
                            <td>${foodById.iron}</td>
                            <td>${foodById.magnesium}</td>
                            <td>${foodById.phosphorous}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br><jsp:include page="include/footer.jsp"/>

    </body>
</html>