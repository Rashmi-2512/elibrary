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
   
	background-image:url("./images/b22.jpeg");
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
	function validate_returnBookfr()
	{
		var len=document.frm_issueBook.tCall.value.trim().length
		if(len==0)
		{
			alert("Book Callno can't be left blank");
			document.frm_addBook.tCall.value="";
			document.frm_addBook.tCall.focus();
			return false;
		}
		len=document.frm_issueBook.tId.value.trim().length
		if(len==0)
		{
			alert("ID can't be left blank");
			document.frm_issueBook.tId.value="";
			document.frm_issueBook.tId.focus();
			return false;
		}
		len=document.frm_issueBook.tName.value.trim().length
		if(len==0)
		{
			alert("Name can't be left blank");
			document.frm_issueBook.tName.value="";
			document.frm_issueBook.tName.focus();
			return false;
		}
		var mobile=document.frm_issueBook.tMobile.value
		var exp=/^\d{10}$/
		if(!exp.test(mobile))
		{
			alert("Invalid Mobile number");
			document.frm_issueBook.tMobile.focus();
			return false;
		}
		
		len=document.frm_issueBook.tDate.value.length
		if(len==0)
		{
			alert("IssueDate can't be left blank");
			document.frm_issueBook.tDate.value="";
			document.frm_issueBook.tDate.focus();
			return false;
		}
		return true
				
	}
	
</script>
<body>
<%
if(session.getAttribute("librarian")==null)
{
	response.sendRedirect("index.jsp");
}
%>

<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
  <a href="LibrarianSection.jsp">Librarian Section</a>
  
   <a href="AddBook.jsp">Add Book</a>
  <a href="ViewBook.jsp">View Book</a>
   <a href="IssueBook.jsp">Issue Book</a>
   <a href="ViewIssuedBooks.jsp">View Issued Book</a>
   <a href="ReturnBook.jsp" class="active">Return Book</a>
   <a href="ChangePassword.jsp">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<form name="frm_returnBook" method="post" action="/eLibrary/ReturnBooks" style="margin-left:100px;margin-top:50px;">
<table cellspacing="5px">
	<tr>
	<th align="left">Return Book Form</th>
	</tr>
	<tr><td>Book Callno</td></tr>
	<tr><td><input type="text" id="text_style" name="tCall" ></td></tr>
	<tr><td>Student id</td></tr>
	<tr><td><input type="integer" name="tId" onfocus="this.style.background='yellow'" onblur="this.style.background='white'"></td></tr>
	<tr><td><input type="submit" value="Return Book" onclick="return validate_issueBookfr()"/></td></tr>
	<tr><td><label id="lblError_issueBook"></label></td></tr>
</table>
</form>
</div>
</body>
</html>