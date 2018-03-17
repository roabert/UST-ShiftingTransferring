package ust.registrar.controller;

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
import ust.registrar.model.ofad.SetExamScheduleDAO;

/**
 * Servlet implementation class CreateScheduleProcess
 */
@WebServlet("/CreateScheduleProcess")
public class CreateScheduleProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateScheduleProcess() {
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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String getshifters[] = request.getParameterValues("selectshifters");
		String gettransfers[] = request.getParameterValues("selectstransferees");
		String getexamdate = request.getParameter("examdate");
		String getstarttime = request.getParameter("starttime");
		String getendtime = request.getParameter("endttime");
		String getvenue = request.getParameter("venueexam");
		String remarks = request.getParameter("exam_remarks");
		
		SetExamScheduleDAO set = new SetExamScheduleDAO();
		 
	for(int i = 0; i < getshifters.length; i ++) {
			set.setShifterid(getshifters[i]);
			set.setExamdate(getexamdate);
			set.setStart(getstarttime);
			set.setEnd(getendtime);
			set.setRemarks(remarks);
			set.doSetExam(conn);
			
		}
		  
	/**    for(int i = 0; i < gettransfers.length; i ++) {
					set.setTransferid(gettransfers[i]);
					set.setExamdate(getexamdate);
					set.setStart(getstarttime);
					set.setEnd(getendtime);
					set.setRemarks(remarks);
					set.doSetExam2(conn);
					
		} */
		request.getRequestDispatcher("OfadExamScheduler.jsp").include(request, response);
		out.print("<script>alert('Exam Schedule: "+getexamdate+"');</script>");
		
	}

}
