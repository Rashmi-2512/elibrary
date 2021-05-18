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
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
		PrintWriter pw=response.getWriter();
		// TODO Auto-generated method stub
		String password,student_name,gen,student_mobile,ques,ans;
		password=request.getParameter("tPass");
		student_name=request.getParameter("tName");
		gen=request.getParameter("tGen");
		student_mobile=request.getParameter("tMobile");
		ques=request.getParameter("tSec");
		ans=request.getParameter("tAns");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eLibrary", "root", "password");
			//pw.print(password+","+student_name+","+gen+","+student_mobile+","+ques+","+ans);
			String query="INSERT INTO student(password,name,gen,mobile,security_ques,answer) VALUES(?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, password);
			stmt.setString(2, student_name);
			stmt.setString(3, gen);
			stmt.setString(4, student_mobile);
			stmt.setString(5, ques);
			stmt.setString(6, ans);
			
			int row=0;
			row=stmt.executeUpdate();
			if(row>0)
				pw.println("Student Added Successfully");
			
			
				
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
