<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Magnesium - Essential Mineral Information</title>
    <style>
        body {
            margin: 0;
            padding: 0;
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
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: green;
            text-align: center;
            border-bottom: 2px solid green;
            padding-bottom: 10px;
        }
        .section {
            margin: 20px 0;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .section h2 {
            color: green;
            margin-top: 0;
        }
        .food-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px;
            margin: 10px 0;
        }
        .food-item {
            background-color: #e1f5fe;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
        }
        .warning {
            background-color: #ffebee;
            border-left: 4px solid #ef5350;
            padding: 10px;
            margin: 10px 0;
        }
        .recommendation {
            background-color: #e8f5e9;
            border-left: 4px solid #66bb6a;
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

    <jsp:include page="include/menu.jsp" />

    <div class="container">
        <h1>Magnesium - Essential Mineral</h1>

        <div class="section">
            <h2>What is Magnesium?</h2>
            <p>Magnesium is an essential mineral that plays crucial roles in energy production, nerve function, muscle contraction, and bone health.</p>
        </div>

        <div class="section">
            <h2>Rich Magnesium Sources</h2>
            <div class="food-list">
                <div class="food-item">Dark leafy greens (spinach, kale, Swiss chard)</div>
                <div class="food-item">Nuts and seeds (almonds, pumpkin seeds, sesame seeds)</div>
                <div class="food-item">Legumes (black beans, chickpeas, lentils)</div>
                <div class="food-item">Whole grains (brown rice, quinoa, whole wheat bread)</div>
                <div class="food-item">Fish (salmon, mackerel, halibut)</div>
            </div>
        </div>

        <div class="section">
            <h2>Daily Recommended Intake</h2>
            <div class="recommendation">
                <p>The daily recommended intake of magnesium varies based on age, sex, and overall health. Generally, adults need about 400-420 mg per day.</p>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Magnesium Deficiency</h2>
            <div class="warning">
                <ul>
                    <li>Weakness and fatigue</li>
                    <li>Muscle cramps and spasms</li>
                    <li>Heart palpitations</li>
                    <li>Irregular heartbeat</li>
                    <li>Osteoporosis</li>
                </ul>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Excessive Magnesium Consumption</h2>
            <div class="warning">
                <ul>
                    <li>Diarrhea</li>
                    <li>Nausea and vomiting</li>
                    <li>Abdominal cramps</li>
                    <li>Weakness and fatigue (similar to deficiency)</li>
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
