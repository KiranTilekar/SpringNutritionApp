<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Water - Essential Nutrient Information</title>
    <style>
        /* Styles remain the same as in the original protein page */
    </style>
</head>
<body>

    <jsp:include page="include/menu.jsp" />

    <div class="container">
        <h1>Water - Essential Nutrient</h1>

        <div class="section">
            <h2>What is Water?</h2>
            <p>Water is the only liquid nutrient that is really essential for body hydration and is vital for the body to function properly.</p>
        </div>

        <div class="section">
            <h2>Rich Water Sources</h2>
            <div class="food-list">
                <div class="food-item">Plain water (tap, bottled, filtered)</div>
                <div class="food-item">Herbal teas</div>
                <div class="food-item">Low-sugar sports drinks</div>
                <div class="food-item">Fruits and vegetables with high water content (e.g., watermelon, cucumber, celery)</div>
            </div>
        </div>

        <div class="section">
            <h2>Daily Recommended Intake</h2>
            <div class="recommendation">
                <h3>Sedentary Adults:</h3>
                <p>1.5 liters per day</p>
                <h3>Children and Teenagers:</h3>
                <ul>
                    <li>2-3 years: 390 ml from food + 910 ml from beverages = 1300 ml total</li>
                    <li>4-8 years: 480 ml from food + 1120 ml from beverages = 1600 ml total</li>
                    <li>9-13 years: 630 ml from food + 1470 ml from beverages = 2100 ml total</li>
                    <li>14+ years: 750 ml from food + 1750 ml from beverages = 2500 ml total</li>
                </ul>
                <h3>Pregnant Women:</h3>
                <p>690 ml from food + 1610 ml from beverages = 2300 ml total</p>
                <h3>Lactating Women:</h3>
                <p>600 ml from food + 2100 ml from beverages = 2700 ml total</p>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Water Deficiency (Dehydration)</h2>
            <div class="warning">
                <ul>
                    <li>Headache</li>
                    <li>Dizziness or lightheadedness</li>
                    <li>Muscle cramps</li>
                    <li>Dark urine color</li>
                    <li>Fatigue and weakness</li>
                </ul>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Excessive Water Consumption</h2>
            <div class="warning">
                <ul>
                    <li>Dilution of electrolytes in the body</li>
                    <li>Water intoxication (hyponatremia)</li>
                    <li>Stomach discomfort</li>
                    <li>Bloating</li>
                </ul>
            </div>
        </div>

        <%
        String lastUpdated = new java.text.SimpleDateFormat("MM/dd/yyyy").format(new java.util.Date());
        %>

    </div>

    <jsp:include page="include/footer.jsp" />
</body>
</html>
