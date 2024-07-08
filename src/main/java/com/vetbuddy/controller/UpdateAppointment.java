package com.vetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.util.CMS;
import com.vetbuddy.util.EmailSender;

@WebServlet("/updateAppointment")
public class UpdateAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
         String requestType =  request.getParameter("type");
		 Integer oid = Integer.parseInt(request.getParameter("oid"));
		 String email = request.getParameter("email");
		 Integer aid = Integer.parseInt(request.getParameter("aid"));
		 String OwnerName = request.getParameter("ownerName");
		 String appointmentDate = request.getParameter("appointmentDate");
		 String petSpecies = request.getParameter("petSpecies");
		 String dname = request.getParameter("dname");
		 
		 PrintWriter out = response.getWriter();
		 
		 if("Confirm".equals(requestType))
			 { 
				Boolean status =Dao.updateAppointmentStatus(aid,"Confirm");
				if(status)
				{
					 
					
		        	 String subject = "Appointment Confirmation";
		        	 String to = email;
		        	 String from = "vetbuddyinfo@gmail.com";
		        	
		        	 String emailContent = CMS.getAppointmentConfirmCMS(dname,OwnerName,appointmentDate);
		        	 
		        	  status =  EmailSender.sendEmails(to,from,subject, emailContent);
		        	  
		        	  if(status) {
		        		  out.print("confirm");
		        	  }
		        	  else {
		        		  out.print("Fail to Send Email");
		        	  }
					
					
				}
				else {
					out.print("Fail to Confirm the Appointment");
				}
			 
		 }
		 else if("Cancel".equals(requestType)){

				Boolean status =Dao.updateAppointmentStatus(aid,"Cancel");
				if(status)
				{
					 
					
		        	 String subject = "Appointment Cancellation Notification";
		        	 String to = email;
		        	 String from = "vetbuddyinfo@gmail.com";
		        	
		        	 //Get the Cancel CMS template
		        	 String emailContent = CMS.getCancelAppointmentCms(dname,OwnerName);
		        	 
		        	  // Sending the cancel email to the petOwner
		        	  status =  EmailSender.sendEmails(to,from,subject, emailContent);
		        	  
		        	  // If the Email is send successfully set the response as cancel
		        	  if(status) {
		        		  out.print("cancel");
		        	  }
		        	  else {
		        		// If the Email is not send then set the response as cancel
		        		  out.print("Fail to Send Email");
		        	  }
					
					
				}
				else {
					out.print("Fail to Confirm the Appointment");
				}
			 
			 
			 
			 
			
			 
			 
		 }
		 else  {
			 out.print("Somting went wrong");
		 }
		 
	}

}
