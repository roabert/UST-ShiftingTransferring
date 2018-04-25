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
import ust.registrar.model.admin.SchoolYearDAO;

/**
 * Servlet implementation class AddCourses
 */
@WebServlet("/SetSchoolYear")
public class SetSchoolYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetSchoolYear() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    Connection conn = null;
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
		String getadmin = request.getParameter("getadmin");
		
		String event = "School Year Modification";
		String description = "Ended current School Year";
		
		SchoolYearDAO add = new SchoolYearDAO();
		add.setAdmin(getadmin);
		add.setEvent(event);
		add.setDescription(description);
		add.setSchoolYear(conn);
		add.insertLogs(conn);
		request.getRequestDispatcher("AdminsStudent_Shifter.jsp").include(request, response);
		out.print("<script>alert('School Year has ended. New School Year started.')</script>");
	}

}
