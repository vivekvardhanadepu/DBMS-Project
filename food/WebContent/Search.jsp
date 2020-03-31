<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

form{
  position: left;
  margin: 60px;
  max-width: 600px;
  padding-top: 20px;
  padding-right: 20px;
  padding-left: 20px;
  padding-bottom: 20px;
  border-radius: 25px;
  box-shadow: 0 12px 16px 0 black, 0 17px 50px 0 white;
  opacity: 1;

}
input{
  width: 80%;
  padding: 15px;
  margin: 25px 25px 25px 40px;
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
<form action ="restaurant_search.jsp" autocomplete = "off"  method = "post">
	<input type = "text" name = "srch" placeholder ="Search ">
</form>
</body>
</html>