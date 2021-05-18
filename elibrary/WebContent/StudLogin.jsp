<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
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
	background-image:url("./images/stud.jpg");
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
#marquee_div
{
	position:absolute;
	left:50px;
	top:200px;
	width:500px;
	border:yellow double 3px;
}
</style>
</head>
<body text="white">
<%!
	Scanner sc;
	Scanner sc1;
	File file;
	File file1;
%>
<%!
	String name;
%>
<%
if(session.getAttribute("student")==null)
{
	response.sendRedirect("StudentSection.jsp");
}
name=session.getAttribute("name").toString();
%>
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
  <a href="StudentSection.jsp">Student Section</a>  
  <a href="ViewBooks.jsp">View Book</a>
  <a href="RequestBook.jsp">Request Book</a>
   <a href="IssueBook.jsp">Return Book</a>
    <a href="Logout.jsp">Logout</a>

</div>
<div class="container">
<h1>Welcome <b><%= name%></b><br/></h1>
<div id="marquee_div">
<h1>ALL NEW OFFERS ARE HERE.HURRY AND GRAB THEM ALL!!!!</h1>
<marquee direction="up" scrollamount="3">
<%
file=new File("c:/Notes/Offer.txt");
file1=new File("c:/Notes/NewOffer.txt");
sc=new Scanner(file);
	while(sc.hasNext())
	{
		String str=sc.nextLine();
		out.println(str+"<br/>");
	}
	sc=new Scanner(file1);
	while(sc.hasNext())
	{
		String str=sc.nextLine();
		out.println(str+"<br/>");
	}
%>
</marquee>
</div>

<div id="div_librarian" style="position:absolute;left:600px;top:125px">
<h1>YOUR BOOKS REQUESTS</h1>
  <table align="center" border="1">
  <tr>
    <th>Request Id</th>
  	<th>Callno</th>
  	<th>Request Date</th>
  	<th>Issue Date</th>
  </tr>
<%
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		int id;
		id=Integer.parseInt(session.getAttribute("student").toString());
		String query="select * from request where student_id="+id;
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
			out.println("<td>"+rs.getString("request_date")+"</td>");
			if(rs.getString("issue_date")==null)
				out.println("<td>Not Issue</td>");
			else
				out.println("<td>"+rs.getString("issue_date")+"</td>");
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