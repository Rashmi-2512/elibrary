package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBooks
 */
@WebServlet("/AddBooks")
public class AddBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBooks() {
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
		String callno,name,author,publisher,quantity;
		callno=request.getParameter("tCall");
		name=request.getParameter("tName");
		author=request.getParameter("tAuth");
		publisher=request.getParameter("tPubg");
		quantity=request.getParameter("tQuan");
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			//pw.print(name+","+email+","+password+","+mobile);
			String query="INSERT INTO books(callno,name,author,publisher,quantity,Issue) VALUES (?,?,?,?,?,0)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, callno);
			stmt.setString(2, name);
			stmt.setString(3, author);
			stmt.setString(4, publisher);
			stmt.setString(5, quantity);
			
			int row=0;
			row=stmt.executeUpdate();
			if(row>0)
				pw.println("Book added successfully");		
		}
		catch (SQLException e)
		{
			String error=e.getMessage();
			if(error.toLowerCase().contains("duplicate"))
			{
				if(error.toLowerCase().contains("primary"))
					pw.println("Callno already stored");
				else if(error.toLowerCase().contains("name"))
					pw.println("Book Name already stored");
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







