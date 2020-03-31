package com.cms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LoginDao;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {

	/**
	 * 
	 */
	String str;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("signin.jsp");
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		User newUser = new User();
		newUser.setUsername(request.getParameter("uname"));
		newUser.setPassword(request.getParameter("pass"));
		
		
		
		LoginDao loginDao = new LoginDao();
		try {
			newUser = loginDao.check(newUser);
			if(newUser.isValid()) {
				str =  newUser.getUsername();
				request.setAttribute("user", newUser.getUsername());
				HttpSession session = request.getSession();
				session.setAttribute("user", newUser);
				Cookie uid_cookie = new Cookie("uid",newUser.getUsername());
				//System.out.println(uid_cookie.getValue());
				response.addCookie(uid_cookie);
				//RequestDispatcher reDispatcher = request.getRequestDispatcher("Home.jsp");
				//reDispatcher.forward(request, response);
				response.sendRedirect("Home.jsp");
				
			}
			else {
				response.sendRedirect("sigin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
