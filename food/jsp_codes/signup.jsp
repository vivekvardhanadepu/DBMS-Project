<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.hed{
	width:700px;
	height:600px;
	position:absolute;
	left:50%;
	top:50%;
	margin-right:-50%;
	transform: translate(-50%,-50%);
	padding-left:80px;
	padding-top:30px;
	box-sizing:border-box;
}
</style>
<meta charset="ISO-8859-1">
<title>Student Sign Up</title>
</head>
<body>
	<h1>Sign Up</h1>
	<div class="hed">
	<form action = "Signup" method = "post">
		<br> <input type = "text" name = "uname" placeholder="Username" required><br>
		<br> <input type = "password" name = "pass1" placeholder= "Password" required><br>
		<br> <input type = "password" name = "pass2" placeholder= "Re-enter password" required><br>
		<br> <input type = "text" name = "num" placeholder = "Phone number" required><br>
		<br> <input type = "text" name = "fname" placeholder= "Firstname" required><br>
		<br> <input type = "text" name = "lname" placeholder= "Lastname" required><br>
		<br> <input type = "email" name = "emailid" placeholder= "EmailId" required><br>
		<button type = "submit">Create account</button>
	</form></div>
</body>
</html>