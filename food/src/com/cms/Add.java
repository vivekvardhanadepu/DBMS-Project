package com.cms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Cart_hasDao;
import com.dao.Cart_orderDao;
import com.dao.Total_priceDao;

/**
 * Servlet implementation class StudentSignup
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("signup.jsp");
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Total_price totalp = new Total_price();
		totalp.setPrice(Integer.valueOf(request.getParameter("price")));
		totalp.setGst();
		totalp.setDelivery_charge();
		totalp.setCart_id(request.getParameter("cart_id"));
		Cart_has newc = new Cart_has();	
		Cart_order newCart = new Cart_order();
		newCart.setOrder_id();
		newCart.setQuantity(10);
		newCart.setItem_id(request.getParameter("item_id"));
		newCart.setHalf_or_full();
		newCart.setRestaurant_id(request.getParameter("restaurant_id"));
		newc.setCart_id(request.getParameter("cart_id"));
		newc.setOrder_id(newCart.getOrder_id());
		
				
		try
		{	
			Total_priceDao enter = new Total_priceDao();
			enter.addEntry(totalp);
			Cart_hasDao entry = new Cart_hasDao();
			entry.addEntry(newc);
			Cart_orderDao entryDao = new Cart_orderDao();
			entryDao.addEntry(newCart);
			response.sendRedirect("Home.jsp");
			//System.out.println("hi");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}


}
