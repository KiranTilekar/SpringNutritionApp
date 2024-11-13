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

    </head>



        <jsp:include page="include/header.jsp"/><br>

        <jsp:include page="include/menu.jsp"/><br>

        <h3>Nutrients of Food Below..... </h3>

        <table border=1>
            <tr>
                <th>NAME</th>
                <th>CARBOHYDRATE</th>
                <th>PROTEIN</th>
                <th>FAT</th>
                <th>IRON</th>
                <th>MAGNESIUM</th>
                <th>PHOSPHOROUS</th>
            </tr>

            <tr>
                <td>${foodById.name}</td>
                <td>${foodById.carbohydrate}</td>
                <td>${foodById.protein}</td>
                <td>${foodById.fat}</td>
                <td>${foodById.iron}</td>
                <td>${foodById.magnesium}</td>
                <td>${foodById.phosphorous}</td>
            </tr>

        </table>
        <br><jsp:include page="include/footer.jsp"/>

    </body>
</html>