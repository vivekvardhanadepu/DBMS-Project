package com.cms;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;

/**
 * Servlet implementation class StudentSignup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("signup.jsp");
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		User newUser = new User();
		String pass = request.getParameter("pass1");
		if(pass.equals(request.getParameter("pass2"))){
			newUser.setUsername(request.getParameter("uname"));
			newUser.setPassword(request.getParameter("pass"));
			newUser.setPhone_no(request.getParameter("num"));
			newUser.setFirstName(request.getParameter("fname"));
			newUser.setLastName(request.getParameter("lname"));
			newUser.setEmailId(request.getParameter("emailid"));
			
			
			LoginDao signupDao = new LoginDao();
			try {
				boolean flag = signupDao.checkUsername(newUser.getUsername());
				if(flag) {
					signupDao.addEntry(newUser);
					response.sendRedirect("signin.jsp");
				}
				else {
					response.sendRedirect("signup.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else {
			response.sendRedirect("signup.jsp");
		}
	}


}
