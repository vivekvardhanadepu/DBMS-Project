<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body {
	height: 100%;
    background: url(food-on-table-326278.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  min-height: 100px
  margin: 0;

}

h1,p{
  padding: 20px;

  
  font-family: "Comic Sans MS", cursive, sans-serif;
  color:white;
  text-shadow: 3px 2px black;
  font-weight: bold;

}
form{

	position: left;
  margin: 30px;
  max-width: 500px;
  padding-top: 20px;
  padding-right: 20px;
  padding-left: 20px;
  padding-bottom: 20px;
  border-radius: 25px;
   box-shadow: 0 12px 16px 0 black, 0 17px 50px 0 white;
  
  opacity: 1;

}
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

.info {background-color: #2196F3;} /* Blue */
.info:hover {background: #0b7dda;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);}

.warning {background-color: #ff9800;} /* Orange */
.warning:hover {background: #e68a00;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);}

.danger {background-color: #f44336;} /* Red */
.danger:hover {background: #da190b;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);}

.default {background-color: #e7e7e7; color: black;} /* Gray */
.default:hover {background: #ddd;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);}

input{
	width: 80%;
  padding: 15px;

  margin: 25px 25px 25px 25px;
  border: none;
  background: #f1f1f1;
  border-radius: 25px;
  border: 2px solid #4CAF50;
  font-family: "Comic Sans MS", cursive, sans-serif;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
input:focus{
  background-color: #ddd;
  outline: none;
  border-radius: 25px;
  border: 2px solid #4CAF50;
}

</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3> Restaurant </h3>
<%  

	String search = request.getParameter("srch");
	//System.out.println(search);
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	String sqlString = "select * from restaurant where restaurant_name REGEXP '"+search+"'";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
	PreparedStatement statement  = conn.prepareStatement(sqlString);
	ResultSet rs = statement.executeQuery();
	int i = 1;
	
	while(rs.next()) {
		String id = rs.getString(1);
		String restaurant_n = rs.getString(2);
		String cuisine = rs.getString(5);
		%>
		<%= i+")" %>
		<form action ="Items.jsp" method = "post">
			<input type = "hidden" name="id" value=<%= id %>>
			<button type = "submit"><%= restaurant_n %></button>
		</form>
		<%= cuisine%>
		<br/>
		<hr>
		<%i++; %>
	<% }%>

</body>
</html>