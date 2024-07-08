<%@page import="com.vetbuddy.dto.Doctor"%>
<%
Doctor doctor = (Doctor)session.getAttribute("currentDoctor");
if(doctor==null)
{
	response.sendRedirect("doctor_login.jsp");
}

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page errorPage="error.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<head>


 <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"

  />
  
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-solid-straight/css/uicons-solid-straight.css'>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-straight/css/uicons-regular-straight.css'>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/doctor_home.css?v=2">
  
  <style type="text/css">



</style>
  
</head>


<body id="body">
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
		            <a class="nav-link active" aria-current="page" href="">Home</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="#about-head">About</a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link " href="#contact">Contact</a>
		          </li>
        		</ul>
                  <ul class="navbar-nav mr-right d-flex justify-content-center">
        
        
            	<li class="nav-item">
            		  <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><img src="./img/profile.png" style="height:30px;margin-top: 8px"class="profile-img"  alt="profile image"></a>
          	   </li>
           
           
           	<li class="nav-item d-flex align-items-center">
           
            	<a  data-bs-toggle="modal" data-bs-target="#profile-modal"><h4 class='mt-2 mr-2' id="user-name"><%=doctor.getName()%></h4></a>
            </li>
            
             <li class="nav-item ">
             <a href="./logoutServlet?type=doctor"> <button class="btn btn-primary mt-2 text-white" type="submit" class="logout-btn">Logout</button></a>
            </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- end of nav bar -->




<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h4 class="modal-title" id="exampleModalLabel">VetBuddy</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <div class="container text-center">
            <img alt="" src="./img/profile.png" style="max-width:90px ">
            <h3 style="font-weight: 600;" class="modal-title" id="exampleModalLabel"><%=doctor.getName()%></h3>
            
            <div id="profile-details">
            
               <table class="table table-striped">
            
               
               <tbody>
                  <tr>
                      <th scope="row">Doctor ID:</th>
                      <td> <%=doctor.getDid()%></td>
                 </tr>
                 
                  <tr>
                      <th scope="row">Email ID:</th>
                      <td><%=doctor.getEmail()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Mobile No:</th>
                      <td><%=doctor.getMobile()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Village:</th>
                      <td><%=doctor.getVillage()%></td>
                 </tr>
                  <tr>
                      <th scope="row">District:</th>
                      <td><%= doctor.getDistrict()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Post code :</th>
                      <td><%=doctor.getPostal_code()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Address :</th>
                      <td><%=doctor.getAddress()%></td>
                 </tr>
               
               
               
               </tbody>
               
               </table>
            </div>
            
            
            
            
               
            <!-- Edit profile -->
            
             <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="editServlet?type=doctor" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>PetOwner ID :</td>
                                            <td><%= doctor.getDid()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email ID:</td>
                                            <td> <input type="email" class="form-control" name="email" value="<%=doctor.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="name" value="<%=doctor.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="password" value="<%=doctor.getPassword()%>" > </td>
                                        </tr>
                                     
                                        <tr>
                                            <td>Address:</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="address" ><%= doctor.getAddress()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Post code</td>
                                            <td>
                                                <input type="text" name="postal_code" class="form-control" value="<%=doctor.getPostal_code()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Village</td>
                                            <td>
                                                <input type="text" name="village" class="form-control" value="<%=doctor.getVillage()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>District</td>
                                            <td>
                                                <input type="text" name="district" class="form-control" value="<%=doctor.getDistrict()%>">
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" id="save-btn" class="btn btn-outline-primary text-white">Save</button>
                                    </div>

                                </form>    

                            </div>
                            
                            <!-- end of edit page -->
            
            
            
            
            
            
          </div>
      </div>
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button  id="profile-edit-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
            




  <!-- caraousel  -->
  
    <div id="home"></div>
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="10000">
            <img src="./img/asset 1.webp" class="d-block w-100 c-img1" alt="...">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="./img/img1.jpg" class="d-block w-100" alt="...">
          </div>
         
        </div>
        
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>





    <div class="container mt-5">
        <h1 class="text-center mb-4">Doctor Dashboard</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Upcoming Appointments</h5>
                        <p class="card-text">Manage Pet Owner awaiting appointments</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('upcomingAppointment')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Today's Appointments</h5>
                        <p class="card-text">View appointments scheduled for today</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('todayAppointment')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Past Appointments</h5>
                        <p class="card-text">View details of past appointments</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('pastAppointment')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            
        </div>
         
            	<!-- Loader -->
		      <div class="loader d-none">
		        <div class="first"></div>
		        <div class="second"></div>
		        <div class="third"></div>
		    </div>
          
        <div class="row mt-4" id="detailsContainer"></div>
        <h1 class="text-center d-none" id="emptyRecord">Record Not Found..!</h1>
        
    </div>
    
    
    
    <!-- -hero sectiuon  -->
    
    
    
<!-- Hero section -->
<div class="container">
     <div class="hero-section-heading"><h2>How VetBuddy Works</h2></div>
  <div class="work-section d-flex">
          <div class="info-card d-flex">
            <img src="./img/asset 15.png" class="d-block" alt="">
            <div class="heading">1. Tell us what's wrong</div>
            <div class="info">Enter your pet's details and get instant access to top vets across India.</div>
          </div>
          <div class="info-card d-flex">
            <img src="./img/asset 16.png" class="d-block" alt="">
            <div class="heading">2. Talk to the Veterinary doctor</div>
            <div class="info">Talk to your assigned expert vet over chat and video. Get detailed prescriptions and notes.</div>
          </div>
          <div class="info-card d-flex">
            <img src="./img/asset 17.png" class="d-block" alt="">
            <div class="heading">3. Free follow-up</div>
            <div class="info">Get a free follow-up call with your vet up to one week after your consultation.</div>
          </div>
  </div>
</div>


<!-- About us -->



    <!-- Page Heading -->
    <div id="about-head"></div>
    
    
   <div class="about-us" id="about">
   
   <h1 class=" p-heading">About Us</h1>
   </div>

  <div class="container mt-4">
    <section >
      <div class="row d-flex justify-content-center">
        <div class="">
          <h2 class="text-center about-us-heading">Unparalleled Veterinary Care</h2>
          <p class="lead text-center">
          At VetBuddy, our unwavering commitment is to deliver unparalleled veterinary care with a deep sense of compassion and dedication. We strive not just to be a healthcare provider for pets but to become their trusted partners in ensuring a lifetime of well-being.
          </p>
        </div>
       </div> 
       
      <div class="row d-flex justify-content-center">
        <div class="">
          <h2 class="text-center  about-us-heading">Compassionate Care, Tailored for Every Pet</h2>
          <p class="lead text-center">
          We believe that every pet is unique, deserving personalized attention and care. Our mission extends beyond treating ailments; it encompasses nurturing the bond between pets and their owners. By offering compassionate and personalized services, we aim to make each visit to our clinic a positive experience for both pets and their human companions.
          </p>
        </div>
       </div> 
       
    </section>
    </div>  
    
     
    


<div class="container">
      <div class="pet-section" id="pet-section">
        <h2 class="p-heading text-center">Why use VetBuddy Consults</h2>
        <div class="pet-img d-flex justify-content-between">
          <img class="img1"src="./img/asset 19.png" alt="">
          <img class="img2"src="./img/asset 20.png" alt="">
          <img class="img3"src="./img/asset 21.png" alt="">
          <img class="img4"src="./img/asset 18.png" alt="">
    
        </div>

      </div>
</div>



   <!-- Contact -->
      
      
    <div id="contact"></div>
   <div class="about-us">
   
   <h1 class=" p-heading">Contact Us</h1>
   </div>
  <div class="container mt-4">
    <section >
      <div class="row d-flex justify-content-center">
        <div class="contact-section">
          <h2 class="text-center about-us-heading">Contact Details</h2>
          <p class="lead text-center">
           For any inquiries or assistance, feel free to reach out to us using the following contact information:
          </p>
          <ul class="list-unstyled text-center">
            <li><strong>Address:</strong> [Your Veterinary Clinic's Address]</li>
            <li><strong>Phone  :</strong> [Your Clinic's Phone Number]</li>
            <li><strong>Email  :</strong> [Your Clinic's Email Address]</li>
          </ul>
        </div>
       </div> 
     
       
       
       
    </section>

   

  </div>



     <div class="b-example-divider"></div>
     <div class="footer-img d-flex">
      <img src="./img/asset 27.png"  alt="">
     </div>

      
      <div class="container">
        <footer class="py-3 my-4">
          <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
          </ul>
          <p class="text-center text-muted">&copy; 2023 VetBuddy, Inc</p>
        </footer>
      </div>
    
    
 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>   
    <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
    crossorigin="anonymous"
  ></script> 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
  <script type="text/javascript">
  


$(document).ready(function(){
	 
	  let editStatus = false;
	  
	  $('#profile-edit-btn').click(function(){
		  
		  if(editStatus==false)
		  {
			   $("#profile-details").hide();
			   $("#profile-edit").show();
			   editStatus = true;
			   $(this).text("Back"); 
			   
		  }
		  else
		  {
		    $("#profile-details").show();
			    $("#profile-edit").hide(); 
			    editStatus = false;
		    $(this).text("Edit"); 
			    
		  }
		  
	  })
 
  })
   
  
  
  
  
  function getDetails(arg)
  {
	  $.ajax({
	        url:`./getAppointmentDetails?did=<%=doctor.getDid()%>`,
	        method: 'GET',
	        
	        // Sending the doctor data as parameters
	        success: function(data) {
	        	
	        	if(arg == 'upcomingAppointment'){
	        		
	        			let cnt = displayUpcomingAppointment(data);
	        			if(cnt==0){
	        		    	$('#detailsContainer').empty();
	 	        			Swal.fire("No upcoming appointments available!");	 
	        		      }
	        	       }
	        	else if(arg == 'todayAppointment'){
	        		
	        			let cnt =  displayTodayAppointment(data);
	        		     if(cnt==0){
	        		    	$('#detailsContainer').empty();
	 	        			Swal.fire("No Todays Appointments Available!");	 
	        		    }
	        	     }
	        	else if(arg == 'pastAppointment'){
	        		
	        			let cnt = displayPastAppointment(data);
                            if(cnt==0){
	        		    	$('#detailsContainer').empty();
	 	        			Swal.fire("No past appointments available");	 
	        		      }
	        		
	        		
	        	}
	        	else{
	        		alert("Something Went Wrong...")
	        	}
	            console.log(data)
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
  }
  
 
 
  
  function displayPastAppointment(data) {
	    var detailsContainer = $('#detailsContainer');
	    detailsContainer.empty();

	    var today = new Date();
	    var todayFormatted = formatDate(today); // Format today's date

	    var tableHTML = '<table class="table"><thead><tr><th>OwnerName</th><th>Address<th>Species</th><th>Breed</th><th>AppointmentDate</th><th>BookingDate</th><th>Status</th><th></th></tr></thead><tbody>';
	    let cnt = 0;

	    data.forEach(function (verif) {
	        var appointmentDate = new Date(verif.appointmentDate); // Convert appointment date to a Date object
	        var appointmentFormatted = formatDate(appointmentDate); // Format appointment date
            
	        if (appointmentDate < today && appointmentFormatted !==todayFormatted ) {
	        	
	            cnt = cnt + 1;
	            tableHTML += `
	                <tr>
	                    <td>${verif.ownerName}</td>
	                    <td>${verif.address}</td>
	                    <td>${verif.petSpecies}</td>
	                    <td>${verif.breed}</td>
	                    <td>${verif.appointmentDate}</td>
	                    <td>${verif.bookingDate}</td>
	                    <td>${verif.appointment_status}</td>
	                </tr>
	            `;
	        }
	    });

	    tableHTML += '</tbody></table>';
	    detailsContainer.html(tableHTML);

	    // Handle case when data is empty or not available
	    return cnt;
	}

  
  function formatDate(inputDate) {
	    var dateObj = new Date(inputDate);
	    var options = { month: 'short', day: 'numeric', year: 'numeric' };
	    var formattedDate = dateObj.toLocaleDateString('en-US', options);
	    return formattedDate;
	}

  
  
  function displayTodayAppointment(data) {
	    var detailsContainer = $('#detailsContainer');
	    detailsContainer.empty();

	    var today = new Date();
	    var todayFormatted = formatDate(today); // Format today's date

	    var tableHTML = '<table class="table"><thead><tr><th>OwnerName</th><th>Address<th>Species</th><th>Breed</th><th>AppointmentDate</th><th>BookingDate</th><th>Status</th><th>Action</th><th>Cancel</th></tr></thead><tbody>';
	    let cnt = 0;

	    data.forEach(function (verif) {
	        if (verif.appointmentDate) {
	            var verifFormatted = formatDate(verif.appointmentDate); // Format appointment date
             
	            if (verifFormatted == todayFormatted) {
                 console.log(verifFormatted)
	                cnt = cnt + 1;
	                tableHTML += `
	                    <tr>
	                        <td>${verif.ownerName}</td>
	                        <td>${verif.address}</td>
	                        <td>${verif.petSpecies}</td>
	                        <td>${verif.breed}</td>
	                        <td>${verifFormatted}</td> <!-- Display formatted date -->
	                        <td>${verif.bookingDate}</td>
	                        <td>${verif.appointment_status}</td>
	                        <td><a href="#" class="btn btn-success success-btn" onclick="updateAppointment('${verif.appointment_status}','Confirm',${verif.oid},'${verif.email}',${verif.aid},'${verif.appointmentDate}','${verif.petSpecies}','${verif.ownerName}')">Confirm</a></td>
		                    <td><a href="#" class="btn btn-danger cancel-btn" onclick="updateAppointment('${verif.appointment_status}','Cancel',${verif.oid},'${verif.email}',${verif.aid},'${verif.appointmentDate}','${verif.petSpecies}','${verif.ownerName}')">Cancel</a></td>
	                    </tr>
	                `;
	            }
	        }
	    });

	    tableHTML += '</tbody></table>';
	    detailsContainer.html(tableHTML);

	    // Handle case when data is empty or not available
	    return cnt;
	}

  
  

	
	
	function displayUpcomingAppointment(data) {
	    var detailsContainer = $('#detailsContainer');
	    detailsContainer.empty();

	    var today = new Date();
	    var todayFormatted = formatDate(today); // Format today's date

	    var tableHTML = '<table class="table"><thead><tr><th>OwnerName</th><th>Address<th>Species</th><th>Breed</th><th>AppointmentDate</th><th>BookingDate</th><th>Status</th><th>Action</th><th>Cancel</th></tr></thead><tbody>';
	    let cnt = 0;

	    data.forEach(function (verif) {
	        var appointmentDate = new Date(verif.appointmentDate); // Convert appointment date to a Date object
	        var appointmentFormatted = formatDate(appointmentDate); // Format appointment date

	        if (appointmentDate > today && appointmentFormatted > todayFormatted) {
	            cnt = cnt + 1;
	            tableHTML += `
	                <tr>
	                    <td>${verif.ownerName}</td>
	                    <td>${verif.address}</td>
	                    <td>${verif.petSpecies}</td>
	                    <td>${verif.breed}</td>
	                    <td>${verif.appointmentDate}</td>
	                    <td>${verif.bookingDate}</td>
	                    <td>${verif.appointment_status}</td>
	                    <td><a href="#" class="btn btn-success success-btn" onclick="updateAppointment('${verif.appointment_status}','Confirm',${verif.oid},'${verif.email}',${verif.aid},'${verif.appointmentDate}','${verif.petSpecies}','${verif.ownerName}')">Confirm</a></td>
	                    <td><a href="#" class="btn btn-danger cancel-btn" onclick="updateAppointment('${verif.appointment_status}','Cancel',${verif.oid},'${verif.email}',${verif.aid},'${verif.appointmentDate}','${verif.petSpecies}','${verif.ownerName}')">Cancel</a></td>
	                </tr>
	            `;
	        }
	    });

	    tableHTML += '</tbody></table>';
	    detailsContainer.html(tableHTML);

	    // Handle case when data is empty or not available
	    return cnt;
	}

	
  function updateAppointment(status,type,oid,email,aid,appointmentDate,petSpecies,ownerName)
  {
	  
	  if(status == 'Cancel' && type == 'Cancel'){
		  Swal.fire("The Appointment is Already Cancel")
		  return; 
	  }
	  
	  if(status == 'Confirm' && type != 'Cancel'){
		  Swal.fire("The Appointment is Already Confirm!") 
		  return;
	  }
	  
	  
	  
	  $.ajax({
		  url:`./updateAppointment?type=${type}&oid=${oid}&email=${email}&aid=${aid}&appointmentDate=${appointmentDate}&petSpecies=${petSpecies}&ownerName=${ownerName}&dname=<%=doctor.getName()%>`,

		  method:"POST",
		  beforeSend: function(){
			  
			 // show the loader when request is send 
             $(".loader").removeClass("d-none");
			  
          },
		  success: function (response,status){
			  
			  //Hide the Loader when response is come 
			  $(".loader").addClass("d-none");
			  if(response.trim()=="confirm"){ 
		      Swal.fire({
				   title: "Confirm",
				   text: "Appointment is Confirm Successfully",
				   icon: "success"
				}).then((event)=>{
					 
					getDetails('upcomingAppointment');
				});	 
			  }else if(response.trim()== "cancel"){
				  
				  Swal.fire({
					   title: "Cancel",
					   text: "Appointment is Cancel Successfully",
					   icon: "success"
					}).then((event)=>{
						 
						getDetails('upcomingAppointment');
					});	  
				  
			  }
			  else{
				  Swal.fire(response)
			  }
			  
		  },
		  error: function (error,status){
		  
			 Swal.fire("Somting Went Wrong") 
		  }
		  
	  });
	  
  }
  

  </script>  
</body>
</html>