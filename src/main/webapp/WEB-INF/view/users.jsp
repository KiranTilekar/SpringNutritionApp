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
            body {
                text-align:center;
            }

            .main-container {
                width: 90%;
                margin: 0 auto;
                padding: 20px;
            }

            .layout-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 10px;
            }

            .header-cell,
            .menu-cell,
            .content-cell,
            .footer-cell {
                display: block;
            }

            .page-content {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .page-content h3 {
                color: #333;
                margin-top: 0;
            }

            .user-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .user-list-table th,
            .user-list-table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #e9ecef;
            }

            .user-list-table th {
                font-weight: bold;
                color: #333;
                background-color: #f8f9fa;
            }

            .user-list-table tr:nth-child(even) {
                background-color: #f5f7fa;
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
    <body>
        <div class="main-container">
            <table class="layout-table">
                <tr>
                    <td class="header-cell">
                        <%-- Header --%>
                        <jsp:include page="include/header.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td class="menu-cell">
                        <%-- Menu --%>
                        <jsp:include page="include/menu.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td class="content-cell">
                        <%-- Page Content Area--%>
                        <div class="page-content">
                            <h3>User List</h3>
                            <table class="user-list-table">
                                <thead>
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
                                </thead>
                                <tbody>
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
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="footer-cell">
                        <%-- Footer --%>
                        <jsp:include page="include/footer.jsp"/>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>