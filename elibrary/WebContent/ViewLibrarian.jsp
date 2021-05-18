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
body,html{
	margin: 0;
  font-family: Arial, Helvetica, sans-serif;
   height:100%;
}
.container
{
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
  <a href="index.jsp" style="margin-left:50px">Home</a>
   <a href="AddLibrarian.jsp">Add librarian</a>
  <a href="ViewLibrarian.jsp" class="active" >View Librarian</a>
  <a href="ChangeAPassword.jsp">Change Password</a>
  <a href="Logout.jsp">Logout</a>
</div>
<div class="container"> 
  <table align="center" border="1">
  <tr>
  	<th>ID</th>
  	<th>Name</th>
  	<th>Email</th>
  	<th>Mobile</th>
  	<th>Edit</th>
  	<th>Delete</th>
  </tr>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		String query="select * from librarian";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			int id=rs.getInt("id");
			out.println("<tr>");
			out.println("<td>"+id+"</td>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("email")+"</td>");
			out.println("<td>"+rs.getString("mobile")+"</td>");
			out.println("<td><a href=editLibrarian.jsp?id="+id+" >Edit</a></td>");
			out.println("<td><a href=deleteLibrarian.jsp?id="+id+" onclick=\"return verify()\" >Delete</a></td>");
			out.println("</tr>");
		}
		rs.close();
		stmt.close();
		conn.close();
	}
	catch(ClassNotFoundException ex)
	{
		
	}
	catch(SQLException ex)
	{
	}
%>
</table>
</div>
</body>
</html>