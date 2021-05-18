package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IssueBooks
 */
@WebServlet("/IssueBooks")
public class IssueBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String callno,student_name,student_mobile,issue_date;
		int student_id;
		callno=request.getParameter("tCall");
		student_id=Integer.parseInt(request.getParameter("tId"));
		PrintWriter pw=response.getWriter();
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
						pw.println("Book issued");
					}
				}
				else
					pw.println("Books out of stock");
			}
			else
			{
				pw.println("Invalid Call Number");
			}
		}
		catch (SQLException e)
		{
			String msg=e.getMessage();
			if(msg.toLowerCase().contains("fk_studentid"))
			{
				pw.println("Invalid Student ID");
			}
			else
				pw.println(msg);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}




