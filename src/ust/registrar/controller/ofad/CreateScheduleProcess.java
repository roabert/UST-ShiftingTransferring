package ust.registrar.controller.ofad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.ParseException;

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
		String getofad = request.getParameter("getofadid");
		String getshifters[] = request.getParameterValues("selectshifters");
		String gettransfers[] = request.getParameterValues("selectstransferees");
		String getexamdate = request.getParameter("examdate");
		String getstarttime = request.getParameter("starttime");
		String getendtime = request.getParameter("endttime");
		String getvenue = request.getParameter("venueexam");
		String remarks = request.getParameter("exam_remarks");
		String status = "";
		
		String event = "Exam Scheduling";
		String description = "Exam date, time and venue has been settled for shifters";
		SetExamScheduleDAO set = new SetExamScheduleDAO();
		  set.setUserid(getofad);
		  set.setEvent(event);
		  set.setDescription(description);
		
		  set.checkVenue(conn);
	        set.setVenue(getvenue);
	     
   if(!(getstarttime.equals(set.getGetstart())) && !(getendtime.equals(set.getGetend())) ) {		
	for(int i = 0; i < getshifters.length; i ++) {
			set.setShifterid(getshifters[i]);
			set.setExamdate(getexamdate);
			set.setStart(getstarttime);
			set.setVenue(getvenue);
			set.setEnd(getendtime);
			set.setRemarks(remarks);
			try {
				status = set.checkAvailability(conn);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (status.equals("NA")){
				
			}
			else{
				set.doSetExam(conn);
			}
			
		}

	if (status.equals("NA")){
		request.getRequestDispatcher("OfadExamScheduler.jsp").include(request, response);
		out.print("<script>alert('There are conflicts in the schedule, please select other time or place for the exam.');</script>");
	}
	else{
		set.insertLogs(conn);
		request.getRequestDispatcher("OfadExamScheduler.jsp").include(request, response);
		out.print("<script>alert('Exam Schedule: "+getexamdate+"');</script>");
	}
	}
   else {
  	 request.getRequestDispatcher("OfadExamScheduler.jsp").include(request, response);
  	 out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('.createsched').modal('show');  });</script>");
			out.print("<script>alert('There are conflicts in the schedule, please select other time or place for the exam.');</script>");
	}

  }
}
