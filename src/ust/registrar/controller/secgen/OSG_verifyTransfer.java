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
import ust.registrar.model.secgen.OSGVerifyTransferDAO;
import ust.registrar.utility.NotifSender;

/**
 * Servlet implementation class OSG_verifyTransfer
 */
@WebServlet("/OSG_verifyTransfer")
public class OSG_verifyTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    Connection conn = null;
    public OSG_verifyTransfer() {
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
		PrintWriter out = response.getWriter();
		NotifSender notif = new NotifSender();
		LogTransactionsDAO logs = new LogTransactionsDAO();
		String gettransferid = request.getParameter("transferid");
		String getosgname = request.getParameter("getuser");
		String getButton = request.getParameter("optionverify");
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
		String verified;
		
		String event = "Requirements Approval";
		String description = "Checking the requirements of "+gettransferid+"";
		
		OSGVerifyTransferDAO osg = new OSGVerifyTransferDAO();
		osg.setSecgenid(getosgname);
		osg.setTransferid(gettransferid);
		osg.setEvent(event);
		osg.setDescription(description);
		
		if(getButton.equals("Approved")){
		verified = "Approved";
		osg.setApproved(verified);
		osg.verifyStudent(conn);
		notif.sendNotif(gettransferid);
		logs.insertLogs(conn, gettransferid, getosgname, "osg");
		}
		else if(getButton.equals("Disapproved")) {
			verified = "Disapproved";
			osg.setApproved(verified);
			osg.setRemarks(remarks);
	    osg.dontverifyStudent(conn);
	    notif.sendNotif(gettransferid);
	    logs.insertBadLogs(conn, gettransferid, getosgname, "osg");
		}
		osg.insertLogs(conn);
		//out.println(getstudentid + getosgname + remarks);
		request.getRequestDispatcher("OsgTransaction_Transfer.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
		
	}

}
