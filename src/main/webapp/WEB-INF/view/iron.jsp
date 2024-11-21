<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iron - Essential Nutrient Information</title>
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
        <h1>Iron - Essential Nutrient</h1>

        <div class="section">
            <h2>What is Iron?</h2>
            <p>Iron is a macronutrient that is essential for building muscle mass, repairing tissue, making enzymes and hormones, and maintaining various body functions.</p>
        </div>

        <div class="section">
            <h2>Rich Iron Sources</h2>
            <div class="food-list">
                <div class="food-item">Red Meat</div>
                <div class="food-item">Poultry</div>
                <div class="food-item">Fish</div>
                <div class="food-item">Fortified Cereals</div>
                <div class="food-item">Legumes</div>
                <div class="food-item">Spinach</div>
                <div class="food-item">Beetroot</div>
                <div class="food-item">Clams</div>
            </div>
        </div>

        <div class="section">
            <h2>Daily Recommended Intake</h2>
            <div class="recommendation">
                <h3>For Men:</h3>
                <p>8 milligrams per day for the average sedentary man</p>
                <h3>For Women:</h3>
                <p>18 milligrams per day for the average sedentary woman</p>
                <p><em>Note: Athletes and active individuals may need more iron based on their activity level.</em></p>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Iron Deficiency</h2>
            <div class="warning">
                <ul>
                    <li>Anemia and fatigue</li>
                    <li>Shortness of breath</li>
                    <li>Headaches and weakness</li>
                    <li>Pale skin</li>
                    <li>Cold hands and feet</li>
                    <li>Poor appetite</li>
                </ul>
            </div>
        </div>

        <div class="section">
            <h2>Effects of Iron Overdose</h2>
            <div class="warning">
                <ul>
                    <li>Stomach pain and nausea</li>
                    <li>Vomiting blood (hematemesis)</li>
                </ul>
        </div>
    </div>