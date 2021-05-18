package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		String email,password;
		email=request.getParameter("tEmail");
		password=request.getParameter("tPass");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/eLibrary", "root", "pass");
			
			String query="select password from admin where email='"+email+"'";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				String old_pass=rs.getString(1);
				query="select md5('"+password+"')";
				stmt=conn.prepareStatement(query);
				rs=stmt.executeQuery();
				rs.next();
				String new_pass=rs.getString(1);
				if(old_pass.compareTo(new_pass)==0)
				{
					session.setAttribute("admin", email);
					response.sendRedirect("adminSection.jsp");
				}
				else
				{
					session.setAttribute("error", "password");
					response.sendRedirect("AdminLogin.jsp");
				}
			}
			else
			{
				session.setAttribute("error", "email");
				response.sendRedirect("index.jsp");
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
