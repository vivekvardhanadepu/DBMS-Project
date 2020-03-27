<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<body>
	<h1>Delivery Location</h1>
	<form action = "Delivery" method = "post">
		<br> <input type = "text" name = "f_no" placeholder="flat_no" required><br>
		<br> <input type = "text" name = "street" placeholder= "street" required><br>
		<br> <input type = "text" name = "city" placeholder= "city" required><br>
		<br> <input type = "text" name = "state" placeholder = "state" required><br>
		<br> <input type = "text" name = "pincode" placeholder= "pincode" required><br>
		<button type = "submit">Confirm Location</button>
	</form>
</body>
</html>