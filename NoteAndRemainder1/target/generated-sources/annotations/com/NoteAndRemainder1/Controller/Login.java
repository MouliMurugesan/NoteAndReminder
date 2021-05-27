package com.NoteAndRemainder1.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NoteAndRemainder1.DAO.ConnectionDb;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		Connection con=ConnectionDb.getConnection();
		String email = request.getParameter("userEmail");

		String password = request.getParameter("userPass");
		String query= "Select id,Name,email,password from registration where email=?";
		try
		{
		PreparedStatement pt = con.prepareStatement(query);
		pt.setString(1,email );
		ResultSet rs=pt.executeQuery();
		if(rs.next())
		{
			String checkpass=rs.getString("password");
			if(password.equals(checkpass))
			{
				 HttpSession session = request.getSession(true); // reuse existing
		         // session if exist
		         // or create one
				 synchronized (session) {
				 String username=rs.getString("Name");
				 int id=rs.getInt("Id");
				 session.setAttribute("user", username);
				 session.setAttribute("id",id);
				 session.setMaxInactiveInterval(1000);
				 }
				 con.close();
				 response.sendRedirect("Home.jsp"); 

			}
			else
			{
				response.sendRedirect("checksometiong.html"); 
				con.close();
			}
		}
		}
		catch(Exception e)
		{
			response.sendRedirect("checksometiong.html"); 
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
