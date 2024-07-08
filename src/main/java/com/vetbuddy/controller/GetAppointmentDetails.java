package com.vetbuddy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vetbuddy.dao.Dao;
import com.vetbuddy.dto.AppointmentInfo;

@WebServlet("/getAppointmentDetails")
public class GetAppointmentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GetAppointmentDetails() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer did = Integer.parseInt(request.getParameter("did"));
		List<AppointmentInfo>appointmentInfos = Dao.getAppointmentDetails(did);
		
	
		
		if(appointmentInfos!=null) {
		Gson gson = new Gson();
	    String jsonData = gson.toJson(appointmentInfos);
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json");
	    response.getWriter().write(jsonData);
		}
		else {
			response.getWriter().print("Somting Went Wrong");
		}
		
		
	}

}
