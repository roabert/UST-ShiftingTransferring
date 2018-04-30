package ust.registrar.controller.dean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.dean.DeanVerifyDAO;
import ust.registrar.utility.NotifSender;
import ust.registrar.model.registrar.LogTransactionsDAO;;


/**
 * Servlet implementation class verifyprocess
 */
@WebServlet("/Dean_verifyprocess")
public class Dean_verifyprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public Dean_verifyprocess() {
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
		
		PrintWriter out  = response.getWriter();
		NotifSender notif = new NotifSender();
		LogTransactionsDAO logs = new LogTransactionsDAO();
		String getstudentid = request.getParameter("studentid");
		String getdeanname = request.getParameter("getuser");
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
		String verified;
	    String getButton = request.getParameter("optionverify");
	    
	    String event = "Requirements Approval";
	    String description = "Checking the requirements of "+getstudentid+"";
	    
		DeanVerifyDAO d = new DeanVerifyDAO();
		d.setDeanname(getdeanname);
		d.setEvent(event);
		d.setDescription(description);
		d.setStudentid(getstudentid);
		
	    if(getButton.equals("Approved")){
	    	verified = "Approved";
	    	d.setApproved(verified);
		d.verifyStudent(conn);
		notif.sendNotif(getstudentid);
		logs.insertLogs(conn, getstudentid, getdeanname, "dean");
	    }
	    else if(getButton.equals("Disapproved")){
	    	verified = "Disapproved";
	    	d.setApproved(verified);
	    	d.setRemarks(remarks);
		d.dontverifyStudent(conn);
		notif.sendNotif(getstudentid);
		logs.insertBadLogs(conn, getstudentid, getdeanname, "dean");
	    }
	    
	    d.insertLogs(conn);
	    
		request.getRequestDispatcher("DeanTransaction_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>"); 
	
		
		
	}

}
