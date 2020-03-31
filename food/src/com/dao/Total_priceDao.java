package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cms.Total_price;

public class Total_priceDao {
	String insertString = "insert into total_price(cart_id,price,gst,delivery_charge) values(?,?,?,?)";
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	
	public void addEntry(Total_price stu) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
		PreparedStatement statement = conn.prepareStatement(insertString);
		statement.setString(1, stu.getCart_id());
		statement.setInt(2,stu.getPrice());
		statement.setDouble(3, stu.getGst());
		statement.setInt(4,stu.getDelivery_charge());

		//System.out.println(stu.getStreet());
		statement.executeUpdate();
		statement.close();
		
	}

}
