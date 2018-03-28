package ust.registrar.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.main.LoginDAO;

import java.sql.*;

/**
 * Servlet implementation class loginprocess
 */
@WebServlet("/loginprocess")
public class loginprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public loginprocess() {
        super();
        // TODO Auto-generated constructor stub
    }
 public void init() throws ServletException {
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
		String uname_get = request.getParameter("userbox");
		String pwd_get = request.getParameter("pwdbox");

			LoginDAO login = new LoginDAO();
			login.setUserid(uname_get);
			login.setPassword(pwd_get);
			login.Login(conn);
			HttpSession session = request.getSession();
			   if(login.getType().equals("OFAD")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("OfadTransaction_Shifter.jsp")
			    	.forward(request, response);
			 
			    }
			     else if(login.getType().equals("Admin")) {	
		    	session.setAttribute("setuser", uname_get);
		    	request.getRequestDispatcher("AdminsStudent_Shifter.jsp")
		    	.forward(request, response);
			    }
			    else if(login.getType().equals("Dean")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("DeanTransaction_Shifter.jsp")
			    	.forward(request, response);
			    	
			    }
			    else if(login.getType().equals("Registrar")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("RegistrarEndorse_Shifter.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("OSG")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("OsgTransaction_Shifter.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("OSA")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("OsaTransactions.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("Shifter")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("Shifter-Shifting.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("Transferee")) {
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("Transfer-Transferring.jsp")
			    	.forward(request, response);
			    }
			    else{
				request.getRequestDispatcher("login.jsp").include(request, response);
				out.print("<script>alert('Invalid Credentials!');</script>");
			    } 
	       
	}

}
