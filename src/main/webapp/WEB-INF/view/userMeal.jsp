<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<style>
    .meal-list-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .meal-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    .meal-table th,
    .meal-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #e9ecef;
    }

    .meal-table th {
        font-weight: bold;
        color: #333;
        background-color: #f8f9fa;
    }

    .food-row {
        background-color: #f5f7fa;
    }

    .success {
        color: green;
        font-weight: bold;
        text-align: center;
        margin: 10px 0;
    }
</style>

<tr>
    <td height="80px">
        <%-- Header --%>
        <jsp:include page = "include/header.jsp"/>
    </td>
</tr>

<tr>
    <td height="25px">
        <%-- Menu --%>
        <jsp:include page = "include/menu.jsp"/>
    </td>
</tr>

<div class="meal-list-container">
    <h2>Your meal is ready here....</h2>

    <c:if test="${param.act eq 'del'}">
        <p class="success">Meal Deleted Successfully!</p>
    </c:if>

    <div class="meal-table">
        <table>
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="m" items="${mealList}">
                    <tr class="food-row">
                        <td>${m.name}</td>
                        <td><a href="<c:url value="/remove_food?fid=${m.foodId}"/>">Remove</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
    <td height="25px">
        <%-- Footer --%>
        <jsp:include page = "include/footer.jsp"/>
    </td>
</tr>