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
import ust.registrar.model.dean.DeanVerifyDAO;
import ust.registrar.model.dean.DeanVerifyTransferDAO;
import ust.registrar.model.registrar.LogTransactionsDAO;
import ust.registrar.utility.NotifSender;

/**
 * Servlet implementation class Dean_verifyTransfer
 */
@WebServlet("/Dean_verifyTransfer")
public class Dean_verifyTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dean_verifyTransfer() {
        super();
        // TODO Auto-generated constructor stub
    }
    Connection conn = null;

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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		NotifSender notif = new NotifSender();
		LogTransactionsDAO logs = new LogTransactionsDAO();
		String gettransferid = request.getParameter("transferid");
		String getdeanid = request.getParameter("getuser");
		String getButton = request.getParameter("optionverify");
		String verified;
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
		
		String event = "Requirements Approval";
		String description = "Checking the requirements of "+gettransferid+"";
		 
		DeanVerifyTransferDAO d = new DeanVerifyTransferDAO();
		d.setDeanid(getdeanid);
		d.setEvent(event);
		d.setDescription(description);
		d.setTransferid(gettransferid);
		
	    if(getButton.equals("Approved")) {
	    verified="Approved";
	    d.setApproved(verified);
		d.verifyStudent(conn);
		notif.sendNotif(gettransferid);
		logs.insertLogs(conn, gettransferid, getdeanid, "dean");
	    }
	    else if(getButton.equals("Disapproved")) {
	    	verified = "Disapproved";
	    	d.setApproved(verified);
	    	d.setRemarks(remarks);
		d.dontverifyStudent(conn);
		notif.sendNotif(gettransferid);
		logs.insertBadLogs(conn, gettransferid, getdeanid, "dean");
	    }
	    
	    d.insertLogs(conn);
	    
		request.getRequestDispatcher("DeanTransaction_Transfer.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	
	}

}
