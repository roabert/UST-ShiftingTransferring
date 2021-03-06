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
import ust.registrar.model.admin.AddCoursesDAO;

/**
 * Servlet implementation class AddCourses
 */
@WebServlet("/AddCourses")
public class AddCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourses() {
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
		String getcourse = request.getParameter("newcourses");
		String getfaculty = request.getParameter("getfaculty");
		
		String event = "Courses Addition";
		String description = "A new course " + getcourse + " has been added to the "+getfaculty;
		
		AddCoursesDAO add = new AddCoursesDAO();
		add.setAdmin(getadmin);
		add.setEvent(event);
		add.setDescription(description);
		add.setCourses(getcourse);
		add.setFaculty(getfaculty);
		add.addCourses(conn);
		add.insertLogs(conn);
		request.getRequestDispatcher("AdminCourses.jsp").include(request, response);
		out.print("<script>alert('New course has been added!')</script>");
	}

}
