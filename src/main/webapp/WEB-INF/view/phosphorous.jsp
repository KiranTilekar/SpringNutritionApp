<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Phosphorus - Essential Nutrient Information</title>
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
        <h1>Phosphorus - Essential Nutrient</h1>

        <div class="section">
            <h2>What is Phosphorus?</h2>
            <p>Phosphorus is a chemical element with atomic number 15. It plays a crucial role in various biological processes, including DNA synthesis, ATP production, and bone formation.</p>
        </div>

        <div class="section">
            <h2>Forms of Phosphorus</h2>
            <ul>
                <li>Phosphate (PO43-)</li>
                <li>Phosphite (PO33-)</li>
            </ul>
        </div>

        <div class="section">
            <h2>Rich Phosphorus Sources</h2>
            <div class="food-list">
                <div class="food-item">Dairy products</div>
                <div class="food-item">Meat and poultry</div>
                <div class="food-item">Fish and seafood</div>
                <div class="food-item">Whole grains</div>
                <div class="food-item">Legumes</div>
            </div>
        </div>

        <div class="section">
            <h2>Daily Recommended Intake</h2>
            <div class="recommendation">
                <p>The daily recommended intake varies based on factors such as age, sex, and overall health. Generally, adults need about 1,000 mg per day.</p>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Phosphorus Deficiency</h2>
            <div class="warning">
                <ul>
                    <li>Rickets in children</li>
                    <li>Osteomalacia in adults</li>
                    <li>Weakened immune system</li>
                    <li>Impaired DNA synthesis</li>
                </ul>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Excessive Phosphorus Consumption</h2>
            <div class="warning">
                <ul>
                    <li>Hypophosphatemia (low phosphate levels)</li>
                    <li>Kidney strain and potential damage</li>
                    <li>Digestive issues</li>
                    <li>Interference with calcium absorption</li>
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
