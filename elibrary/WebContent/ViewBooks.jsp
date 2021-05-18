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
</head>
<body>
<%
if(session.getAttribute("student")==null)
{
	response.sendRedirect("StudentSection.jsp");
}
%>
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
  <a href="StudentSection.jsp">Student Section</a>
  <a href="ViewBooks.jsp" class="active">View Books</a>
   <a href="RequestBook.jsp">Request Books</a>
    <a href="Logout.jsp">Logout</a>

</div>

<div id="div_librarian" style="position:absolute;left:375px;top:100px">
  <table align="center" border="10">
  <tr>
  	<th>Callno</th>
  	<th>Name</th>
  	<th>Author</th>
  	<th>Publisher</th>
  	<th>Quantity</th>
  </tr>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		String query="select * from books";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			out.println("<tr>");
			out.println("<td>"+rs.getString("callno")+"</td>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("author")+"</td>");
			out.println("<td>"+rs.getString("publisher")+"</td>");
			out.println("<td>"+rs.getString("quantity")+"</td>");
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