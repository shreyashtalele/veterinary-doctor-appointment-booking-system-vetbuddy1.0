<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/petOwner_login.css">
</head>
<body>

    <div class="outer">

        <div class="inner" style="min-height:450px;">
        <form action="./doctorLoginServlet" method="post" id="login-form">
            <header>
                <h1 style="text-align: center;">SignIn</h1>
            </header>
           <%
               String status = (String)session.getAttribute("loginStatus");
                String logout_status = (String)session.getAttribute("logout_msg");    
               if("Invalid".equals(status)){
              %>
            	  <div class="alert alert-danger" role="alert">
				  	Invalid Email and password!
				 </div>
            	  
              <%
              
              session.removeAttribute("loginStatus");
              }
              else if("done".equals(logout_status))
              {
                     %>
                     
                   <div class="alert alert-success" role="alert">
					 Logout Successfully
					</div>
                     
                     <%
                session.removeAttribute("logout_msg");
             }
           %>
           
           <main class="Signup-body">
            <p>
                <Label for="email">Enter Your Email</Label>
                <input type="email" id="email" placeholder="xyz@gmail.com" name="email" required="required">
            </p>
            <p>
                <Label for="pass">Enter Your Password</Label>
                <input type="password" id="pass" placeholder="at least 8 character" name="password" required="required">
            </p>
            <p>
                
                <input type="submit" value="Login" id="submit-btn">
            </p>
           </main>
        </form>

        <footer class="signup-footer">
        <p>Don't have an Account?<a href="doctor_reg.jsp">Register</a></p>
        </footer>
        </div>
        
    </div>
 

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>

    // Function to remove the alert message after a specified duration (5000 milliseconds = 5 seconds)
    function removeAlerts() {
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.remove();
            });
        }, 3000); 
    }
    window.onload = function() {
        removeAlerts();
    };
    
    
    
</script>

    
    
</body>
</html>