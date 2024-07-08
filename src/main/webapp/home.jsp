


<%@page import="com.vetbuddy.dto.PetOwner"%>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
  
    
<!DOCTYPE html>
<html lang="en">
<head>


	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
    crossorigin="anonymous"

  />
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.css?v=2">
  <link rel="stylesheet" href="css/home.css?v=2">
  
 
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
            <a class="nav-link active" aria-current="page" href="#home">Home</a>
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
           
           
           <li class="nav-item ">
           <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><h4 style="margin-right: 10px;" id="user-name"><%=petOwner.getName()%></h4></a>
            </li>
            
             <li class="nav-item ">
             <a href="./logoutServlet?type=petOwner"> <button class="btn btn-outline-success mt-2" type="submit" class="logout-btn">Logout</button></a>
            </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- end of nav bar -->


					<!--Profile Modal  -->
					
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
            <h3 style="font-weight: 600;" class="modal-title" id="exampleModalLabel"><%=petOwner.getName()%></h3>
            
            <div id="profile-details">
            
               <table class="table table-striped">
            
               
               <tbody>
                  <tr>
                      <th scope="row">PetOwner ID:</th>
                      <td> <%=petOwner.getOid()%></td>
                 </tr>
                 
                  <tr>
                      <th scope="row">Email ID:</th>
                      <td><%=petOwner.getEmail() %></td>
                 </tr>
                  <tr>
                      <th scope="row">Mobile No:</th>
                      <td><%=petOwner.getMobile()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Village:</th>
                      <td><%=petOwner.getVillage()%></td>
                 </tr>
                  <tr>
                      <th scope="row">District:</th>
                      <td><%= petOwner.getDistrict() %></td>
                 </tr>
                  <tr>
                      <th scope="row">Post code :</th>
                      <td><%=petOwner.getPostal_code()%></td>
                 </tr>
                  <tr>
                      <th scope="row">Address :</th>
                      <td><%=petOwner.getAddress()%></td>
                 </tr>
               
               
               
               </tbody>
               
               </table>
            </div>
            
            
            
            <!-- Edit profile -->
            
             <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="editServlet?type=petOwner" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>PetOwner ID :</td>
                                            <td><%= petOwner.getOid()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email ID:</td>
                                            <td> <input type="email" class="form-control" name="email" value="<%=petOwner.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="name" value="<%=petOwner.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="password" value="<%=petOwner.getPassword()%>" > </td>
                                        </tr>
                                     
                                        <tr>
                                            <td>Address:</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="address" ><%= petOwner.getAddress()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Post code</td>
                                            <td>
                                                <input type="text" name="postal_code" class="form-control" value="<%=petOwner.getPostal_code()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Village</td>
                                            <td>
                                                <input type="text" name="village" class="form-control" value="<%=petOwner.getVillage()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>District</td>
                                            <td>
                                                <input type="text" name="district" class="form-control" value="<%=petOwner.getDistrict()%>">
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" id="save-btn" class="btn btn-outline-primary">Save</button>
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

<!-- End of User Modal -->




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

    
   
      
      
      
      


     <div class="feature d-flex justify-content-around">

     <!-- 
      <div class="card feature-card">
          <div class="card-header d-flex justify-content-center">
            <img src="./img/online-vet-3.png" alt="">
          </div>
          <div class="card-body">
            <h3>Search For Doctor</h3>
          </div>
      
      </div>
      -->
      
      
      <div class="card feature-card">
          <div class="card-header d-flex justify-content-center">
            <img src="./img/vet-appointment.png" alt="">
          </div>
          <div class="card-body">
            <h3><a href='book_appointment.jsp'>Easy Appointment Booking</a></h3>
          </div>
      
      </div>
      
       
      <div class="card feature-card" onclick="getDetails('myAppointment')">
          <div class="card-header d-flex justify-content-center">
            <img src="./img/my_appoint.png" class="vac-img" id="my_appointment_img" alt="">
          </div>
          <div class="card-body text-center">
         <a href="#"><h3>My Appointments</h3></a>
          </div>
      
      </div>
      
      
      <div class="card feature-card" onclick="getDetails('recentAppointment')">
          <div class="card-header d-flex justify-content-center">
            <img src="./img/online-vet-3.png" alt="">
          </div>
          <div class="card-body">
         <a href="#"><h3>Recent Appointment</h3></a>
          </div>
      
      </div>
      
      
     </div>
     
  		<div class="container" id="detailsContainer"></div>


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
      <div class="pet-section">
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
 <script src="https://kit.fontawesome.com/d5aa1064be.js" crossorigin="anonymous"></script>
 
  <script type="text/javascript">
  
  
  function getDetails(arg)
  {
	  $.ajax({
	        url:`./getUserDetails?type=${arg}&oid=<%=petOwner.getOid()%>`,
	        method: 'GET',
	        
	        // Sending the doctor data as parameters
	        success: function(data) {
	        	console.log(data);
	        	
	        	 let cnt =  myAllAppointment(data);
	        	 if(cnt==0){
	        		$('#detailsContainer').empty();
 	        		Swal.fire("No Records available");
	        	 }
	        	
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
  }
  
  function closeTable(){
	  
	  var detailsContainer = $('#detailsContainer');
	  detailsContainer.empty();
  }
  

  function myAllAppointment(data) {
	  
	    var detailsContainer = $('#detailsContainer');
	    detailsContainer.empty();

	  
	        var today = new Date();
	        var todayFormatted = today.toISOString().split('T')[0];

	        var tableHTML = '<table class="table"><thead><tr><th>Doctor Name</th><th>Specialization<th>Species</th><th>Breed</th><th>AppointmentDate</th><th>BookingDate</th><th>Status <i class="fa-solid fa-xmark ml-2 cancel" onclick="closeTable()" ></i></th></tr></thead><tbody>';
            let cnt = 0;
	        data.forEach(function (verif) {
	        	
	        	
	        	// Extract the appointment date in YYYY-MM-DD format
	            var appointmentDate = verif.appointmentDate.split('T')[0];
	        
	            if (appointmentDate>=todayFormatted) {
	            	cnt=cnt+1;
	                tableHTML += `
	                    <tr>
	                        <td>${verif.doctorName}</td>
	                        <td>${verif.specialization}</td>
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
      
      
      
  
  </script>
  
       

  
     
</body>
</html>