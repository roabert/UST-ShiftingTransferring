package ust.registrar.controller.ofad;

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
import ust.registrar.model.ofad.OFADVerifyDAO;
import ust.registrar.model.registrar.LogTransactionsDAO;
import ust.registrar.utility.NotifSender;

/**
 * Servlet implementation class Ofad_verifyprocess
 */
@WebServlet("/Ofad_verifyprocess")
public class Ofad_verifyprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
	
    public Ofad_verifyprocess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		conn = SingletonDB.getConnection();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
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
		String getofadid = request.getParameter("getuser");
		String getButton = request.getParameter("optionverify");
		String getremarks = request.getParameter("remarks");
		if(request.getParameter("otr")!=null){
			getremarks = getremarks+"<br> OTR Invalid";
		}
		if(request.getParameter("letterdean")!=null){
			getremarks = getremarks+"<br> Letter of Intent to the Dean Invalid";
		}
		if(request.getParameter("letterguide")!=null){
			getremarks = getremarks+"<br> Letter of Intent to the Guidance Invalid";
		}
		if(request.getParameter("good")!=null){
			getremarks = getremarks+"<br> Certificate of Good Moral Invalid";
		}
		if(request.getParameter("studid")!=null){
			getremarks = getremarks+"<br> Student ID Invalid";
		}
	    String verified;
	    
	    String event = "Requirements Approval";
	    String description = "Checking the requirements of "+getstudentid;
	    
		OFADVerifyDAO ofad = new OFADVerifyDAO();
		ofad.setOfadid(getofadid);
	    ofad.setEvent(event);
	    ofad.setDescription(description);
		ofad.setStudentid(getstudentid);
		if(getButton.equals("Approved")){
		verified = "Approved";
		ofad.setApproved(verified);
		ofad.doVerifyStudent(conn);
		notif.sendNotif(getstudentid);
		logs.insertLogs(conn, getstudentid, getofadid, "ofad");
		}
		else if(getButton.equals("Disapproved")) {
			verified = "Disapproved";
			ofad.setApproved(verified);
			ofad.setRemarks(getremarks);
		ofad.dontverifyOfad(conn);
		notif.sendNotif(getstudentid);
		logs.insertBadLogs(conn, getstudentid, getofadid, "ofad");
		}
        ofad.insertLogs(conn); 
		request.getRequestDispatcher("OfadTransaction_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
