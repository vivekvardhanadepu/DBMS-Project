package com.cms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LocationDao;

/**
 * Servlet implementation class StudentSignup
 */
@WebServlet("/Delivery")
public class Delivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("delivery.jsp");
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		    Location newLocation = new Location();
		
			newLocation.setLocation_id();
			newLocation.setFlat_no(request.getParameter("f_no"));
			newLocation.setStreet(request.getParameter("street"));
			newLocation.setCity(request.getParameter("city"));
			newLocation.setState(request.getParameter("state"));
			newLocation.setPincode(request.getParameter("pincode"));
			
			
			try
			{			
				LocationDao entryDao = new LocationDao();
				entryDao.addEntry(newLocation);
				response.sendRedirect("Home.jsp");
				//System.out.println("hi");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
	}

}