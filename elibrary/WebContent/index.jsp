<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1">
<style>
body,html{
	margin: 0;
  font-family: Arial, Helvetica, sans-serif;
   height:100%;
	background-image:url("./images/b44.jpg");
	height:100%;
  	background-position:ceneter center;
  	background-repeat:no-repeat;
  	background-size: cover;
}


.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div class="topnav">
  <a  class="active" href="index.jsp" style="margin-left:50px">Home</a>
   <a href="AdminLogin.jsp">Admin Section</a>
  <a href="LibrarianLogin.jsp">Librarian Section</a>
  <a href="StudentSection.jsp">Student Section</a>
</div>
<div class="container" style="color:white;">
<h1><p>
Hey this is an online portal for all the book lovers.
<br>
Here you can make your own account an enjoy all the benifits online.
</p></h1>
</div>
</body>
</html>