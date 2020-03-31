package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.Cart_has;

public class Cart_hasDao {
	String insertString = "insert into cart_has(cart_id,order_id) values(?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	
	public void addEntry(Cart_has stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getCart_id());
		statement.setString(2, stu.getOrder_id());
		System.out.println(stu.getCart_id());
		statement.executeUpdate();
		
	}
	

}
