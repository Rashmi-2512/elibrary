package admin;

import java.io.IOException;
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
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
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
		String Student_id,password;
		Student_id=request.getParameter("tId");
		password=request.getParameter("tPass");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			
			String query="select password,name from student where id='"+Student_id+"'";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				String old_pass=rs.getString(1);
				if(old_pass.compareTo(password)==0)
				{
					String name=rs.getString(2);
					session.setAttribute("name", name);
					session.setAttribute("student", Student_id);
					response.sendRedirect("StudLogin.jsp");
				}
				else
				{
					session.setAttribute("error", "password");
					response.sendRedirect("StudentSection.jsp");
				}
			}
			else
			{
				session.setAttribute("error", "Student_id");
				response.sendRedirect("StudentSection.jsp");
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
