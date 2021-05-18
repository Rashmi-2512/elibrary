<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	
	margin: 0;
  font-family: Arial, Helvetica, sans-serif;
	background-color: #cccccc;
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
<body>
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
   <a href="AddLibrarian.jsp">Add Librarian</a>
  <a href="ViewLibrarian.jsp">View Librarian</a>
   <a href="ChangePassword.jsp">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>
<%!
	int id;
	String name,email,mobile; 
%>
<%
	id=Integer.parseInt(request.getParameter("id"));
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
	String query="Select * from librarian where id="+id;
	PreparedStatement stmt=conn.prepareStatement(query);
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{
		name=rs.getString("name");
		email=rs.getString("email");
		mobile=rs.getString("mobile");
	}
	}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
<form name="frm_librarian" method="post" action="/eLibrary/EditLibrarian"style="margin-left:100px;margin-top:50px;">
<input type="hidden" name="tId" value=<%=id %> />
<table cellspacing="5px">
	<tr>
	<th align="left">Edit Librarian</th>
	</tr>
	<tr><td>Name</td></tr>
	<tr><td><input type="text" id="text_style" name="tName" value=<%=name %> ></td></tr>
	<tr><td>Email Address</td></tr>
	<tr><td><input type="email" name="tEmail" value=<%=email %> onfocus="this.style.background='yellow'" onblur="this.style.background='white'" ></td></tr>
	<tr><td>Phone Number</td></tr>
	<tr><td><input type="text" name="tMobile"value=<%=mobile %> ></td></tr>
	
	<tr><td><input type="submit" value="update" onclick="return validate_librarian()"/></td></tr>
	<tr><td><label id="lblError_librarian"></label></td></tr>
</table>
</form>
</body>
</html>