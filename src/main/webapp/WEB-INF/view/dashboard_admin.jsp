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

                        </div>
                    </td>
                </tr>




            </table>
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>