<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<title> Home </title>
<button onclick="location.href='Address.jsp'" type = "submit">Location</button>
<br/>
<br/>
<% 
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";
	String sqlString = "select * from restaurant";
	String restaurant_name;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
	PreparedStatement statement  = conn.prepareStatement(sqlString);
	ResultSet rs = statement.executeQuery();
	
	while(rs.next()) {
		restaurant_name = rs.getString(2);%>
		<a href = "url"><%= restaurant_name %></a>
		<br/>
	<% }%>

<br/>
<br/>
<br/>

<button onclick="location.href='Search.jsp'" type = "submit">Search</button>

<button onclick="location.href='Account.jsp'" type = "submit">Account</button>

<button onclick="location.href='Home.jsp'" type = "submit">Swiggy</button>


</html>