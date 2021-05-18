<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
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
	background-image:url("./images/library2.jpg");
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
	left:200px;
	top:200px;
	width:500px;
	border:yellow double 3px;
}
</style>
</head>
<body text="white">
<%!
	Scanner sc;
	File file;
%>
<div class="topnav">
  <a href="index.jsp"  style="margin-left:50px">Home</a>
  <a href="AdminLogin.jsp"  >Admin Section</a>
  <a href="LibrarianLogin.jsp"  >Librarian Section</a>
  <a href="StudentSection.jsp" class="active">Student Section</a>  
</div>


<div class="container">
<div id="div_librarian" style="position:absolute;left:20px;top:100px;color:green;">
<h1>Student Section</h1>
<ul>
<li>View Books</li>
<li>Request Books</li>
<li>Return Books</li>
<li>Logout</li>
</ul>
</div>
<%
	file=new File("c:/Notes/Offer.txt");
	sc=new Scanner(file);
%>
<div id="marquee_div">
<h1>NEW OFFERS!! LOGIN FOR MORE OFFERS!!!!</h1>
<marquee direction="up" scrollamount="3">
<%
	while(sc.hasNext())
	{
		String str=sc.nextLine();
		out.println(str+"<br/>");
	}
%>
</marquee>
</div>
<div id="div_student" style="position:absolute;left:725px;top:275px">
<form name="frm_student" method="post" action="/eLibrary/StudentLogin">
<table>
	<tr>
	<th align="left">Student Login</th>
	</tr>
	<tr><td>Student Id</td></tr>
	<tr><td><input type="integer" name="tId" onfocus="this.style.background='yellow'" onblur="this.style.background='white'" ></td></tr>
	<tr><td>Password</td></tr>
	<tr><td><input type="password" name="tPass"></td></tr>
	<tr><td><input type="submit" value="Login" /></td></tr>
	<tr><td><a href="Register.jsp">Register Now</a></td></tr>
	<tr><td><a href="Forgot.jsp">Forgot Password</a></td></tr>
	<%
		if(session.getAttribute("error")!=null)
		{
			String val=session.getAttribute("error").toString();
			if(val.compareToIgnoreCase("password")==0)
				out.println("Invalid Password");
			else if(val.compareToIgnoreCase("Student_id")==0)
				out.println("Invalid Student Id");
			session.removeAttribute("error");
		}
	%>
</table>
</form>
</div>
</div>
</body>
</html>