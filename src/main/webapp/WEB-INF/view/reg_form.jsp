<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration - Contact Application </title>
    <link href="static/css/style.css" rel="stylesheet" type="text/css" />
    <script src="static/js/jquery.js"></script>

    <script>
        $(document).ready(function (){
            $("#checkAvailability").click(function(){
                $.ajax({
                    url : 'check_avail',
                    data : { username: $("#username").val()} ,
                    success : function(data){
                        $("#availabilityResult").html(data);
                    }
                });
            });
        });

       function validateName() {
           const nameInput = document.getElementById("name");
           const name = nameInput.value;
           const nameValidationElement = document.getElementById("name-validation");

           // Remove any digits from the input
           nameInput.value = name.replace(/\d/g, '');

           // Regular expression to check if the name contains only alphabets (including spaces)
           const alphabetPattern = /^[A-Za-z\s]+$/;

           if (name.length === 0) {
               nameValidationElement.innerHTML = "Name cannot be empty";
           }
           else if (name.length > 20) {
               nameValidationElement.innerHTML = "Name must be maximum 20 characters long";
           }
           else if (!alphabetPattern.test(nameInput.value)) {
               nameValidationElement.innerHTML = "Name can only contain alphabets, spaces and numbers";
           }
           else {
               nameValidationElement.innerHTML = "";
           }
       }


        function validateEmail () {
            const email = document.getElementById("email").value;
            const splitedEmail = email.split("@");

            if (splitedEmail[1] != "yash.com") {
                document.getElementById("email-validation").innerHTML = "Invalid email (ex.yourname@yash.com)";
            }
            else {
                document.getElementById("email-validation").innerHTML = "";
            }
        }

        function validatePassword() {
        		const password = document.getElementById("password").value;

        	    const specialCharacterSet = "!@#$%^&*()-_=+";
        	    let hasSpecialChar = false;

        	    for (let char of specialCharacterSet) {
        	        if (password.includes(char)) {
        	            hasSpecialChar = true;
        	            break;
        	        }
        	    }

        	    if (!hasSpecialChar) {
        	    	document.getElementById("password-validation").innerHTML = "Password must contain special character";
        	    }
        	    else if (password.length < 8) {
        	    	document.getElementById("password-validation").innerHTML = "Password must be of atleast 8 charaters";
        	    }
        	    else if (password == password.toLowerCase()) {
        	        document.getElementById("password-validation").innerHTML = "Enter at least one uppercase letter";
                }
                else if (password === password.toUpperCase()) {
                    document.getElementById("password-validation").innerHTML = "Enter at least one lowercase letter";
                }
                else if (!/\d/.test(password)) {
                    document.getElementById("password-validation").innerHTML = "Enter at least one digit in your password";
        	    }
        	    else {
        	    	document.getElementById("password-validation").innerHTML = "";
        	    }
        	}

        	$(document).ready(function() {
                $("#name").on('input', function() {
                    // Remove digits and special characters
                    this.value = this.value.replace(/[^a-zA-Z\s]/g, '');
                });
            });
    </script>

    <style>
        body {
            padding: 0;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f8f0;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='800' height='600' viewBox='0 0 800 600'%3E%3Crect width='800' height='600' fill='%23f0f8f0'/%3E%3Cg fill='%234CAF50' opacity='0.1'%3E%3Ccircle cx='200' cy='150' r='30'/%3E%3Cpath d='M380 150 C 390 120, 410 120, 420 150 C 430 180, 450 180, 460 150 L 460 200 L 380 200 Z'/%3E%3Cpath d='M180 300 Q 200 250, 220 300 L 220 350 L 180 350 Z'/%3E%3Cpath d='M500 350 C 520 320, 540 320, 560 350 L 560 400 L 500 400 Z'/%3E%3Cpath d='M300 450 Q 320 400, 340 450 L 340 500 L 300 500 Z'/%3E%3C/g%3E%3Cg fill='%23388E3C' opacity='0.1'%3E%3Ccircle cx='600' cy='200' r='25'/%3E%3Cpath d='M100 400 C 110 370, 130 370, 140 400 C 150 430, 170 430, 180 400 L 180 450 L 100 450 Z'/%3E%3Cpath d='M650 450 Q 670 400, 690 450 L 690 500 L 650 500 Z'/%3E%3C/g%3E%3C/svg%3E");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .register-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #666;
        }

        .form-control {
            width: 95%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        #checkAvailability {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        #checkAvailability:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 5px;
            font-size: 13px;
            color: #666;
        }

        .register-button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .register-button:hover {
            background-color: #0056b3;
        }

        .error-message, .success-message {
            font-size: 14px;
            color: red;
            padding: 5px;
            border-radius: 4px;
            background-color: #f8d7da;
            margin-bottom: 15px;
        }

    </style>
</head>
<body>

            <%-- Menu --%>
                <jsp:include page="include/menu.jsp" />

            <%-- Page Content Area--%>
               <div class="register-container">
                   <h2>Create Your Account</h2>

                   <c:if test="${param.act eq 're'}">
                       <div class="success-message">Registration Successful!</div>
                   </c:if>

                   <div>


                       <c:if test="${err!=null}">
                           <div class="error-message">${err}</div>
                       </c:if>

                       <c:if test="${param.act eq 're'}">
                           <div class="success-message">Registration Successful!</div>
                       </c:if>

                       <f:form action="register" modelAttribute="command" method="POST" cssClass="registrationForm">
                           <div class="form-group">
                               <label for="name">Your Name</label>
                               <f:input path="user.name" id="name" cssClass="form-control" onInput="validateName()" required="required"/>
                               <div id="name-validation" style="color:red;"></div>
                           </div>

                           <div class="form-group">
                               <label for="email">Email Address</label>
                               <f:input path="user.email" id="email" cssClass="form-control" type="email" onInput="validateEmail()" required="required"/>
                               <div id="email-validation" style="color:red;"></div>
                           </div>

                           <div class="form-group">
                               <label for="password">Create Password</label>
                               <f:password path="user.password" id="password" cssClass="form-control" onInput="validatePassword()" required="required"/>
                               <div id="password-validation" style="color:red;"></div>
                           </div>

                           <div class="form-group">
                               <label for="username">Choose Username</label>
                               <f:input path="user.loginName" id="username" cssClass="form-control" required="required"/>
                               <div id="name-validation" style="color:red;"></div>
                               <button type="button" id="checkAvailability">Check Availability</button>
                               <div id="availabilityResult" class="result"></div>
                           </div>

                           <div class="form-group">
                               <label for="height">Height (in meters)</label>
                               <f:input path="user.height" id="height" cssClass="form-control" type="number" step="0.01" min="0" required="required"/>
                           </div>

                           <div class="form-group">
                               <label for="weight">Weight (in kilograms)</label>
                               <f:input path="user.weight" id="weight" cssClass="form-control" type="number" step="0.01" min="0" required="required"/>
                           </div>

                           <button type="submit" class="register-button">Register</button>
                       </f:form>
                   </div>

               </div>

            <%-- Footer --%>
                <jsp:include page="include/footer.jsp" />

</body>

</html>