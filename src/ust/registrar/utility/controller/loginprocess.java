package ust.registrar.utility.controller;

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
import ust.registrar.utility.EncryptionTool;

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
       //for logs
		
		String event = "Log in authentication";
		String description = "This user is currently logged in";
		
			LoginDAO login = new LoginDAO();
			login.setUserid(uname_get);
			login.setPassword(pwd_get);
			login.setEvent(event);
			login.setDescription(description);
			login.Login(conn);
			HttpSession session = request.getSession();
		 
	
	if(login.getType() != null) {
           if(login.getStatus() != null) {		   
             if(login.getStatus().equals("active")) {
			   if(login.getType().equals("OFAD")) {
				   login.insertLogs(conn);
			    	session.setAttribute("ofaduser", uname_get);
			    	request.getRequestDispatcher("OfadTransaction_Shifter.jsp")
			    	.forward(request, response);
			 
			    }
			     else if(login.getType().equals("Admin")) {	
			    	 login.insertLogs(conn);
		    	session.setAttribute("administrator", uname_get);
		    	request.getRequestDispatcher("AdminsStudent_Shifter.jsp")
		    	.forward(request, response);
			    }
			    else if(login.getType().equals("Dean")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("deanuser", uname_get);
			    	request.getRequestDispatcher("DeanTransaction_Shifter.jsp")
			    	.forward(request, response);
			    	
			    }
			    else if(login.getType().equals("Registrar")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("registraruser", uname_get);
			    	request.getRequestDispatcher("RegistrarEndorse_Shifter.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("OSG")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("secgenuser", uname_get);
			    	request.getRequestDispatcher("OsgTransaction_Shifter.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("OSA")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("osauser", uname_get);
			    	request.getRequestDispatcher("OsaTransactions.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("Shifter")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("shifteruser", uname_get);
			    	request.getRequestDispatcher("Shifter-Shifting.jsp")
			    	.forward(request, response);
			    }
			    else if(login.getType().equals("Transferee")) {
			    	 login.insertLogs(conn);
			    	session.setAttribute("setuser", uname_get);
			    	request.getRequestDispatcher("Transfer-Transferring.jsp")
			    	.forward(request, response);
			    }
			    else{
				request.getRequestDispatcher("login.jsp").include(request, response);
				out.print("<script>alert('Invalid Credentials!');</script>");
			    }
              }
             else if(login.getStatus().equals("disabled")) {
            	  request.getRequestDispatcher("login.jsp").include(request, response);
  				out.print("<script>alert('This user has been deactivated. Please contact the administrator');</script>");
                }
              }
			}
			else {
				request.getRequestDispatcher("login.jsp").include(request, response);
				out.print("<script>alert('Invalid Credentials!');</script>");
			}
		  
	       
	}

}
