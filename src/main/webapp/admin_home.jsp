<%@page import="com.vetbuddy.dto.Admin"%>
 <%@page errorPage="error.jsp" %>
<%
Admin admin = (Admin)session.getAttribute("currentAdmin");
session.setAttribute("userType","admin");
if(admin==null)
{
	response.sendRedirect("Admin.jsp");
}
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // Proxies

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<!-- CSS Links  -->

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
  <link rel="stylesheet" href="css/admin_home.css">
 
 <style type="text/css">
  
   
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
    
        </ul>
        <ul class="navbar-nav mr-right d-flex justify-content-center">
        
        
            <li class="nav-item">
              <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><img src="./img/profile.png" style="height:30px;margin-top: 8px"class="profile-img"  alt="profile image"></a>
           </li>
           
           
           <li class="nav-item d-flex align-items-center">
           
            <a  data-bs-toggle="modal" data-bs-target="#profile-modal"><h4 class='mt-2 mr-2' id="user-name"><%=admin.getName()%></h4></a>
            </li>
            
             <li class="nav-item ">
             <a href="./logoutServlet?type=admin"> <button class="btn btn-outline-success mt-2" type="submit" class="logout-btn">Logout</button></a>
            </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- end of nav bar -->


    <div class="container mt-5">
        <h1 class="text-center mb-4">Admin Dashboard</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pending Doctor Verifications</h5>
                        <p class="card-text">Manage doctors awaiting verification</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('pendingDoctor')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Verified Doctor Details</h5>
                        <p class="card-text">View details of verified doctors</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('verifiedDoctor')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">PetOwner Details</h5>
                        <p class="card-text">View details of registered farmers</p>
                        <a href="#" class="btn btn-primary" onclick="getDetails('petOwner')">View <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            
        </div>
        
        <div class="row mt-4" id="detailsContainer"></div>
        <h1 class="text-center d-none" id="emptyRecord">Record Not Found..!</h1>
        
    </div>

   
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>








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
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
  
 <script type="text/javascript">

 
  function getDetails(arg)
  {
	  $.ajax({
	        url:`./getUserDetails?type=${arg}`,
	        method: 'GET',
	        
	        // Sending the doctor data as parameters
	        success: function(data) {
	        	
	        	if(arg == 'pendingDoctor'){
	        		if(data.length!=0){
	     
	        			displayPendingVerifications(data);
	        		}
	        		else{
	        			$('#detailsContainer').empty();
	        			Swal.fire("Record Not Available!");
	        		}
	        		
	        	}
	        	else if(arg == 'verifiedDoctor'){
	        		
	        		if(data.length!=0){
	        		     
	        			displayVerifiedDoctor(data);
	        		}
	        		else{
	        			$('#detailsContainer').empty();
	        			Swal.fire("Record Not Available!");
	        		}
	        		
	        	}
	        	else if(arg == 'petOwner'){
	        		
	        		if(data.length!=0){
	        		     
	        			displayPetOwnerDetails(data);
	        		}
	        		else{
	        			$('#detailsContainer').empty();
	        			Swal.fire("Record Not Available!");
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
  
 
  function displayPetOwnerDetails(data)
  {
	  
	  var detailsContainer = $('#detailsContainer');
	  detailsContainer.empty();
	    
	    var tableHTML = '<table class="table"><thead><tr><th>ID</th><th>NAME<th>EMAIL</th><th>CITY</th><th>POST-CODE</th><th>MOBILE</th><th>ADDRESS</th><th>DISTRICT</th></tr></thead><tbody>';

	    data.forEach(function(verif) {
	        tableHTML += `
	            <tr>
	                <td>${verif.oid}</td>
	                <td>${verif.name}</td>
	                <td>${verif.email}</td>
	                <td>${verif.village}</td>
	                <td>${verif.Postal_code}</td>
	                <td>${verif.mobile}</td>
	                <td>${verif.address}</td>
	                <td>${verif.district}</td>
	            </tr>
	        `;
	    });

	    tableHTML += '</tbody></table>';

	    detailsContainer.html(tableHTML); 
	  
  }
  
  
  
  function displayVerifiedDoctor(data){
	  
	  var detailsContainer = $('#detailsContainer');
	  detailsContainer.empty();
	    
	    var tableHTML = '<table class="table"><thead><tr><th>Name</th><th>Email<th>Post Code</th><th>City</th><th>Mobile</th><th>Verification Status</th><th>Certificate</th><th></th></tr></thead><tbody>';

	    data.forEach(function(verif) {
	        tableHTML += `
	            <tr>
	                <td>Dr. ${verif.name}</td>
	                <td>${verif.email}</td>
	                <td>${verif.Postal_code}</td>
	                <td>${verif.village}</td>
	                <td>${verif.mobile}</td>
	                <td>${verif.verification} <span> <i class="fi fi-rs-check-circle text-success"></i></span></i></td>
	                <td><a href="data:image/png;base64,${verif.base64Image}" target="_blank" class="btn btn-primary">View  <i class=" fas fa-solid fa-eye"></i></a></td>
		            <!--<td><a href="#"  class="btn btn-success" onclick="verfiyDoctor(${verif.did})" >Verify</a></td> -->
	                <!-- Add other table cells for additional details -->
	            </tr>
	        `;
	    });

	    tableHTML += '</tbody></table>';

	    detailsContainer.html(tableHTML); 
	  
	  
  }
  
  
  
  function displayPendingVerifications(data) {
	  
	   var detailsContainer = $('#detailsContainer');
	   detailsContainer.empty();
	    
	    var tableHTML = '<table class="table"><thead><tr><th>Name</th><th>Email<th>Post Code</th><th>City</th><th>Mobile</th><th>Verification Status</th><th>Certificate</th><th>     </th></tr></thead><tbody>';

	    data.forEach(function(verif) {
	        tableHTML += `
	            <tr>
	                <td>Dr. ${verif.name}</td>
	                <td>${verif.email}</td>
	                <td>${verif.Postal_code}</td>
	                <td>${verif.village}</td>
	                <td>${verif.mobile}</td>
	                <td>${verif.verification} <span>  <i class="fi fi-rs-check-circle d-none text-success pending"></i><i class="verified fi fi-ss-cross-circle text-danger"></i></span></i></td>
	                <td><a href="data:image/png;base64,${verif.base64Image}" target="_blank" class="btn btn-primary">View  <i class=" fas fa-solid fa-eye"></i></a></td>
		            <td><a href="#"  class="btn btn-success" onclick="verfiyDoctor(${verif.did})" >Verify</a></td>
	            </tr>
	        `;
	    });

	    tableHTML += '</tbody></table>';

	    detailsContainer.html(tableHTML);
	    
	    
	   
	}
  function verfiyDoctor(did)
  {
	  
	  $.ajax({
		  url:`./verfiyServlet?did=${did}`,
		  method:"POST",
		  success: function (response,status){
			  
		      Swal.fire({
				   title: "Verified!",
				   text: "Doctor Verified Successfully",
				   icon: "success"
				}).then((event)=>{
					 
					getDetails('pendingDoctor') // Reloads the current page
				});	  
			  
		  },
		  error: function (error,status){
		  
			  alert(error);
		  }
		  
	  });
	  
  }
  

</script>
</body>
</html>