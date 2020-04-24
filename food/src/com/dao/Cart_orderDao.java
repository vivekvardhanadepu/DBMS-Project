package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.Cart_order;


public class Cart_orderDao {
	
	String insertString = "insert into cart_order(order_id,item_id,restaurant_id,quantity,half_or_full) values(?,?,?,?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	
	public void addEntry(Cart_order stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getOrder_id());
		statement.setString(2, stu.getItem_id());
		statement.setString(3, stu.getRestaurant_id());
		statement.setInt(4, stu.getQuantity());
		statement.setBoolean(5, stu.getHalf_or_full());
		//System.out.println(stu.getRestaurant_id());
		statement.executeUpdate();
		
	}
	
	
}
