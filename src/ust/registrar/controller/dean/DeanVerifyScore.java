package ust.registrar.controller.dean;

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
import ust.registrar.model.dean.DeanExamStatusShifterDAO;
import ust.registrar.utility.NotifSender;
import ust.registrar.model.registrar.LogTransactionsDAO;

/**
 * Servlet implementation class DeanVerifyScore
 */
@WebServlet("/DeanVerifyScore")
public class DeanVerifyScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeanVerifyScore() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		NotifSender notif = new NotifSender();
		LogTransactionsDAO logs = new LogTransactionsDAO();
		String getstudent = request.getParameter("getstudent");
		String getdeanid = request.getParameter("getuser");
		String getstatus = request.getParameter("studentstatus");
		String getremarks = request.getParameter("remarks");
		String event = "Exam results approval";
		String description = "The exam result of "+getstudent+" has been determined";
		DeanExamStatusShifterDAO d = new DeanExamStatusShifterDAO();
		d.setEvent(event);
		d.setDescription(description);
		d.setDeanid(getdeanid);
		d.setStatus(getstatus);
		d.setStudentid(getstudent);
		d.setRemarks(getremarks);
		if(getstatus.equals("Approved")) {
			d.doPassStudent(conn);
			notif.sendNotif(getstudent);
		}
		else if(getstatus.equals("Disapproved")) {
			d.doFailStudent(conn);
			notif.sendNotif(getstudent);
			logs.insertVeryBadLogs(conn, getstudent, getdeanid);
		}
		d.insertLogs(conn);
		request.getRequestDispatcher("DeanExam_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
