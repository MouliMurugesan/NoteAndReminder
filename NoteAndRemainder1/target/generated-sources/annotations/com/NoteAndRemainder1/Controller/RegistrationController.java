package com.NoteAndRemainder1.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NoteAndRemainder1.DAO.ConnectionDb;
import com.NoteAndRemainder1.DAO.User;
import com.NoteAndRemainder1.Model.Registration;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationServlet")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
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
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String mb=request.getParameter("mobno");
		String password = request.getParameter("userPass");
		//make user object
		Registration register=new Registration(name, email, mb, password);
		

		//create a database model
		User user = new User(ConnectionDb.getConnection());
		try {
			if (user.saveUser(register)) {
			   response.sendRedirect("Login.jsp");
			} else {
				response.sendRedirect("Registration.jsp");
			    }
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
