<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page session="true" %>
<%@ page isELIgnored="false" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<style>
    header {
            background-color: #4CAF50;
            color: white;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

    .header-content {
        display: flex;
        align-items: center;
        justify-content: space-between; /* Added to space out logo and nav */
        max-width: 1200px;
        margin: 0 auto;
    }

    .header-content i {
        margin-right: 10px;
        font-size: 24px;
    }

    .header-content h1 {
        font-size: 24px;
    }

    nav {
        padding: 0.75rem 1rem;
        z-index: 99;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
    }

    nav ul {
        list-style: none;
        display: flex;
        max-width: 1200px;
        margin: 0 auto;
        gap: 10px;
        justify-content: flex-end; /* Change this to 'flex-end' */
    }

    nav ul li {
        position: relative;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        padding: 0.75rem 1.5rem;
        border-radius: 25px;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s ease;
        position: relative;
            overflow: hidden;
            background-color: transparent;
        }

    nav ul li a:before {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background-color: white;
        transition: width 0.3s ease;
    }

    nav ul li a:hover {
        background-color: rgba(255, 255, 255, 0.1);
        transform: translateY(-2px);
    }

    nav ul li a:hover:before {
        width: 80%;
    }

    nav ul li a:active {
        transform: translateY(0);
    }

</style>


<c:if test="${sessionScope.userId==null}">
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <i class="fas fa-apple-alt"></i>
                <h1>Nutrition App</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="login_form"><i class="fas fa-sign-in-alt"></i>Login</a></li>
                    <li><a href="reg_form"><i class="fas fa-user-plus"></i>Register</a></li>
                </ul>
            </nav>
        </div>
    </header>
</c:if>

<c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <i class="fas fa-apple-alt"></i>
                <h1>Nutrition App</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="admin_dashboard"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="admin_users"></i>User List</a></li>
                    <li><a href="addFoodForm"></i>Add Food</a></li>
                    <li><a href="viewAllFood"></i>View Food Items</a></li>
                    <li><a href="updateFoodForm"></i>Update Food</a></li>
                    <li><a href="logout"><i class="fas fa-right-from-bracket"></i>Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
</c:if>

<c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <i class="fas fa-apple-alt"></i>
                <h1>Nutrition App</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="user_dashboard"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="makeYourMeal"><i class="fas fa-utensils"></i>Make Your Meal</a></li>
                    <li><a href="seeMeal"><i class="fas fa-clipboard-list"></i>See Your Meal</a></li>
                    <li><a href="logout?act=lo"><i class="fas fa-right-from-bracket"></i>Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
</c:if>


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