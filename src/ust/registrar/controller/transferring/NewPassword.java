package ust.registrar.controller.transferring;

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
import ust.registrar.model.transferring.NewPasswordDAO;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/NewPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPassword() {
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
	         String getuser = request.getParameter("getuser");
	         
	         String event = "Default password changed";
	         String description = "This user has changed his/her password successfully";
	         NewPasswordDAO f = new NewPasswordDAO();
	         f.setPassword(getpassword);
	         f.setTransferid(getuser);
	         f.checkPassword(conn);
	         f.setEvent(event);
	         f.setDescription(description);
	         if(!(getpassword.equals(f.getGetpassword()))) {
	         f.TransfereeChangePassword(conn);
	         f.insertLogs(conn);
	         request.getRequestDispatcher("Transfer-Welcome.jsp").include(request, response);
	         out.print("<script>alert('You have changed your password successfully! You may now proceed to do the process. Kindly open the side menu');</script>");
	         }
	         else if(getpassword.equals(f.getGetpassword())){
	        	 request.getRequestDispatcher("Transfer-Transferring.jsp").include(request, response);
	        	 out.print("<script>alert('This is your default password. Please type a new and secured password');</script>");
	 	        
	            out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
	        		
	         }
		
	}

}
