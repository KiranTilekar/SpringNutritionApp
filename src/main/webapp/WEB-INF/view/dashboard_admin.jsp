<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Contact Application </title>
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

            .admin-dashboard {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .admin-dashboard h3 {
                color: #333;
                margin-top: 0;
            }

            .success {
                background-color: #d4edda;
                color: #155724;
                padding: 15px;
                border-radius: 6px;
                margin: 20px 0;
                text-align: center;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <jsp:include page="include/menu.jsp"/>
        <div class="main-container">

            <table class="layout-table">

                <tr>
                    <td class="content-cell">
                        <%-- Page Content Area--%>
                        <div class="admin-dashboard">
                            <h3>Admin Dashboard</h3>
                            <c:if test="${not empty param.ac and param.ac eq 'add'}">
                                <div class="success">
                                    <i class="fas fa-check-circle"></i> Food Added Successfully
                                </div>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </table>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>