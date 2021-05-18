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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("librarian")==null)
{
	response.sendRedirect("index.jsp");
}
%>

<%
	String id;
    id=request.getParameter("id");
%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary","root","password");
		String query="delete from books where callno=?";
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setString(1, id);
		int row=stmt.executeUpdate();
		if(row>0)
		{
			out.println("Book Deleted ");
		}
	}
	catch(ClassNotFoundException ex)
	{
		
	}
	catch(SQLException ex)
	{
	}
%>
<a href="ViewBook.jsp">View Librarian</a>


</body>
</html>