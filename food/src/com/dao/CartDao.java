package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.Cart;


public class CartDao {
	String insertString = "insert into cart(cart_id,location_id,username,delivery_time) values(?,?,?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	
	public void addEntry(Cart stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getCart_id());
		statement.setString(2,stu.getLocation_id());
		statement.setString(3, stu.getUsername());
		statement.setInt(4,0);

		//System.out.println(stu.getStreet());
		statement.executeUpdate();
		statement.close();
		
	}
	
	
	
}
