<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VetBuddy - Registration Confirmation</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CDN for clock icon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
    <style type="text/css">
     .box{
           box-shadow: 0px 0px 10px #c2c2c2;
       }
    
    </style>
</head>

<body>
    <div class="container mt-5 ">
        <div class="row justify-content-center ">
            <div class="col-md-6">
                <div class="card box">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Thank You for Registering at VetBuddy</h2>
                        <div class="text-center mb-4">
                            <i class="fas fa-clock fa-5x text-primary"></i> <!-- Clock icon -->
                        </div>
                        <p class="card-text text-center info">
                            Your account is pending verification.<br>
                            Please allow up to 30 minutes for the verification process.
                            Once the verification is complete, your username and password will be sent to your registered email.
                        </p>
                    </div>
                </div>
                
                <div class="text-center mt-4">
                            <a href="doctor_login.jsp" class="btn btn-primary">Back to Login</a> <!-- Button to go back to login page -->
                 </div>
            </div>
        </div>
    </div>
    
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>

</html>
