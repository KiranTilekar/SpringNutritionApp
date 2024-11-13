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
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="${url_bg}">

        <jsp:include page="include/header.jsp"/>

        <jsp:include page="include/menu.jsp"/>

        <h3>You can add below food items to your meal .....</h3>

        <table border=1>
            <tr>
                <th>
                    Food Name
                </th>

                <th>

                </th>

                <th>

                </th>
            </tr>

            <c:forEach var="f" items="${foodList}">
            <tr>
                <td>
                    ${f.name}
                </td>

                <td>
                    <a href="/getFoodById">View</a>
                </td>

                <td>
                    <button>Add to Meal</button>
                </td>
            </tr>
            </c:forEach>
        </table>

        <br><jsp:include page="include/footer.jsp"/>

    </body>
</html>