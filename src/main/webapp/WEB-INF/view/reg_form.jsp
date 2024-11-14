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
    </script>

    <style>
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
            width: 100%;
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
            <%-- Header --%>
                <jsp:include page="include/header.jsp" />

            <%-- Menu --%>
                <jsp:include page="include/menu.jsp" />

            <%-- Page Content Area--%>
               <div class="register-container">
                   <h2>Create Your Account</h2>

                   <c:if test="${param.act eq 're'}">
                       <div class="success-message">Registration Successful! Please check your email for verification.</div>
                   </c:if>

                   <div class="register-container">


                       <c:if test="${err!=null}">
                           <div class="error-message">${err}</div>
                       </c:if>

                       <c:if test="${param.act eq 're'}">
                           <div class="success-message">Registration Successful! Please check your email for verification.</div>
                       </c:if>

                       <f:form action="register" modelAttribute="command" method="POST" cssClass="registrationForm">
                           <div class="form-group">
                               <label for="name">Full Name</label>
                               <f:input path="user.name" id="name" cssClass="form-control" />
                           </div>

                           <div class="form-group">
                               <label for="email">Email Address</label>
                               <f:input path="user.email" id="email" cssClass="form-control" type="email" />
                           </div>

                           <div class="form-group">
                               <label for="password">Create Password</label>
                               <f:password path="user.password" id="password" cssClass="form-control" />
                           </div>

                           <div class="form-group">
                               <label for="username">Choose Username</label>
                               <f:input path="user.loginName" id="username" cssClass="form-control" />
                               <button type="button" id="checkAvailability">Check Availability</button>
                               <div id="availabilityResult" class="result"></div>
                           </div>

                           <div class="form-group">
                               <label for="height">Height (in meters)</label>
                               <f:input path="user.height" id="height" cssClass="form-control" type="number" step="0.01" min="0" />
                           </div>

                           <div class="form-group">
                               <label for="weight">Weight (in kilograms)</label>
                               <f:input path="user.weight" id="weight" cssClass="form-control" type="number" step="0.01" min="0" />
                           </div>

                           <button type="submit" class="register-button">Register</button>
                       </f:form>
                   </div>

               </div>

            <%-- Footer --%>
                <jsp:include page="include/footer.jsp" />

</body>

</html>