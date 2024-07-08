package com.vetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Doctor;
import com.vetbuddy.util.CMS;
import com.vetbuddy.util.EmailSender;

@WebServlet("/verfiyServlet")
public class VerfiyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public VerfiyServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    Integer did = Integer.parseInt(request.getParameter("did"));
	    
		PrintWriter out = response.getWriter();
	    Boolean verifyStatus =  Dao.verifyDoctorByID(did);
	    
	    if (verifyStatus) {
	    	
         Doctor doctor =Dao.getDoctorCredential(did);
         if (doctor!=null) {
			
        	 // Send the credentials
        	 String password= doctor.getPassword();
        	 String subject = "Account Verification Completed - Your VetBuddy Login";
        	 String to = doctor.getEmail();
        	 String from = "vetbuddyinfo@gmail.com";
        	
        	 String emailContent = CMS.getTemplateFromCMS(doctor.getName(),to,password);
        	 
        	 Boolean status =  EmailSender.sendEmails(to,from,subject, emailContent);
     
        	 if(status)
        	 {
        		 out.print("Email is send ");
        	 }
        	 else {
				out.print("someting went wrong ");
			}
        	 
		  }
	         	
		}
	    else {
		    out.println("Unable to verify doctor!");
		}
	}

	
	

}
