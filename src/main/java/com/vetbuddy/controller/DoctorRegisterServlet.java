package com.vetbuddy.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.Doctor;
import com.vetbuddy.util.Password;

@MultipartConfig
@WebServlet("/doctorRegisterServlet")
public class DoctorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DoctorRegisterServlet() {
    
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String postalcode = request.getParameter("postalcode");
		String village = request.getParameter("village");
		String district = request.getParameter("district");
		String specialization = request.getParameter("specialization");
		
		Part certificate = request.getPart("certificate");
		try(InputStream file  = certificate.getInputStream()){
			
			String password = Password.generatePassword(8);
			
			Doctor doctor = new Doctor(name,email,address,Integer.parseInt(postalcode),village,district,file,Long.parseLong(mobile),password,specialization);
			String status =Dao.saveDoctor(doctor);

			PrintWriter out = response.getWriter();
			out.println(status);
			
           //Close the resources		  
			file.close();
			   
		  // delete the temporary file
			certificate.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	   
		
		
	}

}
