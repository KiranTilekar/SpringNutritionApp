<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

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

<h2>Your meal is ready here....</h2>

<c:if test="${param.act eq 'del'}">
    meal deleted successfully!!
</c:if>
<c:forEach var="m" items="${mealList}">

    <table border=1>
        <tr>
            <th>Food Name</th>
            <th>Action</th>
        </tr>

        <tr>
            <td>
                ${m.name}
            </td>

            <td>
                <a href="<c:url value="/remove_food?fid=${m.foodId}"/>">Remove</a>
            </td><br>
        </tr>
    </table>


</c:forEach>
<br>
<tr>
    <td height="25px">
        <%-- Footer --%>
        <jsp:include page = "include/footer.jsp"/>
    </td>
</tr>