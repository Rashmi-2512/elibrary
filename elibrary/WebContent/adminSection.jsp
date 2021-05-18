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
}
.container
{
	background-image:url("./images/r.jpg");
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
<body text="white">
<div class="topnav">
  <a  class="active" href="index.jsp" style="margin-left:50px">Home</a>
   <a href="AddLibrarian.jsp">Add librarian</a>
  <a href="ViewLibrarian.jsp">View Librarian</a>
  <a href="ChangePassword.jsp">Change Password</a>
  <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<div id="div_admin" style="position:absolute;left:900px;top:115px">
<h1>Admin Section</h1>
<ul>
<li>Add Librarian</li>
<li>View Librarian</li>
<li>Edit Librarian</li>
<li>Delete Librarian</li>
<li>Change Password</li>
<li>Logout</li>
</ul>
</div>
</div>
</body>
</html>