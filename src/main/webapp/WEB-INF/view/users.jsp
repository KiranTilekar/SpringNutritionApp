<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List - Contact Application </title>
        <link href="static/css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                font-family: Arial, Helvetica, Geneva, sans-serif;
                font-size: 18px;
            }
            .error{
                color: #FF0000;
            }
            .success{
                color: #0000FF;
            }
        </style>

        <script src="static/js/jquery.js"></script>

        <script>
            function changeStatus(uid, lstatus){
                //alert(userId+", "+loginStatus);
                $.ajax({
                    url:'change_status',
                    data:{userId:uid, loginStatus:lstatus} ,
                    success: function (data) {
                        alert(data);
                    }
                });
            }
        </script>
    </head>
    <body background="${url_bg}">
            <table border="1" width="80%" align="center">
                <tr>
                    <td height="80px">
                        <%-- Header --%>
                        <jsp:include page="include/header.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td height="25px">
                        <%-- Menu --%>
                        <jsp:include page="include/menu.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td height="350px" valign="top">
                        <%-- Page Content Area--%>
                        <h3>User List</h3>
                        <table border="1">
                            <tr>
                                <th>SR</th>
                                <th>USER ID</th>
                                <th>NAME</th>
                                <th>EMAIL</th>
                                <th>USERNAME</th>
                                <th>HEIGHT</th>
                                <th>WEIGHT</th>
                                <th>BMI</th>
                                <th>ROLE</th>

                            </tr>
                            <c:forEach var="u" items="${userList}" varStatus="st">
                                <tr>
                                    <td>${st.count}</td>
                                    <td>${u.userId}</td>
                                    <td>${u.name}</td>
                                    <td>${u.email}</td>
                                    <td>${u.loginName}</td>
                                    <td>${u.height}</td>
                                    <td>${u.weight}</td>
                                    <td>${u.BMI}</td>
                                    <td>${u.role}</td>
                                </tr>
                            </c:forEach>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td height="25px">
                        <%-- Footer --%>
                        <jsp:include page="include/footer.jsp"/>
                    </td>
                </tr>
            </table>
        </body>
</html>