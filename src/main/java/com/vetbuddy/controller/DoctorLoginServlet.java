package com.vetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Doctor;

@WebServlet("/doctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DoctorLoginServlet() {
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  PrintWriter out = response.getWriter();
		  

		  String email = request.getParameter("email");
		  String password = request.getParameter("password");
		  Doctor doctor =  Dao.getDoctorByEmailPassword(email, password);
		  HttpSession session = request.getSession();
		  
		  if (doctor!=null) {
			 session.setAttribute("currentDoctor",doctor);
			 response.sendRedirect("doctor_home.jsp");
		  }
		  else {
			   session.setAttribute("loginStatus","Invalid");
			   response.sendRedirect("doctor_login.jsp");
		   }
		  
		
		
	}

}
