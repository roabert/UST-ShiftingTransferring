package ust.registrar.controller;

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
		String getuserid = request.getParameter("new_userid");
		String getpassword = request.getParameter("new_password");
		String getemail = request.getParameter("new_email");
		String getlname = request.getParameter("new_lname");
		String getfname = request.getParameter("new_fname");
		String getmname = request.getParameter("new_mname");
		String gettype = request.getParameter("new_type");
		String getcollege = request.getParameter("new_college");
		
		CreateUsersDAO user = new CreateUsersDAO();
		user.setUserid(getuserid);
		user.setPassword(getpassword);
		user.setType(gettype);
		user.insertUseraccounts(conn);
		if(gettype.contains("Admin")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setType(gettype);
		     user.Admin_insertDetails(conn);
		}
		else if(gettype.contains("OFAD")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setType(gettype);
		     user.Ofad_insertDetails(conn);
		}
		else if(gettype.contains("OSG")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setType(gettype);
		     user.OSG_insertDetails(conn);
		}
		else if(gettype.contains("Dean")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setCollege(getcollege);
		     user.setType(gettype);
		     user.Dean_insertDetails(conn);
		}
		else if(gettype.contains("OSA")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setType(gettype);
		     user.OSA_insertDetails(conn);
		}
		else if(gettype.contains("Registrar")) {
		     user.setUserid(getuserid);
		     user.setLname(getlname);
		     user.setFname(getfname);
		     user.setMnname(getmname);
		      
		     user.setType(gettype);
		     user.Registrar_insertDetails(conn);
		}
		
		request.getRequestDispatcher("AdminsAccount.jsp").include(request, response);
		out.print("<script>alert('Creation Successful!');</script>");
	}

}
