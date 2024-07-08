package com.petbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Farmer;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public LoginServlet() {
        super();

    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		Farmer farmer = Dao.getFarmerByEmailPassword(email, password);

		if (farmer!=null) {
		   HttpSession session = request.getSession();
		   
		   session.setAttribute("currentUser",farmer);
		   response.sendRedirect("home.jsp");

		}
		else {

			HttpSession session = request.getSession();
			session.setAttribute("loginStatus","Invalid");
			response.sendRedirect("farmer_login.jsp");

	}


	}
	}
