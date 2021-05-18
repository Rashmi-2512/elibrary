<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1 name="viewport" content="width=device-width, initial-scale=1"">
<title></title>
</head>
<script type="text/javascript">
	function validate_admin()
	{
		var len=document.frm_admin.tEmail.value.trim().length
		if(len==0)
		{
			alert("Email can't be left blank");
			document.frm_admin.tEmail.value="";
			document.frm_admin.tEmail.focus();
			return false;
		}
		var len=document.frm_admin.tPass.value.length
		if(len==0)
		{
			alert("Password can't be left blank");
			document.frm_admin.tPass.value="";
			document.frm_admin.tPass.focus();
			return false;
		}
		return true
	}
	
</script>
<style>
body,html{
	margin: 0;
  font-family: Arial, Helvetica, sans-serif;
   height:100%;
}
.container
{
	background-image:url("./images/1.jpg");
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
<body >
<div class="topnav">
  <a href="index.jsp" style="margin-left:50px">Home</a>
   <a href="AdminLogin.jsp" class="active">Admin Section</a>
  <a href="LibrarianLogin.jsp">Teacher Section</a>
  <a href="StudentSection.jsp">Student Section</a>

</div>
<div class="container">
<div id="div_admin" style="position:absolute;left:20px;top:100px" width="100%">
<form name="frm_admin" method="post" action="/eLibrary/AdminLogin">
<table width=500>
	<tr>
	<th align="left">Admin Login</th>
	</tr>
	<tr><td>Email Address</td></tr>
	<tr><td width=70><input type="email" name="tEmail" onfocus="this.style.background='yellow'" onblur="this.style.background='white'" ></td></tr>
	<tr><td>Password</td></tr>
	<tr><td><input type="password" name="tPass"></td></tr>
	<tr><td><input type="submit" value="Login" onclick="return validate_admin()"/></td></tr>
	<tr><td><label id="lblError_admin">
	<%
		if(session.getAttribute("error")!=null)
		{
			String val=session.getAttribute("error").toString();
			if(val.compareToIgnoreCase("password")==0)
				out.println("Invalid Password");
			else if(val.compareToIgnoreCase("email")==0)
				out.println("Invalid Email");
			session.removeAttribute("error");
		}
	%>
	</label></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>