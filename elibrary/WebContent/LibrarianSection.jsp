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
	background-image:url("./images/b4.jpg");
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
  <a href="LibrarianSection.jsp" class="active">Librarian Section</a> 
   <a href="AddBook.jsp">Add Book</a>
  <a href="ViewBook.jsp">View Book</a>
   <a href="IssueBook.jsp">Issue Book</a>
   <a href="ViewIssuedBook.jsp">View Issued Book</a>
   <a href="ReturnBook.jsp">Return Book</a>
   <a href="ChangePassword.jsp">Change Password</a>
    <a href="Logout.jsp">Logout</a>

</div>


<div class="container">
<div id="div_librarian" style="position:absolute;left:20px;top:100px">
<h1>Librarian Section</h1>
<ul>
<li>Add Books</li>
<li>View Books</li>
<li>Issue Books</li>
<li>Return Books</li>
<li>Change password</li>
<li>Logout</li>
</ul>
</div>
<div  id="div_librarian" style="position:absolute;left:500px;top:125px">
  <table align="center" border="1">
  <tr>
    <th>Request Id</th>
  	<th>Callno</th>
  	<th>Student Id</th>
  	<th>Request Date</th>
  	<th>Issue</th>
  </tr>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		String query="select * from request where issue_date is null";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			String req_id=rs.getString("request_id");
			String callno=rs.getString("callno");
			String student_id=rs.getString("student_id");
			out.println("<tr>");
			out.println("<td>"+rs.getString("request_id")+"</td>");
			out.println("<td>"+rs.getString("callno")+"</td>");
			out.println("<td>"+rs.getString("student_id")+"</td>");
			out.println("<td>"+rs.getString("request_date")+"</td>");
			out.println("<td><a href=RequestIssue.jsp?req_id="+req_id+"&callno="+callno+"&student_id="+student_id+" onclick=\"return verify()\" >Issue</a></td>");
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
</div>
</body>
</html>