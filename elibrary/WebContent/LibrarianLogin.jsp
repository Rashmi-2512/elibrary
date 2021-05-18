<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1 name="viewport" content="width=device-width, initial-scale=1"">
<title></title>
</head>
<script type="text/javascript">
function validate_librarian()
{
	var len=document.frm_librarian.tEmail.value.trim().length
	if(len==0)
	{
		alert("Email can't be left blank");
		document.frm_librarian.tEmail.value="";
		document.frm_librarian.tEmail.focus();
		return false;
	}
	var len=document.frm_librarian.tPass.value.length
	if(len==0)
	{
		alert("Password can't be left blank");
		document.frm_librarian.tPass.value="";
		document.frm_librarian.tPass.focus();
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
	background-image:url("./images/library1.jpg");
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
<body text="white">
<div class="topnav">
  <a href="index.jsp" style="margin-left:50px">Home</a>
   <a href="AdminLogin.jsp">Admin Section</a>
  <a href="LibrarianLogin.jsp" class="active">Librarian Section</a>
  <a href="StudentSection.jsp">Student Section</a>

</div>

<div class="container">
<div id="div_librarian" style="position:absolute;left:50px;top:100px">
<form name="frm_librarian" method="post" action="/eLibrary/LibrarianLogin">
<table>
	<tr>
	<th align="left">Librarian Login</th>
	</tr>
	<tr><td>Email Address</td></tr>
	<tr><td><input type="email" name="tEmail" onfocus="this.style.background='yellow'" onblur="this.style.background='white'" ></td></tr>
	<tr><td>Password</td></tr>
	<tr><td><input type="password" name="tPass"></td></tr>
	<tr><td><input type="submit" value="Login" onclick="return validate_librarian()"/></td></tr>
	<tr><td><label id="lblError_librarian">
	<%
		if(session.getAttribute("error_lib")!=null)
		{
			String val=session.getAttribute("error_lib").toString();
			if(val.compareToIgnoreCase("password")==0)
				out.println("Invalid Password");
			else if(val.compareToIgnoreCase("email")==0)
				out.println("Invalid Email");
			session.removeAttribute("error_lib");
		}
	%>
	</label></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>