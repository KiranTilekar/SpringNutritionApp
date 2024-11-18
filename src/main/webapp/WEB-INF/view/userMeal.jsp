<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<style>
    .meal-list-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    .meal-list-container h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }

    .success {
        color: #2eb82e;
        font-weight: bold;
        text-align: center;
        margin: 10px 0;
        padding: 10px;
        background-color: #e6ffe6;
        border-radius: 5px;
    }

    .meal-tiles {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        padding: 20px 0;
    }

    .food-tile {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: transform 0.2s;
    }

    .food-tile:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    .food-image {
        width: 100%;
        height: 200px;
        overflow: hidden;
    }

    .food-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s;
    }

    .food-tile:hover .food-image img {
        transform: scale(1.05);
    }

    .food-content {
        padding: 15px;
    }

    .food-name {
        font-size: 1.2em;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .food-actions {
        display: flex;
        justify-content: flex-end;
    }

    .food-button {
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s;
    }

    .remove-btn {
        background-color: #ff4444;
        color: white;
    }

    .remove-btn:hover {
        background-color: #cc0000;
    }

    @media (max-width: 768px) {
        .meal-tiles {
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        }

        .food-image {
            height: 150px;
        }
    }
</style>

<body>
    <%-- Menu --%>
    <jsp:include page="include/menu.jsp"/>

    <div class="meal-list-container">
        <h2>Your meal is ready here....</h2>

        <c:if test="${param.act eq 'del'}">
            <p class="success">Meal Deleted Successfully!</p>
        </c:if>

        <div class="meal-tiles">
            <c:forEach var="m" items="${mealList}">
                <c:if test="${m.foodId == 1}"> <s:url var="imgUrl" value="/static/images/rice.jpg" /> </c:if>
                <c:if test="${m.foodId == 2}"> <s:url var="imgUrl" value="/static/images/roti.jpg" /> </c:if>
                <c:if test="${m.foodId == 3}"> <s:url var="imgUrl" value="/static/images/daal.jpg" /> </c:if>
                <c:if test="${m.foodId == 4}"> <s:url var="imgUrl" value="/static/images/bhindi.webp" /> </c:if>
                <c:if test="${m.foodId == 5}"> <s:url var="imgUrl" value="/static/images/chicken.JPG" /> </c:if>

                <div class="food-tile">
                    <div class="food-image">
                        <img src="${imgUrl}" alt="${m.name}">
                    </div>
                    <div class="food-content">
                        <div class="food-name">${m.name}</div>
                        <div class="food-actions">
                            <a href="<c:url value="/remove_food?fid=${m.foodId}"/>" class="food-button remove-btn">
                                Remove
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- Footer --%>
    <jsp:include page="include/footer.jsp"/>
</body>