package com.vetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Admin;


@MultipartConfig
@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AdminLoginServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
		  PrintWriter out = response.getWriter();
		  

		  String email = request.getParameter("email");
		  String password = request.getParameter("password");
		  
		  Admin admin =  Dao.getAdmin(email, password);
		  HttpSession session = request.getSession();
		  
		  if (admin!=null) {
			 session.setAttribute("currentAdmin",admin);
			 response.sendRedirect("admin_home.jsp");
		  }
		  else {
			   session.setAttribute("loginStatus","Invalid");
			   response.sendRedirect("Admin.jsp");
		   }
		  
		 
		 
		 
		 
		 
		
	}

}
