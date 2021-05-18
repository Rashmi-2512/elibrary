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
 * Servlet implementation class ReturnBooks
 */
@WebServlet("/ReturnBooks")
public class ReturnBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBooks() {
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
		// TODO Auto-generated method st
		String callno;
		int student_id;
		callno=request.getParameter("tCall");
		student_id=Integer.parseInt(request.getParameter("tId"));
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			//pw.print(name+","+email+","+password+","+mobile);
			String query="select issue_id from issuebooks where callno=? and student_id =? and return_date is null";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, callno);
			stmt.setInt(2, student_id);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				int issue_id=rs.getInt("issue_id");
					query="update issueBooks set return_date=curdate() where issue_id=?";
					stmt=conn.prepareStatement(query);
					stmt.setInt(1,issue_id);
					int row=stmt.executeUpdate();
					if(row>0)
					{
						query="update Books set quantity=quantity+1, issue=issue-1 where callno=?";
						stmt=conn.prepareStatement(query);
						stmt.setString(1, callno);
						row=stmt.executeUpdate();
						if(row>0)
						{
							pw.println("Book returned");
						}
					}
			}
			else
			{
				pw.println("Invalid Details");
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
