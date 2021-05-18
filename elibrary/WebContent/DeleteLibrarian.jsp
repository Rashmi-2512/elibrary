<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script>
	function verify()
	{
		return confirm("Are You Sure?");
	}
</script>
</head>
<body>
<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<div class="topnav">
  <a class="active"href="#home" style="margin-left:50px">Home</a>
   <a href="AddLibrarian.jsp">Add librarian</a>
  <a href="ViewLibrarian.jsp">View Librarian</a>
  <a href="ChangePassword.jsp">Change Password</a>
  <a href="Logout.jsp">Logout</a>
 </div>
<%
	int id;
    id=Integer.parseInt(request.getParameter("id"));
%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		String query="delete from librarian where id=?";
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setInt(1, id);
		int row=stmt.executeUpdate();
		if(row>0)
		{
			out.println("Librarian Deleted ");
		}
	}
	catch(ClassNotFoundException ex)
	{
		
	}
	catch(SQLException ex)
	{
	}
%>
<a href="ViewLibrarian.jsp">View Librarian</a>
</body>
</html>