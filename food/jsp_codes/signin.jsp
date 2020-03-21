<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.hed{
	width:400px;
	background-color:black;
	height:400px;
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
<title>Signin</title>
</head>
<body>
	<div class="hed">
	<h1 class="tex">SIGNIN</h1>
	<form action = "Signin" method = "post">
		<input type = "text" name = "uname" placeholder="Username" required><br>
		<input type = "password" name = "pass" Placeholder="Password" required><br>
		<button type = "submit">Signin</button>
		
	</form>
	<pre>or</pre>
	<form action = "Signup">
		<button type = "submit">Signup</button>
	</form></div>
</body>
</html>