package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.User_location;

public class User_locationDao {
	String insertString = "insert into user_loc(username,location_id) values(?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	
	public void addEntry(User_location stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getUsername());
		statement.setString(2, stu.getLocation_id());
		System.out.println(stu.getUsername());
		statement.executeUpdate();
		
		
	}
	

}
