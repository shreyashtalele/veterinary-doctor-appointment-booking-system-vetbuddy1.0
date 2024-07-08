package com.vetbuddy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public LogoutServlet() {
        super();

    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

        String  type = request.getParameter("type");
        
        if(session!=null) {
        
      
        if(type.equals("petOwner"))
        {
        	session.removeAttribute("currentUser");
        	session.setAttribute("logout_msg","done");
        	response.sendRedirect("petOwner_login.jsp");
        	
        }
        else if(type.equals("doctor"))
        {
        	
        	session.removeAttribute("currentUser");
        	session.setAttribute("logout_msg","done");
        	session.invalidate();
        	
        	// Set cache control headers to prevent caching of sensitive pages
        	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        	response.setHeader("Expires", "0"); // Proxies 
        	
        	response.sendRedirect("doctor_login.jsp");
        }
        else if(type.equals("admin")){
        	session.removeAttribute("currentAdmin");
        	session.setAttribute("logout_msg","done");
        	response.sendRedirect("Admin.jsp");
        }
        else {
        	
        	response.sendRedirect("error.jsp");
		}


	}

}
}
