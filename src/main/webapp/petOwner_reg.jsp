<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"
  />
  <link rel="stylesheet" href="css/common.css?v=2">
   <link rel="stylesheet" href="css/petOwner_reg.css?v=2">
   
   <style type="text/css">
   
   .outer{
        background-color: #0093E9;
        background-image: linear-gradient(160deg, #0093E9 0%, #80D0C7 100%);
   }
   </style>
</head>
<body>

    <div class="outer">

        <div class="inner">
        <form action="./petOwnerRegisterServlet" method="post" id="reg-form">
            <header>
                <h1 style="text-align: center;">SignUp</h1>
            </header>
          
   
           <main class="Signup-body">
            <p>
                <Label for="name">Enter Your Name</Label>
                <input type="text" id="name" placeholder="Enter Your full name" name="name" required="required">
            </p>
            <p>
                <Label for="email">Enter Your Email</Label>
                <input type="email" id="email" placeholder="xyz@gmail.com" name="email" required="required">
            </p>
            <p>
                <Label for="pass">Enter Your New Password</Label>
                <input type="password" id="pass" placeholder="at least 8 character" name="password" required="required">
            </p>
            <p>
                <Label for="mobile">Enter Your Mobile Number</Label>
                <input type="tel" id="mobile" placeholder="+91xxxxxxxxx" name="mobile" required="required">
            </p>
            <p>
                <div class="form-group">
                    <Label for="address">Your Address</Label>
                    <textarea class="form-control" id="address" rows="3" name="address" required="required"></textarea>
                  </div>
            </p>
            <p>
                <Label for="postalcode">Postal Code</Label>
                <input type="number" id="postalcode" placeholder="" name="postalcode" required="required">
            </p>
            <p>
                <Label for="village">Village</Label>
                <input type="text" id="village" placeholder="" name="village" required="required">
            </p>
            <p>
                <Label for="district">District</Label>
                <input type="text" id="district" placeholder="" name="district" required="required">
            </p>
            <p>
                
                <input type="submit" value="Create Account" id="submit">
            </p>
           </main>
        </form>

        <footer class="signup-footer">
        <p>Already have an Account?<a href="petOwner_login.jsp">Login</a></p>
        </footer>
        </div>
        
    </div>
 
    
    <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
    crossorigin="anonymous"
  ></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

   <script>
            $(document).ready(function (event) {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                	
                    event.preventDefault();
                    
                    let password = $('#pass').val(); // Fetch the value of the password field

                    // Check if the password length is less than 8 characters
                    if (password.length < 8) {
                        swal("Password should have at least 8 characters");
                        return; // Prevent form submission if password length is less than 8 characters
                    }
           
                    let form = new FormData(this);

                    //send register servlet:
                    $.ajax({
                        url: "./petOwnerRegisterServlet",
                        method: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

     

                            if (data.trim() === 'done')
                            {
                                 
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "petOwner_login.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>
</body>
</html>