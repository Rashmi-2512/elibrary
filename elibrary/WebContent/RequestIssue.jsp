<%@page import="java.io.PrintWriter"%>
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
String callno,issue_date;
int request_id,student_id;
request_id=Integer.parseInt(request.getParameter("req_id"));
callno=request.getParameter("callno");
student_id=Integer.parseInt(request.getParameter("student_id"));
try {                                                                  
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
	//pw.print(name+","+email+","+password+","+mobile);
	String query="select quantity from books where callno=?";
	PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setString(1, callno);
	ResultSet rs=stmt.executeQuery();
		if(rs.next())
		{
			int qty=rs.getInt(1);
			if(qty>0)
			{
				query="insert into issuebooks(callno,student_id,issue_date,return_date) values(?,?,curdate(),null)";
				stmt=conn.prepareStatement(query);
				stmt.setString(1, callno);
				stmt.setInt(2, student_id);
				int row=stmt.executeUpdate();
				if(row>0)
				{
					query="update request set issue_date=curdate() where request_id=?";
					stmt=conn.prepareStatement(query);
					stmt.setInt(1, request_id);
					stmt.executeUpdate();
					out.println("Book issued");
				}
			}
			else
				out.println("Books out of stock");
		}
		else
		{
			out.println("Invalid Call Number");
		}
}
catch (SQLException e)
{
	String msg=e.getMessage();
	if(msg.toLowerCase().contains("fk_studentid"))
	{
		out.println("Invalid Student ID");
	}
	else
		out.println(msg);
}
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

</body>
</html>