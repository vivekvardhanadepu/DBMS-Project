<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>	
<a href = "delivery.jsp"> SET DELIVERY LOCATION </a>

<h5> SAVED ADDRESSES</h5>
<% 
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	String sqlString = "select * from location";
	String restaurant_name;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
	PreparedStatement statement  = conn.prepareStatement(sqlString);
	ResultSet rs = statement.executeQuery();
	int i = 1;
	
	while(rs.next()) {
		%>
		<%= "ADDRESS" + i %>
		<br/>
		<%= rs.getString(2)%>
		<%= "," %>
		<%= rs.getString(3)%>
		<%= "," %>
		<%= rs.getString(4)%>
		<%= "," %>
		<%= rs.getString(5)%>
		<%= "," %>
		<%= rs.getInt(6) %>
		<br/>
		<br/>
		<hr>
		<%i++; %>
	<% }%>

<br/>
<br/>
<br/>