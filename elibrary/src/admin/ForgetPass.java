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
 * Servlet implementation class ForgetPass
 */
@WebServlet("/ForgetPass")
public class ForgetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPass() {
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
		String sec_ques,ans,new_pass;
		int reg_id;
		reg_id=Integer.parseInt(request.getParameter("tId"));
		sec_ques=request.getParameter("tSec");
		ans=request.getParameter("tAns");
		new_pass=request.getParameter("tPass");
		PrintWriter pw=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			String query="select security_ques,answer from student where id=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setInt(1, reg_id);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				String secQues,answ;
				secQues=rs.getString(1);
				answ=rs.getString(2);
				if(sec_ques.compareToIgnoreCase(secQues)==0)
				{
					if(ans.compareTo(answ)==0)
					{
						query="update student set password=? where id=?";
						stmt=conn.prepareStatement(query);
						stmt.setString(1, new_pass);
						stmt.setInt(2, reg_id);
						int row=stmt.executeUpdate();
						if(row>0)
							pw.println("Password reset successfully");
					}
					else
					{
						pw.println("Wrong answer");
					}
				}
				else
				{
					pw.println("Invalid Security Question");
				}
				
			}
			else
			{
				pw.println("Invalid Id");
			}
					
		}
		catch (SQLException e)
		{
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
