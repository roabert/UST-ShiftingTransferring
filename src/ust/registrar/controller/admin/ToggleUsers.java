package ust.registrar.controller.admin;

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
import ust.registrar.model.admin.AccountStatus;

/**
 * Servlet implementation class ToggleUsers
 */
@WebServlet("/ToggleUsers")
public class ToggleUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToggleUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */Connection conn = null;
	public void init(ServletConfig config) throws ServletException {
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
		// TODO Auto-generated method stub
	    PrintWriter out = response.getWriter();
		String getuser = request.getParameter("getusers");
	    String getadmin = request.getParameter("adminuser");
	    
	    String event = "Toggling Users";
	    String description;
		AccountStatus a = new AccountStatus();
		a.setUserid(getuser);
	    a.setAdmin(getadmin);
	    a.setEvent(event);
	    a.checkStatusAccount(conn); 
	    
	   if(a.getStatus() != null) {
	    if(a.getStatus().equals("disabled")) {
	    	description = "The user "+getuser+" has been activated";
	    	a.setDescription(description);
	    	a.activateAccount(conn);
	    }
	    else if(a.getStatus().equals("active")) {
	    	description = "The user "+getuser+" has been deactivated";
	    	a.setDescription(description);
	    	a.disableAccount(conn);
	    }
	   }
	    a.insertLogs(conn);
	    request.getRequestDispatcher("AdminsAccount.jsp").include(request, response);
	   
	    
		
	}

}
