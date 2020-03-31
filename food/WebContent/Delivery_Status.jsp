<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
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
<title>Delivery Status</title>
</head>
<body>
<% 
//reading db config  
FileInputStream fis=new FileInputStream("DBConfig.txt");       
Scanner sc=new Scanner(fis);   
String urlString = sc.nextLine();
String usernameString = sc.nextLine();
String passwordString = sc.nextLine();
sc.close();     //closes the scanner

	String user_id = request.getParameter("user_id");
	String cart_id = request.getParameter("cart_id");
	String delivery_time = request.getParameter("delivery_time");
	/*String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "Sindhu3001";*/
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString, usernameString, passwordString);
	// changing status of all orders to delivering
	String sqlString0 = "update cart_order set delivery status = -1 where order_id in" + 
						" select order_id from cart_has where cart_id = " + cart_id + ";";
	// inserting orders to past_orders
	String sqlString1 = "insert into past_orders(" + user_id + ",order_id)"+
						"select order_id from cart_has where cart_id = " + cart_id + ";";
	// deleting orders from cart
	String sqlString2 = "delete from cart_has where cart_id = " + cart_id + ";";
	// deleting total price
	String sqlString3 = "delete from total_price where cart_id = " + cart_id + ";";
	PreparedStatement statement0 = conn.prepareStatement(sqlString0);
	PreparedStatement statement1 = conn.prepareStatement(sqlString1);
	PreparedStatement statement2 = conn.prepareStatement(sqlString2);
	PreparedStatement statement3 = conn.prepareStatement(sqlString3);
	statement0.executeUpdate();
	statement1.executeUpdate();
	statement2.executeUpdate();
	statement3.executeUpdate();
%>
<br />
<br />
<%= "Order will be delivered in  "  + delivery_time + " minutes"%>
<%-- need to make a timer which counts for delivery_time and changes the orders' statuses to delivered i.e delivery_status = 1 
		also add home,cart,account etc buttons if needed--%>
<br />
<br />
</body>
</html>