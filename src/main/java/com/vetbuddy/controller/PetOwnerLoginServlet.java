package com.vetbuddy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.PetOwner;


@WebServlet("/petOwnerLoginServlet")
public class PetOwnerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public PetOwnerLoginServlet() {
        super();

    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PetOwner petOwner = Dao.getPetOwnerByEmailPassword(email, password);


		if (petOwner!=null) {
		   HttpSession session = request.getSession();
		   
		   session.setAttribute("currentUser",petOwner);
		   response.sendRedirect("home.jsp");

		}
		else {

			HttpSession session = request.getSession();
			session.setAttribute("loginStatus","Invalid");
			response.sendRedirect("petOwner_login.jsp");

	}


	}
	}
