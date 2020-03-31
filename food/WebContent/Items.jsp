<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.lang.*" %>
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

<meta charset="UTF-8">
<title>Restaurant Name</title>
</head>
<body>
	<h1>Restaurant Name</h1>
	<%-- fetch and print restaurant details ,equate id = restaurant's id--%>
	<%
	String id = request.getParameter("id");
	String userid = request.getParameter("username");
	String cartid = "";
	String itemid,item_price;
	
	// reading db config  
    FileInputStream fis=new FileInputStream("DBConfig.txt");       
    Scanner sc=new Scanner(fis);   
	String urlString = sc.nextLine();
	String usernameString = sc.nextLine();
	String passwordString = sc.nextLine();
    sc.close();     //closes the scanner   
	
	/*String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";*/
	String sqlpString = "select * from cart where username = '"+userid+"'";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn_e = DriverManager.getConnection(urlString, usernameString, passwordString);
	PreparedStatement state = conn_e.prepareStatement(sqlpString);
	ResultSet ns = state.executeQuery();
	while(ns.next()) {
		cartid = ns.getString(1);
	}
	state.close();
	String sqlString = "select * from item where restaurant_id = '"+id+"'";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString, usernameString, passwordString);
	PreparedStatement statement = conn.prepareStatement(sqlString);
	ResultSet rs = statement.executeQuery();
	while (rs.next()) {
		itemid = rs.getString("item_id");
		item_price = rs.getString("price");
	%>
	<%=rs.getString("item_name")%>
	<br />
	<%=rs.getInt("price")%>
	<br />
	<%=rs.getInt("rating")%>
	<br />
	<%
	if (!rs.getBoolean("availability")) {%>
		<%= "Not Available" %>
	<%}
	else { %>
		<%= "Available"%>
	<% }
	%>
	<br />
	<form action="Add" method="post">
		<input type="hidden" name = "cart_id" value =<%=cartid %>>
		<input type="hidden" name = "price" value = <%=item_price %>>
		<input type="hidden" name = "item_id" value = <%=itemid%>>
		<input type="hidden" name = "restaurant_id" value = <%=id%>>
		<input type="hidden" name = "username" value = <%=userid%>>
		<button type = "submit">Add</button>
	</form>
	<hr>
	<%
		}
	%>
</body>
</html>