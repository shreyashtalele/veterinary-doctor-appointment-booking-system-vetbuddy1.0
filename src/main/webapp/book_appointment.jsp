<%@page import="com.vetbuddy.dto.PetOwner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<%
PetOwner petOwner =(PetOwner)session.getAttribute("currentUser");
if(petOwner==null)
{
	response.sendRedirect("petOwner_login.jsp");
}
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Easy Appointment Booking</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"

  />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/book_appointment.css?v=2">
  <style>

  </style>
</head>
<body>


<!-- nav bar -->

  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="./img/logo.jpeg" class="logo" alt=""></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarScroll">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link " href="#">Contact</a>
          </li>
        </ul>
        <ul class="navbar-nav mr-right d-flex justify-content-center">
        
        
            <li class="nav-item">
              <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><img src="./img/profile.png" style="height:30px;margin-top: 8px"class="profile-img"  alt="profile image"></a>
           </li>
           
           
           <li class="nav-item ">
           <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><h4 class="mr-2 mt-2"id="user-name"><%=petOwner.getName()%></h4></a>
            </li>
            
             <li class="nav-item ">
             <a href="./logoutServlet?type=petOwner"> <button class="btn btn-outline-success mt text-white" type="submit" class="logout-btn">Logout</button></a>
            </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- end of nav bar -->



  <div class="container mt-5">
    <h2 class="text-center mb-3">Easy Appointment Booking</h2>

    <!-- Doctor Search -->
    <div class="input-group mb-3">
      <input type="text" class="form-control" id="doctorSearch" placeholder="Search for a doctor" >
      <div class="input-group-append">
        <button class="btn btn-primary" type="button" id="searchButton" onclick="showDoctorsBySearch()">Search</button>
      </div>
    </div>


    <!-- Appointment Form (Initially hidden) -->
    
    <form action="./appointmentBook" method="post" id="appointmentForm" class="form-container"style="display: none;">
  		<h3 class='text-center '>Appointment Form</h3>
  		<div id="selectedDoctorInfo"></div>

		  <div class="row">
		    <!-- First Column -->
		    <div class="col-md-6">
		      <!-- Pet Owner's Information -->
		      <div class="form-group">
		       	 <label for="ownerName">Your Name</label>
		       	 <input type="text" class="form-control" id="ownerName" placeholder="Enter your name" name="name" value=<%=petOwner.getName() %>>
		      </div>
		      <div class="form-group">
		        <label for="ownerPhone">Phone Number</label>
		        <input type="tel" class="form-control" id="ownerPhone" placeholder="Enter your phone number" name="mobile" value=<%=petOwner.getMobile() %>>
		      </div>
		      <div class="form-group">
		        <label for="ownerEmail">Email Address</label>
		        <input type="email" class="form-control" id="ownerEmail" placeholder="Enter your email" name="email" value=<%=petOwner.getEmail()%>>
		      </div>
		
		      <!-- Pet's Information -->
		      <div class="form-group">
		        <label for="petName">Pet's Name</label>
		        <input type="text" class="form-control" id="petName" placeholder="Enter pet's name" name="petname" required="required">
		      </div>
		      
		    </div>

    <!-- Second Column -->
    <div class="col-md-6">
      <!-- Pet's Information Contd. -->
      <div class="form-group">
        <label for="petBreed">Pet's Breed</label>
        <input type="text" class="form-control" id="petBreed" placeholder="Enter pet's breed" name="breed" required="required">
      </div>
      <div class="form-group">
        <label for="petAge">Pet's Age</label>
        <input type="text" class="form-control" id="petAge" placeholder="Enter pet's age" name="age" required="required">
      </div>

      <!-- Appointment Details -->
      <div class="form-group">
        <label for="appointmentDate">Preferred Date</label>
        <input type="date" class="form-control" id="appointmentDate" name="date" required="required">
      </div>
      
      <div class="form-group">
        <label for="petType">Species</label>
        <input type="text" class="form-control" id="petType" placeholder="Enter pet's type" name="species" required="required">
      </div>
      
    </div>
  </div>

  <button type="submit" class="btn btn-primary btn-block">Book Appointment</button>
</form>
   

    <!-- Display Available Doctors as Cards -->
    <div class="form-group">
      <label for="doctorSelection">Available Doctors</label>
      <div class="row" id="doctorCards">
        <!-- Doctor cards will be dynamically populated here -->
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
  
    var doctorData;
   
    
    
    function showDoctors(data)
    {
 	   	    const doctorCardsContainer = $('#doctorCards');
    		doctorCardsContainer.empty(); // Clear previous results
    		
    		 data.forEach(function (doctor){
    		 const card = createDoctorCard(doctor);
             doctorCardsContainer.append(card);
    	   })
    }   
    function showDoctorsBySearch()
    {
    	    var query = document.getElementById("doctorSearch");
 	   	    const doctorCardsContainer = $('#doctorCards');
    		doctorCardsContainer.empty(); // Clear previous results
    		
    		const filteredDoctors = doctorData.filter(function(doctor) {
    	        
    	        return doctor.Postal_code === Number(query.value)||doctor.name.toLowerCase() == query.value.toLowerCase()  ;
    	    });

    		filteredDoctors.forEach(function (doctor){
    		 const card = createDoctorCard(doctor);
             doctorCardsContainer.append(card);
    	   })
    }   
    
   
    $(document).ready(function (event) {
        console.log("loaded........")

        $('#appointmentForm').on('submit', function (event) {
        	
            event.preventDefault();

            let form = new FormData(this);

            //send register servlet:
            $.ajax({
                url: "./appointmentBook",
                method: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                	
                	if(data.trim() === "done"){
                	Swal.fire({
                		  title: "Appointment Book!",
                		  text:  "The appointment is booked successfully. Once the doctor confirms it, we'll send you an email.",
                		  icon: "success"
                		}).then((event)=>{
                			window.location = "home.jsp"
                		})
                	}
                	else{
                		Swal.fire(data)
                		
                	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                
                    
                	Swal.fire("SweetAlert2 is working!");  
                },
                processData: false,
                contentType: false

            });



        });


    });

    
    
    $(document).ready(function () {
        console.log("loaded........")

            $.ajax({
                url: "./getUserDetails?type=verifiedDoctor",
                method: 'GET',
                success: function (data, textStatus, jqXHR) {
                	     showDoctors(data);
                	     doctorData = data;
                	     
                },
                error: function (jqXHR, textStatus, errorThrown) {
                
                    
                }
     
            });
        
        });
    
 
    // Function to handle doctor selection
    function selectDoctor(doctorId) {
    	
    	 const selectedDoctor = doctorData.find((doctor)=>doctor.did === doctorId);
      
      // Update the appointment form with selected doctor's details
     	 	const selectedDoctorInfo = $('#selectedDoctorInfo');
     	 	selectedDoctorInfo.empty();
      		selectedDoctorInfo.append(`
        	<p><strong>Selected Doctor:</strong> ${selectedDoctor.name}</p>
        	<p><strong>Specialization:</strong> ${selectedDoctor.email}</p>
        	<input type="hidden" id="selectedDoctorId" value="${selectedDoctor.did}" name="did">
        	<input type="hidden" id="selectedDoctorId" value=<%=petOwner.getOid()%> name="ownerid">
      `);

      // Show the appointment form
      $('#appointmentForm').show();
    }
   

    
    
    // Function to create a card for each doctor
    function createDoctorCard(doctor) {
      const card = `
        <div class="col-md-4 mb-3">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Dr. ${doctor.name}</h5>
              <p class="card-text">${doctor.specialization}</p>
              <button class="btn btn-primary btn-sm" onclick="selectDoctor(${doctor.did})">Select Doctor</button>
            </div>
          </div>
        </div>
      `;
      return card;
    }

    
    
  </script>
</body>
</html>

