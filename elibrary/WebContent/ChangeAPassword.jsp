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
   
	background-image:url("./images/b2.jpeg");
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
<script type="text/javascript">
	function validate_librarian()
	{
		var len=document.frm_librarian.tName.value.trim().length
		if(len==0)
		{
			alert("Name can't be left blank");
			document.frm_librarian.tName.value="";
			document.frm_librarian.tName.focus();
			return false;
		}
		len=document.frm_librarian.tEmail.value.trim().length
		if(len==0)
		{
			alert("Email can't be left blank");
			document.frm_librarian.tEmail.value="";
			document.frm_librarian.tEmail.focus();
			return false;
		}
		len=document.frm_librarian.tPass.value.length
		if(len==0)
		{
			alert("Password can't be left blank");
			document.frm_librarian.tPass.value="";
			document.frm_librarian.tPass.focus();
			return false;
		}
		var mobile=document.frm_librarian.tMobile.value
		var exp=/^\d{10}$/
		if(!exp.test(mobile))
		{
			alert("Invalid Mobile number");
			document.frm_librarian.tMobile.focus();
			return false;
		}
		return true
	}
	
</script>

<body>
<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>  
   <a href="AddLibrarian.jsp">Add Librarian</a>
  <a href="ViewLibrarian.jsp">View Librarian</a>
   <a href="ChangeAPassword.jsp" class="active">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<form name="frm_librarian" method="post" action="/eLibrary/ChangeAPassword" style="margin-left:100px;margin-top:50px;">
<table cellspacing="5px">
	<tr>
	<th align="left">Change Password</th>
	</tr>
	<tr><td>Old Password</td></tr>
	<tr><td><input type="password" name="tOPass"></td></tr>
	<tr><td>New Password</td></tr>
	<tr><td><input type="password" name="tNPass"></td></tr>
	<tr><td>Confirm Password</td></tr>
	<tr><td><input type="password" name="tCPass"></td></tr>
	
	<tr><td><input type="submit" value="submit" onclick="return validate_librarian()"/></td></tr>
	<tr><td><label id="lblError_librarian"></label></td></tr>
</table>
</form>
</div>
</body>
</html>