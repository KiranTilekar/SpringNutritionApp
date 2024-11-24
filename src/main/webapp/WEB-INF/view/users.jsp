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
            /* Previous styles remain the same */
            body {
                font-family: Arial, sans-serif;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                background-color: #f0f8f0;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin: 0;
                padding: 0;
            }

            /* Previous styles remain the same */
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

            /* New styles for sorting */
            .sortable {
                cursor: pointer;
                position: relative;
                padding-right: 20px !important;
            }

            .sort-arrow {
                position: absolute;
                right: 5px;
                top: 50%;
                transform: translateY(-50%);
            }

            .sort-arrow::after {
                content: "↕";
                opacity: 0.5;
            }

            .sort-asc::after {
                content: "↑";
                opacity: 1;
            }

            .sort-desc::after {
                content: "↓";
                opacity: 1;
            }
        </style>

        <script src="static/js/jquery.js"></script>

        <script>
            $(document).ready(function() {
                let currentSort = {
                    column: null,
                    direction: 'asc'
                };

                function sortTable(column) {
                    const table = $('.user-list-table');
                    const tbody = table.find('tbody');
                    const rows = tbody.find('tr').toArray();

                    // Reset all arrows
                    $('.sort-arrow').removeClass('sort-asc sort-desc');

                    // Update sort direction
                    if (currentSort.column === column) {
                        currentSort.direction = currentSort.direction === 'asc' ? 'desc' : 'asc';
                    } else {
                        currentSort.column = column;
                        currentSort.direction = 'asc';
                    }

                    // Update arrow
                    const th = table.find(`th[data-column="${column}"]`);
                    th.find('.sort-arrow').addClass(currentSort.direction === 'asc' ? 'sort-asc' : 'sort-desc');

                    // Sort rows
                    rows.sort((a, b) => {
                        const aValue = $(a).children().eq(getColumnIndex(column)).text();
                        const bValue = $(b).children().eq(getColumnIndex(column)).text();

                        if (column === 'userId') {
                            return currentSort.direction === 'asc'
                                ? parseInt(aValue) - parseInt(bValue)
                                : parseInt(bValue) - parseInt(aValue);
                        } else {
                            return currentSort.direction === 'asc'
                                ? aValue.localeCompare(bValue)
                                : bValue.localeCompare(aValue);
                        }
                    });

                    tbody.empty().append(rows);
                }

                function getColumnIndex(column) {
                    switch(column) {
                        case 'userId': return 1;
                        case 'name': return 2;
                        case 'email': return 3;
                        case 'loginName': return 4;
                        default: return 0;
                    }
                }

                // Add click handlers
                $('.sortable').click(function() {
                    const column = $(this).data('column');
                    sortTable(column);
                });
            });

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
        <jsp:include page="include/menu.jsp"/>
        <div class="main-container">
            <table class="layout-table">
                <tr>
                    <td class="header-cell">
                        <%-- Header --%>
                    </td>
                </tr>
                <tr>
                    <td class="menu-cell">
                        <%-- Menu --%>
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
                                        <th class="sortable" data-column="userId">USER ID<span class="sort-arrow"></span></th>
                                        <th class="sortable" data-column="name">NAME<span class="sort-arrow"></span></th>
                                        <th class="sortable" data-column="email">EMAIL<span class="sort-arrow"></span></th>
                                        <th class="sortable" data-column="loginName">USERNAME<span class="sort-arrow"></span></th>
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
                    </td>
                </tr>
            </table>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>