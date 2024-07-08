package com.petbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Farmer;



@MultipartConfig
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public RegisterServlet() {
        super();

    }


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//	fetch the data from request object
		PrintWriter out =  response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mob= request.getParameter("mobile");
		String address = request.getParameter("address");
		String postal_code = request.getParameter("postalcode");
		String district = request.getParameter("district");
		String village = request.getParameter("village");



        Farmer farmer = new Farmer(name,email,password,address,Integer.parseInt(postal_code),village,district,Long.parseLong(mob));
	    String  status = Dao.saveFarmer(farmer);
	    out.println(status);





	   }

}
