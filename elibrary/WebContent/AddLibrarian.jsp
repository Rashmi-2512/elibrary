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
	background-image:url("./images/b1.jpeg");
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
#text_style
{
border-color:green;
border-style:solid;
border-width:1px;
	border-radius: 4px;
	
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
<body text="white">
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
   <a href="AddLibrarian.jsp" class="active" >Add Librarian</a>
  <a href="ViewLibrarian.jsp">View Librarian</a>
   <a href="ChangeAPassword.jsp">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<form name="frm_librarian" method="post" action="/eLibrary/AddLib" style="margin-left:100px;margin-top:50px;">
<table cellspacing="5px">
	<tr>
	<th align="left">Add Librarian</th>
	</tr>
	<tr><td>Name</td></tr>
	<tr><td><input type="text" id="text_style" name="tName" ></td></tr>
	<tr><td>Email Address</td></tr>
	<tr><td><input type="email" name="tEmail" onfocus="this.style.background='yellow'" onblur="this.style.background='white'" ></td></tr>
	<tr><td>Password</td></tr>
	<tr><td><input type="password" name="tPass"></td></tr>
	<tr><td>Phone Number</td></tr>
	<tr><td><input type="text" name="tMobile" ></td></tr>
	
	<tr><td><input type="submit" value="submit" onclick="return validate_librarian()"/></td></tr>
	<tr><td><label id="lblError_librarian"></label></td></tr>
</table>
</form>
</div>
</body>
</html>