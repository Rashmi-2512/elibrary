package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.module.ResolutionException;
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
 * Servlet implementation class AddLib
 */
@WebServlet("/AddLib")
public class AddLib extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLib() {
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
		String email,password,name,mobile;
		email=request.getParameter("tEmail");
		password=request.getParameter("tPass");
		name=request.getParameter("tName");
		mobile=request.getParameter("tMobile");
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			//pw.print(name+","+email+","+password+","+mobile);
			String query="INSERT INTO librarian(name,email,password,mobile) VALUES (?,?,md5('"+password+"'),?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, mobile);
			int row=0;
			row=stmt.executeUpdate();
			if(row>0)
				pw.println("Librarian added successfully");		
		}
		catch (SQLException e)
		{
			String error=e.getMessage();
			if(error.toLowerCase().contains("duplicate"))
			{
				if(error.toLowerCase().contains("uc_email"))
					pw.println("Email already Stored");
				else if(error.toLowerCase().contains("uc_mobile"))
					pw.println("Mobile already Stored");
				else
					pw.println(error);
			}
			else
				pw.println(error);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}




