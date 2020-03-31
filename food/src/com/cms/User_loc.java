package com.cms;



	import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CartDao;
import com.dao.User_locationDao;

	/**
	 * Servlet implementation class StudentSignup
	 */
	@WebServlet("/User_loc")
	public class User_loc extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.sendRedirect("delivery.jsp");
		}
		
		protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			    User_location newLocation = new User_location();
			    newLocation.setLocation_id(request.getParameter("loc_id"));
			    newLocation.setUsername(request.getParameter("user_id"));
				//System.out.println(request.getParameter("loc_id"));
				//System.out.println(request.getParameter("user_id"));
			    Cart newCart = new Cart();
			    newCart.setCart_id();
			    newCart.setUsername(request.getParameter("user_id"));
			    newCart.setLocation_id(request.getParameter("loc_id"));
				
				try
				{		
					CartDao entryDao = new CartDao();
					entryDao.addEntry(newCart);
					//response.sendRedirect("Cart.jsp");
					//System.out.println("hi");
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				try
				{			
					User_locationDao entryDao = new User_locationDao();
					entryDao.addEntry(newLocation);
					response.sendRedirect("Home.jsp");
					//System.out.println("hi");
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
		}

	}


