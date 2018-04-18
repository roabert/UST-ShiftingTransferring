package ust.registrar.controller.shifting;

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
import ust.registrar.model.shifting.RetryShiftingDAO;

/**
 * Servlet implementation class RetryShifting
 */
@WebServlet("/RetryShifting")
public class RetryShifting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetryShifting() {
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
		String getstudentid = request.getParameter("getuser_retry");
		String event = "Re-requirements submission";
		String description = "Student has reset his/her process and will try again to submit requirements";
		RetryShiftingDAO r = new RetryShiftingDAO();
		r.setEvent(event);
		r.setDescription(description);
		r.setStudentid(getstudentid);
		r.RetryProcess(conn);
		r.insertLogs(conn);
		request.getRequestDispatcher("Shifter-Shifting.jsp").include(request, response);
		out.print("<script>alert('You may now retry your application for shifting.');</script>");
	}

}
