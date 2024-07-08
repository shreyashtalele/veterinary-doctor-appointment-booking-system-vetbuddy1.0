package com.vetbuddy.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.AppointmentInfo;
import com.vetbuddy.dto.Doctor;
import com.vetbuddy.dto.PetOwner;


@MultipartConfig
@WebServlet("/getUserDetails")
public class getUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public getUserDetails() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		
		String requestType = request.getParameter("type");
       
		
		if("pendingDoctor".equals(requestType))
		{
		
			 String  status = "Pending";
			 List<Doctor> list= Dao.getDoctorDetailsByStatus(status);
			 Gson gson = new Gson();
			 for (Doctor doctor : list) {
				 
			        InputStream imageInputStream = doctor.getCertificate();
			        
			        // Convert the image InputStream to Base64
			        byte[] imageBytes = imageInputStream.readAllBytes();
			        
			        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			       
			        doctor.setBase64Image(base64Image); // Store Base64 image in Doctor object
			    }
			 
			    String jsonData = gson.toJson(list);
             
			 
			 
			 response.setContentType("application/json");
			 response.setCharacterEncoding("UTF-8");
			 response.getWriter().write(jsonData);

			 
			 
		}
		else if("verifiedDoctor".equals(requestType)){
		
			 String  status = "Verified";
			 List<Doctor> list= Dao.getDoctorDetailsByStatus(status);
			 Gson gson = new Gson();
			 for (Doctor doctor : list) {
				  
			        InputStream imageInputStream = doctor.getCertificate();
			        
			        // Convert the image InputStream to Base64
			        byte[] imageBytes = imageInputStream.readAllBytes();
			        
			        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			       
			        doctor.setBase64Image(base64Image); // Store Base64 image in Doctor object
			    }
			 
			    String jsonData = gson.toJson(list);
			 
			    response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    response.getWriter().write(jsonData);
			
		}
		else if("petOwner".equals(requestType))
		{
			
		    List<PetOwner> petOwner = Dao.getAllPetOwner();
		    Gson gson = new Gson();
		    String jsonData = gson.toJson(petOwner);
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("application/json");
		    response.getWriter().write(jsonData);
			
		}
		else if("recentAppointment".equals(requestType)) {
			
		    int oid = Integer.parseInt(request.getParameter("oid"));
			
			List<AppointmentInfo> appointmentInfos = Dao.getAppointmentDetailsByOID(oid);
		     Gson gson  = new Gson();
		     String jsonData = gson.toJson(appointmentInfos);
		     
		     response.setCharacterEncoding("UTF-8");
		     response.setContentType("application/json");
		     response.getWriter().write(jsonData);
			
			
		}else if("myAppointment".equals(requestType)) {
			
			 int oid = Integer.parseInt(request.getParameter("oid"));
				
				List<AppointmentInfo> appointmentInfos = Dao.getAllAppointmentDetailsByOID(oid);
			     Gson gson  = new Gson();
			     String jsonData = gson.toJson(appointmentInfos);
			     
			     response.setCharacterEncoding("UTF-8");
			     response.setContentType("application/json");
			     response.getWriter().write(jsonData);
				
			
		}
		else {
			response.getWriter().print("Invalid Request Type");
		}
				
		
		
	}

	
	

}
