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
import ust.registrar.model.admin.CoursesDAO;

/**
 * Servlet implementation class ToggleCourses
 */
@WebServlet("/ToggleCourses")
public class ToggleCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToggleCourses() {
        super();
        // TODO Auto-generated constructor stub
    }
    
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
		String getCourse = request.getParameter("courseName");
		String getStatus = request.getParameter("status");
		CoursesDAO toggle = new CoursesDAO();
		
		if (getStatus.equals("active")){
			
			toggle.deactivateCourse(conn, getCourse);
		
			
		}else{
			
			toggle.activateCourse(conn, getCourse);
			
			
		}
		request.getRequestDispatcher("AdminCourses.jsp").forward(request, response);
		
	}

}
