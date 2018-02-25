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
import ust.registrar.model.admin.EditUsersDAO;

/**
 * Servlet implementation class admindisplayusers
 */
@WebServlet("/AdminEditUsers")
public class AdminEditUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public AdminEditUsers() {
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
         PrintWriter out = response.getWriter();
         String getuserid = request.getParameter("useridget");
		  String getlname = request.getParameter("edit_lname");
		  String getfname = request.getParameter("edit_fname");
		  String getmname = request.getParameter("edit_mname");
		  String gettype = request.getParameter("edit_type");
		  String getcollege= request.getParameter("edit_college");
		  EditUsersDAO edit = new EditUsersDAO();
		  
		  //out.print(getuserid + getlname + getfname + getmname + gettype);
	  if(gettype.equals("Admin")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_Admin(conn);
		  }
		  else if(gettype.equals("Registrar")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_Registrar(conn);
		  }
		  else if(gettype.equals("SecGen")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_OSG(conn);
		  }
		  else if(gettype.equals("OSA")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_OSA(conn);
		  }
		  else if(gettype.equals("Dean")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_Dean(conn);
		  }
		  else if(gettype.equals("OFAD")) {
			  edit.setLname(getlname);
			  edit.setFname(getfname);
			  edit.setMname(getmname);
			  edit.setUserget(getuserid);
			  edit.modify_Ofad(conn);
		  }
		  
		  response.sendRedirect("AdminsAccount.jsp"); 
		
	}

}
