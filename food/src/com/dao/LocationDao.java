package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.Location;


public class LocationDao {
	
	String insertString = "insert into location(location_id,flat_no,street,city,state,pincode) values(?,?,?,?,?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	
	public void addEntry(Location stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getLocation_id());
		statement.setString(2, stu.getFlat_no());
		statement.setString(3, stu.getStreet());
		statement.setString(4, stu.getCity());
		statement.setString(5, stu.getState());
		statement.setString(6, stu.getPincode());
		//System.out.println(stu.getStreet());
		statement.executeUpdate();
		
	}
	
	
}
