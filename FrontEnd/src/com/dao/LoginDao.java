package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cms.User;


public class LoginDao {
	String sqlString = "select * from user where username = ? and passwd = ?";
	String unameString = "select * from user where username = ?";
	String insertString = "insert into user(username,passwd,phone_no,firstname,lastname,emailid) values(?,?,?,?,?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	
	public User check(User stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement  = conn.prepareStatement(sqlString);
		statement.setString(1, stu.getUsername());
		statement.setString(2, stu.getPassword());
		ResultSet rs = statement.executeQuery();
		if(rs.next()) { 
			stu.setPhone_no(rs.getString("phone_no"));
			stu.setFirstName(rs.getString("firstname"));
			stu.setLastName(rs.getString("lastname"));
			stu.setEmailId(rs.getString("emailid"));
			stu.setValid(true);
			return stu;
		}
		
		return stu;
		
	}
	
	public boolean checkUsername(String uname) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement  = conn.prepareStatement(unameString);
		statement.setString(1, uname);
		ResultSet rs = statement.executeQuery();
		if(!rs.next()) {
			return true;
		}
		return false;
	}
	
	public void addEntry(User stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getUsername());
		statement.setString(2, stu.getPassword());
		statement.setString(3, stu.getPhone_no());
		statement.setString(4, stu.getFirstName());
		statement.setString(5, stu.getLastName());
		statement.setString(6, stu.getEmailId());
		
		statement.executeUpdate();
		
		
	}
	
	
}
