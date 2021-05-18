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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RequestBook
 */
@WebServlet("/RequestBook")
public class RequestBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestBook() {
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
		String callno;
		int id;
		HttpSession session=request.getSession();
		id=Integer.parseInt(session.getAttribute("student").toString());
		callno=request.getParameter("tCall");
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			String query="select * from request where callno=? and student_id=? and Issue_date is null";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, callno);
			stmt.setInt(2, id);
			ResultSet rs=stmt.executeQuery();
			if(!rs.next())
			{
				query="INSERT INTO request(callno,student_id,request_date) VALUES (?,?,curdate())";
				stmt=conn.prepareStatement(query);
				stmt.setString(1, callno);
				stmt.setInt(2, id);
				int row=0;
				row=stmt.executeUpdate();
				if(row>0)
					pw.println("Request sent successfully");		
			}
			else
				pw.println("Already request for this book");
		}
		catch (SQLException e)
		{
			String msg=e.getMessage();
			if(msg.toLowerCase().contains("fk_callno_request"))
			{
				pw.println("Invalid Call Number");
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
