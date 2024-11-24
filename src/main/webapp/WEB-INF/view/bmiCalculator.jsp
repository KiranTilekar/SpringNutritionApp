<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator</title>
    <style>
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
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        . container h1 {
            text-align: center;
            color: #2E7D32;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #388E3C;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 2px solid #4CAF50;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #2E7D32;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }

        button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #388E3C;
        }

        #result {
            margin-top: 20px;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            display: none;
        }

        .normal {
            background-color: #C8E6C9;
            color: #2E7D32;
        }

        .warning {
            background-color: #FFECB3;
            color: #F57F17;
        }

        .danger {
            background-color: #FFCDD2;
            color: #C62828;
        }
    </style>
</head>
<body>
    <jsp:include page="include/menu.jsp" />
    <div class="container">
        <h1>BMI Calculator</h1>
        <form id="bmiForm" onsubmit="calculateBMI(event)">
            <div class="input-group">
                <label for="height">Height (meters):</label>
                <input type="number" id="height" name="height" step="0.01" required min="0.1" max="3.0">
            </div>
            <div class="input-group">
                <label for="weight">Weight (kg):</label>
                <input type="number" id="weight" name="weight" step="0.1" required min="1" max="500">
            </div>
            <button type="submit">Calculate BMI</button>
        </form>
        <div id="result"></div>
    </div>

    <script>
        function calculateBMI(event) {
            event.preventDefault();

            const height = parseFloat(document.getElementById('height').value);
            const weight = parseFloat(document.getElementById('weight').value);

            const bmi = weight / (height * height);
            const resultDiv = document.getElementById('result');

            let category, className;

            if (bmi < 18.5) {
                category = "Underweight";
                className = "warning";
            } else if (bmi < 25) {
                category = "Normal weight";
                className = "normal";
            } else if (bmi < 30) {
                category = "Overweight";
                className = "warning";
            } else {
                category = "Obese";
                className = "danger";
            }

            // Clear any existing content
            resultDiv.textContent = '';

            // Create and append BMI value
            const bmiText = document.createElement('div');
            bmiText.innerHTML = `Your BMI is <strong>${bmi.toFixed(1)}</strong>`;
            resultDiv.appendChild(bmiText);

            // Create and append category
            const categoryText = document.createElement('div');
            categoryText.innerHTML = `Category: <strong>${category}</strong>`;
            resultDiv.appendChild(categoryText);

            // Set class and display
            resultDiv.className = className;
            resultDiv.style.display = "block";

            console.log("BMI:", bmi, "Category:", category);
        }
    </script>
        <jsp:include page="include/footer.jsp" />

</body>
</html>