package com.vetbuddy.controller;

import java.io.IOException;
import com.vetbuddy.dto.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;

@WebServlet("/editServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public EditServlet() {
        super();
    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String village = request.getParameter("village");
		String district = request.getParameter("district");
		String postal_code = request.getParameter("postal_code");
        String requestType  = request.getParameter("type");
      
		HttpSession session  = request.getSession();
		
		
		
		if("petOwner".equals(requestType)) {

		PetOwner petOwner = (PetOwner)session.getAttribute("currentUser");

		petOwner.setEmail(email);
		petOwner.setName(name);
		petOwner.setPassword(password);
		petOwner.setAddress(address);
		petOwner.setVillage(village);
		petOwner.setDistrict(district);
		petOwner.setPostal_code(Integer.parseInt(postal_code));

		boolean updateStatus = Dao.updatePetOwner(petOwner);
		if(updateStatus)
		response.sendRedirect("home.jsp");
		else {
			response.getWriter().print("Someting Went wrong");
		   }

	   }
	  else if("doctor".equals(requestType)){
			
		Doctor doctor  = (Doctor)session.getAttribute("currentDoctor");
		
		doctor.setEmail(email);
		doctor.setName(name);
		doctor.setPassword(password);
		doctor.setAddress(address);
		doctor.setVillage(village);
		doctor.setDistrict(district);
		doctor.setPostal_code(Integer.parseInt(postal_code));
		
		boolean updateStatus = Dao.updateDoctor(doctor);
		
		if(updateStatus) {
			response.sendRedirect("doctor_home.jsp");
		}
	    else{
			response.getWriter().print("Someting Went wrong");
	    }
			
			
	    }
	}

}
