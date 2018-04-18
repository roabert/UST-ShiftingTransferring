package ust.registrar.utility.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.studentprocess.forgotpassword;

/**
 * Servlet implementation class ChangeOldPassword
 */
@WebServlet("/ChangeOldPassword")
public class ChangeOldPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOldPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    Connection conn = null;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		conn = SingletonDB.getConnection();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	         PrintWriter out = response.getWriter();
	         
	         String getpassword = request.getParameter("change_password");
	         String getEmail = request.getParameter("getemail1");
	         
	         String event = "Password Recovery";
	         String description = "This user has recovered his/her password successfully";
	         forgotpassword f = new forgotpassword();
	         f.setPassword(getpassword);
	         f.setChangepassemail(getEmail);
	         f.setEvent(event);
	         f.setDescription(description);
	         f.ChangePasswordSuccessful(conn);
	         
	         request.getRequestDispatcher("login.jsp").include(request, response);
	         out.print("<script>alert('You have change your password successfully!');</script>");
	}

}
