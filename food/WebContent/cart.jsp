<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
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
<title>Cart</title>
</head>
<body>
	<h1>Restaurant Name</h1>

	<%
    
	String urlString = "jdbc:mysql://localhost:3306/swiggy";
	String usernameString = "root";
	String passwordString = "qwert1";
	
	String user_id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(urlString, usernameString, passwordString);
	String sqlString1 = "select * from cart where username like " + user_id + ";";
	PreparedStatement statement1 = conn.prepareStatement(sqlString1);
	ResultSet rs1 = statement1.executeQuery();
	rs1.next();
	String cart_id = rs1.getString("cart_id");
	String disabled = "disabled";
	int delivery_status = rs1.getInt("delivery_status");
	int delivery_time = rs1.getInt("delivery_time");
	String sqlString2 = "select price, item_name, quantity, half_or_full "+
							"from item, cart_order "+
							"where cart_order.restaurant_id = item.restaurant_id and "+
								  "cart_order.item_id = item.item_id and (order_id in (select order_id "+
										  												"from cart_has "+
										  												"where cart_has.cart_id = " + cart_id +"));";
	PreparedStatement statement2 = conn.prepareStatement(sqlString2);
	ResultSet rs2 = statement2.executeQuery();
	if(rs2.next()){
		rs2.beforeFirst();
	disabled = " ";
	while (rs2.next()) {%>
	<%=rs2.getString("item_name")%>
	<br />
	<%=rs2.getInt("price")%>
	<br />
	<%=rs2.getInt("quantity")%>
	<%-- add an add button if needed --%>
	<br />
	<%if(rs2.getBoolean("half_or_full")){%>
	<br />
	<%="full"%>
	<br />
	<% }
	  else %>
	<br />
	<%= "half" %>
	<%	String sqlString3 = "select * from total_price where total_price.cart_id = " + cart_id;
		PreparedStatement statement3 = conn.prepareStatement(sqlString3);
		ResultSet rs3 = statement3.executeQuery(); 
		rs3.next();
		int price = rs3.getInt("price");
		int delivery_charge = rs3.getInt("delivery_charge");
		double gst = rs3.getDouble("gst");
		double total = gst + delivery_charge + price;
		%>
	<%= "Order Total :		" + price %>
	<br />
	<%= "Delivery Charge :	" + delivery_charge %>
	<br />
	<%= "GST :			  	" + gst %>
	<br />
	<%=	"Total :			" + total %>
	<br />
	<br />
	<%}
	}
	else
	%>
	<%= "Cart Empty" %>
	<form method="get" action="Delivery_Status.jsp">
		<input type="hidden" value=<%=user_id%> name="user_id"> 
		<input type="hidden" value=<%=cart_id%> name="cart_id">
		<input type="hidden" value=<%=delivery_time%> name="delivery_time">
		<button type="submit" <%=disabled%> >Place Order</button> 
	</form>
</body>
</html>