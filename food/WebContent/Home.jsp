<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "com.cms.Signin"%>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<style type = "text/css">

.btn {
  border: none; /* Remove borders */
  color: white; /* Add a text color */
  padding: 14px 28px; /* Add some padding */
  cursor: pointer;
  width:50%;
  margin: 20px;
  border-radius: 25px;
  font-family: "Comic Sans MS", cursive, sans-serif;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19); /* Add a pointer cursor on mouse-over */
}

.success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);}
</style>
<title> Home </title>

<br/>
<br/>


<%   

	Cookie[] cookies = request.getCookies();
	String idea = cookies[1].getValue();
	String stree;
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	String sqlString = "select * from restaurant";
	String restaurant_name;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
	PreparedStatement statement  = conn.prepareStatement(sqlString);
	ResultSet rs = statement.executeQuery();
	
	while(rs.next()) {
		restaurant_name = rs.getString(2);
		String id = rs.getString(1);%>
		<form action ="Items.jsp" method = "post">
			<input type = "hidden" name="id" value=<%= id %>>
			<input type = "hidden" name="username" value=<%= idea%>>
			<button type = "submit"><%= restaurant_name %></button>
		</form>
		<br/>
	<% }
		statement.close();
	%>
<% 
String sqlpString = "select * from user_loc where username = '"+idea+"'";
Class.forName("com.mysql.jdbc.Driver");
PreparedStatement state  = conn.prepareStatement(sqlpString);
ResultSet ns = state.executeQuery();
while(ns.next()) {
	 stree = ns.getString(2);
}
%>
<br/>
<br/>
<br/>
<form method = "get" action = "cart.jsp">
<input type = "hidden" name = "id" value = <%= cookies[1].getValue() %>>
<button type = "submit">Cart</button>
</form>

<button class = "btn success" onclick="location.href='Search.jsp'" type = "submit">Search</button>

<form method = "get" action = "Account.jsp">
<input type = "hidden" name = "id" value = <%= cookies[1].getValue() %>>
<button class = "btn success" onclick="location.href='Account.jsp'" type = "submit">Account</button>
</form>

<form method = "get" action = "Address.jsp">
<input type = "hidden" name = "id" value = <%= cookies[1].getValue() %>>
<button class = "btn success" onclick="location.href='Address.jsp'" type = "submit">Location</button>
</form>

<button class = "btn success" onclick="location.href='Home.jsp'" type = "submit">Swiggy</button>


</html>