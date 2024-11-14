<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page session="true" %>
<%@ page isELIgnored="false" %>

<style>
    .menu-bar {
        text-align: center;
    }

    .menu-item {
        display: inline-block;
        margin: 0 10px;
        padding: 10px;
        border-radius: 5px;
    }

    .menu-item:hover {
        background-color: #f0f0f0;
    }

    .admin-menu {
        display: none;
    }

    .user-menu {
        display: none;
    }

    .current-user {
        display: block;
    }
    .menu-bar {
        text-align: center;
        background-color: #f0f0f0; /* Light grey background */
        padding: 10px 0;
        border-radius: 5px;
    }

    .menu-item {
        display: inline-block;
        margin: 0 10px;
        padding: 10px 20px;
        border-radius: 25px;
        text-decoration: none;
        color: #333;
        transition: all 0.3s ease;
    }

    .menu-item:hover {
        background-color: #e0e0e0; /* Slightly darker grey on hover */
        transform: translateY(-2px); /* Slight lift on hover */
    }

    .admin-menu {
        display: none;
    }

    .user-menu {
        display: none;
    }

    .current-user {
        display: block !important;
    }

    /* Additional styles for button-like appearance */
    .menu-item {
        font-weight: bold;
        letter-spacing: 0.5px;
        cursor: pointer;
    }

    .menu-item::after {
        content: "";
        display: block;
        width: 100%;
        height: 2px;
        background-color: #ccc;
        margin-top: 5px;
    }

</style>


<div class="menu-bar">
    <c:if test="${sessionScope.userId==null}">
        <a href="index" class="menu-item">Home</a> |
        <a href="index" class="menu-item">Login</a> |
        <a href="reg_form" class="menu-item">Register</a>
    </c:if>

    <c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">
        <a href="admin_dashboard" class="menu-item">Home</a> |
        <a href="admin_users" class="menu-item">User List</a> |
        <a href="logout" class="menu-item">Logout</a>
    </c:if>

    <c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
        <a href="user_dashboard" class="menu-item">Home</a> |
        <a href="makeYourMeal" class="menu-item">Make Your Meal</a> |
        <a href="seeMeal" class="menu-item">See Your Meal</a> |
        <a href="logout" class="menu-item">Logout</a>
    </c:if>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var userId = '${sessionScope.userId}';
    var role = '${sessionScope.role}';

    document.querySelectorAll('.menu-item').forEach(function(item) {
        item.classList.remove('current-user');
    });

    if (userId != null) {
        if (role === '1') {
            document.querySelector('.admin-menu').classList.add('current-user');
        } else if (role === '2') {
            document.querySelector('.user-menu').classList.add('current-user');
        }
    }
});
</script>