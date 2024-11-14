<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard - Contact Application </title>
        <style>
            body {
                text-align: center;
            }
            .page-content {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
            }

            .page-content h3 {
                color: #333;
                margin-top: 0;
                font-size: 24px;
                font-weight: bold;
            }

            .page-content p {
                line-height: 1.6;
                margin-bottom: 15px;
                color: #666;
            }
        </style>
    </head>
    <body>
                    <%-- Header --%>
                    <jsp:include page = "include/header.jsp"/>

                    <%-- Menu --%>
                    <jsp:include page = "include/menu.jsp"/>

                   <%-- Page Content Area--%>
                   <div class="page-content">
                       <h3>User Dashboard</h3>

                   </div>
                    <%-- Footer --%>
                    <jsp:include page = "include/footer.jsp"/>
    </body>
</html>