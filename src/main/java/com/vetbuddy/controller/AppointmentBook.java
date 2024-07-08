package com.vetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Appointment;
import com.vetbuddy.dto.Pet;

@MultipartConfig
@WebServlet("/appointmentBook")
public class AppointmentBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AppointmentBook(){
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String did=request.getParameter("did");
        String ownerName=request.getParameter("name");
        String mobile=request.getParameter("mobile");
        String email=request.getParameter("email");
        String petname=request.getParameter("petname");
        String breed=request.getParameter("breed");
        String species=request.getParameter("species");
        String age=request.getParameter("age");
        String date=request.getParameter("date");
        String oid=request.getParameter("ownerid");
        

//	    update the petOwner details
        Boolean update =  Dao.updatePetOwner(ownerName, email,Long.parseLong(mobile),Integer.parseInt(oid));
	    
        if (!update) {
			out.print("Somthing went wrong");
		}
	    
    
	    Pet pet = new Pet();
	 
	    pet.setPetName(petname);
	    pet.setAge(Integer.parseInt(age));
	    pet.setBreed(breed);
	    pet.setSpecies(species);
	    pet.setOwnerId(Integer.parseInt(oid));
	    
//	    save the pet details
	    Integer pid = Dao.savePet(pet);
	    {
	    	if(pid<0)
	    	{
	    		out.print("Somehting went Wrong");
	    	}
	    }
	   
	    Appointment appointment = new Appointment();
	    
	    appointment.setOid(Integer.parseInt(oid));
	    appointment.setDid(Integer.parseInt(did));
	    appointment.setPid(pid);
	    appointment.setAppointmentDate(LocalDate.parse(date));
	    appointment.setBookingDate(LocalDate.now());
	    
	   Boolean booking =  Dao.bookAppointment(appointment);
	   
	   if(booking)
	   {
		   out.print("done");
		   
		   
	   }
	   else {
		   out.print("Somehting went Wrong");
	   }
	    
	   
		
	}

}
