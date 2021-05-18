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
   
	background-image:url("./images/b8.jpeg");
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
	function validate_addBookfr()
	{
		var len=document.frm_addBook.tCall.value.trim().length
		if(len==0)
		{
			alert("Callno can't be left blank");
			document.frm_addBook.tCall.value="";
			document.frm_addBook.tCall.focus();
			return false;
		}
		len=document.frm_addBook.tName.value.trim().length
		if(len==0)
		{
			alert("Name can't be left blank");
			document.frm_addBook.tName.value="";
			document.frm_addBook.tName.focus();
			return false;
		}
		len=document.frm_addBook.tAuth.value.length
		if(len==0)
		{
			alert("Author can't be left blank");
			document.frm_addBook.tAuth.value="";
			document.frm_addBook.tAuth.focus();
			return false;
		}
		len=document.frm_addBook.tQuan.value.length
		if(len==0)
		{
			alert("Quantity can't be left blank");
			document.frm_addBook.tQuan.value="";
			document.frm_addBook.tQuan.focus();
			return false;
		}
		return true
				
	}
	
</script>
<body text="white">
<%
if(session.getAttribute("librarian")==null)
{
	response.sendRedirect("index.jsp");
}
%>

<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
  <a href="LibrarianSection.jsp">Librarian Section</a>
   <a href="AddBook.jsp" class="active">Add Book</a>
  <a href="ViewBook.jsp">View Book</a>
   <a href="IssueBook.jsp">Issue Book</a>
   <a href="ViewIssuedBook.jsp">View Issued Book</a>
   <a href="ReturnBook.jsp">Return Book</a>
   <a href="ChangePassword.jsp">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<form name="frm_addBook" method="post" action="/eLibrary/AddBooks"  style="margin-left:100px;margin-top:50px;">
<table cellspacing="5px">
	<tr>
	<th align="left">Add Book Form</th>
	</tr>
	<tr><td>Callno</td></tr>
	<tr><td><input type="text" id="text_style" name="tCall" ></td></tr>
	<tr><td>Name</td></tr>
	<tr><td><input type="text" name="tName"></td></tr>
	<tr><td>Author</td></tr>
	<tr><td><input type="text" name="tAuth" onfocus="this.style.background='yellow'" onblur="this.style.background='white'"></td></tr>
	<tr><td>Publisher</td></tr>
	<tr><td><input type="text" name="tPubg" ></td></tr>
	<tr><td>Quantity</td></tr>
	<tr><td><input type="integer" name="tQuan" ></td></tr>
	
	
	<tr><td><input type="submit" value="Save Book" onclick="return validate_addBookfr()"/></td></tr>
	<tr><td><label id="lblError_addBook"></label></td></tr>
</table>
</form>
</div>
</body>
</html>