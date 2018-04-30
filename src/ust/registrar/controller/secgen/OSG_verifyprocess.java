package ust.registrar.controller.secgen;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.registrar.LogTransactionsDAO;
import ust.registrar.model.secgen.OSGVerifyDAO;
import ust.registrar.utility.NotifSender;


/**
 * Servlet implementation class OSG_verifyprocess
 */
@WebServlet("/OSG_verifyprocess")
public class OSG_verifyprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public OSG_verifyprocess() {
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
		NotifSender notif = new NotifSender();
		LogTransactionsDAO logs = new LogTransactionsDAO();
		String getstudentid = request.getParameter("studentid");
		String getosgname = request.getParameter("getuser");
		String remarks = request.getParameter("remarks");
		if(request.getParameter("otr")!=null){
			remarks = remarks+"<br> OTR Invalid";
		}
		if(request.getParameter("letterdean")!=null){
			remarks = remarks+"<br> Letter of Intent to the Dean Invalid";
		}
		if(request.getParameter("letterguide")!=null){
			remarks = remarks+"<br> Letter of Intent to the Guidance Invalid";
		}
		if(request.getParameter("good")!=null){
			remarks = remarks+"<br> Certificate of Good Moral Invalid";
		}
		if(request.getParameter("studid")!=null){
			remarks = remarks+"<br> Student ID Invalid";
		}
		String getButton = request.getParameter("optionverify");
		String verified;
		
		String event = "Requirements Approval";
		String description = "Checking the requirements of "+getstudentid+"";
		
		OSGVerifyDAO osg = new OSGVerifyDAO();
		osg.setOsgname(getosgname);
	    osg.setEvent(event);
	    osg.setDescription(description);
		osg.setStudentid(getstudentid);
		
		if(getButton.equals("Approved")){
			verified = "Approved";
	    osg.setApproved(verified);
		osg.verifyStudent(conn);
		notif.sendNotif(getstudentid);
		logs.insertLogs(conn, getstudentid, getosgname, "osg");
		}
		else if(getButton.equals("Disapproved")){
			verified = "Disapproved";
			osg.setRemarks(remarks);
		    osg.setApproved(verified);
	    osg.dontverifyStudent(conn);
	    notif.sendNotif(getstudentid);
	    logs.insertBadLogs(conn, getstudentid, getosgname, "osg");
		}
		
		osg.insertLogs(conn);
		
		//out.println(getstudentid + getosgname + remarks);
		request.getRequestDispatcher("OsgTransaction_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
