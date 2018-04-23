package ust.registrar.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.admin.CreateUsersDAO;

/**
 * Servlet implementation class AdminCreateUsers
 */
@WebServlet("/AdminCreateUsers")
public class AdminCreateUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public AdminCreateUsers() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String getadmin = request.getParameter("getadmin");
		String getuserid = request.getParameter("new_userid");
		String getpassword = request.getParameter("new_password");
		String getemail = request.getParameter("new_email");
		String getlname = request.getParameter("new_lname");
		String getfname = request.getParameter("new_fname");
		String getmname = request.getParameter("new_mname");
		String gettype = request.getParameter("new_type");
		String getcollege = request.getParameter("new_college");
	
		String event = "Registering user accounts";
		String description = "Account of a/an "+gettype+" has been created";
		
		CreateUsersDAO user = new CreateUsersDAO();
		user.setAdmin(getadmin);
		user.setEvent(event);
		user.setDescription(description);
		user.setUserid(getuserid);
		user.setPassword(getpassword);
		user.setEmail(getemail);
		user.setType(gettype);
		user.checkUserandEmail(conn);
	if(!(getemail.equals(user.getGetemail())) && !(getuserid.equals(user.getGetuser())) ) {
		user.insertUseraccounts(conn);
		if(gettype.equals("Admin")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail);
		     user.setType(gettype);
		     user.Admin_insertDetails(conn);
		     
		}
		else if(gettype.equals("OFAD")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail); 
		     user.setType(gettype);
		     user.Ofad_insertDetails(conn);
		     
		}
		else if(gettype.equals("OSG")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail); 
		     user.setType(gettype);
		     user.OSG_insertDetails(conn);
		     
		}
		else if(gettype.equals("Dean")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail);
		     user.setCollege(getcollege);
		     user.setType(gettype);
		     user.Dean_insertDetails(conn);
		     
		}
		else if(gettype.equals("OSA")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail);
		     user.setType(gettype);
		     user.OSA_insertDetails(conn);
		     
		}
		else if(gettype.equals("Registrar")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		     user.setEmail(getemail);
		     user.setType(gettype);
		     user.Registrar_insertDetails(conn);
		     
		}
		user.insertLogs(conn);
		request.getRequestDispatcher("AdminsAccount.jsp").include(request, response);
		out.print("<script>alert('Account Created!');</script>");
	  }
	else {
		request.getRequestDispatcher("AdminsAccount.jsp").include(request, response);
		out.print("<script>alert('Email/Username is already taken!');</script>");
		out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('.createusers').modal('show');  });</script>");
		
	}
	}

}
