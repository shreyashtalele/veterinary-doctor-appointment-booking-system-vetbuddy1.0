<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>vetBuddy</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/home.css" />
  </head>
  <body>
  
  <!-- nav bar -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#"
          ><img src="./img/logo.jpeg" class="logo" alt=""
        /></a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarScroll"
          aria-controls="navbarScroll"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
          <ul
            class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
            style="--bs-scroll-height: 100px"
          >
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
           
          </ul>
          <form class="d-flex" role="search">
            <a href="index.jsp"
              class="btn btn-outline-success"
              type="submit"
              id="login-btn"
            >
              Login
            </a>
            
           
          </form>
        </div>
      </div>
    </nav>



<div class="row">

    <div class="col-6 d-flex justify-content-center doctor align-items-center">
        <div class="doctor-card">
            <div class="card-heading">
                <h1>For Doctors</h1>
            </div>
            <div class="card-desc">
                <p>"Be a part of our VetBuddy Veterinary Network!
                    Login to manage appointments, update profiles, and collaborate with fellow professionals in providing quality animal care."</p>
            </div>

            <a href="doctor_login.jsp" class="btn btn-outline-primary  login-btn">Login</a>
               <h6>Don't have Account ? <a href="doctor_reg.jsp">SignUp</a></h6>
        </div>
    </div>

    <div class="col-6 farmer d-flex justify-content-center align-items-center">
        <div class="doctor-card">
            <div class="card-heading">
                <h1>For Pet Owner</h1>
            </div>
            <div class="card-desc">
                <p>"Empowering Pet Owner with VetBuddy         Veterinary Expertise!
                    Login to schedule appointments for your livestock, track medical records, and ensure the well-being of your animals with expert guidance."</p>
            </div>

            <a href="petOwner_login.jsp" class="btn btn-outline-primary  login-btn">Login</a>
            
            <h6>Don't have Account ? <a href="petOwner_reg.jsp">SignUp</a></h6>
     
        </div>
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
  </body>
</html>
