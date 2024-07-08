package com.petbuddy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Farmer;

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


		HttpSession session  = request.getSession();

		Farmer farmer = (Farmer)session.getAttribute("currentUser");

		farmer.setEmail(email);
		farmer.setName(name);
		farmer.setPassword(password);
		farmer.setAddress(address);
		farmer.setVillage(village);
		farmer.setDistrict(district);
		farmer.setPostal_code(Integer.parseInt(postal_code));

		boolean updateStatus = Dao.updateFarmer(farmer);
		response.sendRedirect("home.jsp");

	}

}
