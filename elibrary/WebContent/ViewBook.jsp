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
   
	background-image:url("./images/b9.jpeg");
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
   <a href="AddBook.jsp">Add Book</a>
  <a href="ViewBook.jsp" class="active">View Book</a>
   <a href="IssueBook.jsp">Issue Book</a>
   <a href="ViewIssuedBook.jsp">View Issued Book</a>
   <a href="ReturnBook.jsp">Return Book</a>
   <a href="ChangePassword">Change Password</a>
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
  	<th>Issued</th>
  	<th>Delete</th>
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
			String id=rs.getString("callno");
			out.println("<tr>");
			out.println("<td>"+rs.getString("callno")+"</td>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("author")+"</td>");
			out.println("<td>"+rs.getString("publisher")+"</td>");
			out.println("<td>"+rs.getInt("quantity")+"</td>");
			out.println("<td>"+rs.getInt("Issue")+"</td>");
			out.println("<td><a a href=DeleteBook.jsp?id="+id+" onclick=\"return verify()\" >Delete</a></td>");
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