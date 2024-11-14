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

        <style>
            .food-list-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .food-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .food-table th,
            .food-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #e9ecef;
            }

            .food-table th {
                font-weight: bold;
                color: #333;
                background-color: #f8f9fa;
            }

            .food-row:hover {
                background-color: #f5f7fa;
            }

            .success {
                color: green;
                font-weight: bold;
                text-align: center;
                margin: 10px 0;
            }
        </style>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="${url_bg}">

        <jsp:include page="include/header.jsp"/>

        <jsp:include page="include/menu.jsp"/>

        <div class="food-list-container">
            <h3>You can add below food items to your meal .....</h3>

            <c:if test="${param.ac eq 'sv'}">
                <p class="success">Food Added Successfully</p>
            </c:if>

            <div class="food-table">
                <table>
                    <thead>
                        <tr>
                            <th>Food Name</th>
                            <th>View Details</th>
                            <th>Add to Meal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="f" items="${foodList}">
                            <tr class="food-row">
                                <td>${f.name}</td>
                                <td><a href="<c:url value="/getFoodById?foodId=${f.foodId}"/>">View</a></td>
                                <td><a href="<c:url value="/setFoodById?foodId=${f.foodId}"/>">Add to Meal</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <br><jsp:include page="include/footer.jsp"/>

    </body>
</html>