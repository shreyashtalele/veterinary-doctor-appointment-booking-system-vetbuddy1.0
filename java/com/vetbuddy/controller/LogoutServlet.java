package com.petbuddy.controller;

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
		HttpSession session = request.getSession();
        String  type = request.getParameter("type");
        session.removeAttribute("currentUser");
    	session.setAttribute("logout_msg","done");
       	response.sendRedirect("farmer_login.jsp");
      
//        if(type.equals("farmer"))
//        {
//        	System.out.println(type);
//        	session.removeAttribute("currentUser");
//        	session.setAttribute("logout_msg","done");
//        	response.sendRedirect("farmer_login.jsp");
//        	
//        }
//        else if(type.equals("doctor"))
//        {
//        	System.out.println(type);
//        	session.removeAttribute("currentUser");
//        	session.setAttribute("logout_msg","done");
//        	response.sendRedirect("farmer_login.jsp");
//        }
//        else if(type.equals("admin")){
//        	System.out.println(type);
//        	session.removeAttribute("currentAdmin");
//        	session.setAttribute("logout_msg","done");
//        	response.sendRedirect("Admin.jsp");
//        }
//        else {
//        	
//        	response.sendRedirect("error.jsp");
//		}


	}

}
