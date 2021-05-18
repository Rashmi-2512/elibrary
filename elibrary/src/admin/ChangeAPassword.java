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
 * Servlet implementation class ChangeAPassword
 */
@WebServlet("/ChangeAPassword")
public class ChangeAPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAPassword() {
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
		String opass,npass,email;
		opass=request.getParameter("tOPass");
		npass=request.getParameter("tNPass");
		HttpSession session=request.getSession();
		email=session.getAttribute("admin").toString();
		PrintWriter pw=response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			String query="select password from admin where email='"+email+"'";
			PreparedStatement stmt=conn.prepareStatement(query);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				String old_pass=rs.getString(1);
				query="select md5('"+opass+"')";
				stmt=conn.prepareStatement(query);
				rs=stmt.executeQuery();
				rs.next();
				String new_pass=rs.getString(1);
				if(old_pass.compareTo(new_pass)==0)
				{
					query="update admin set password=md5('"+npass+"') where email='"+email+"'";
					stmt=conn.prepareStatement(query);
					int row=stmt.executeUpdate();
					if(row>0)
					{
						pw.println("Password Changed");
					}
				}
				else
				{
					pw.println("Invalid pass");
				}
		
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
