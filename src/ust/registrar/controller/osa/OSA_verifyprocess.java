package ust.registrar.controller.osa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.osa.OSAVerifyDAO;
import ust.registrar.utility.NotifSender;

/**
 * Servlet implementation class OSA_verifyprocess
 */
@WebServlet("/OSA_verifyprocess")
public class OSA_verifyprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public OSA_verifyprocess() {
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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		NotifSender notif = new NotifSender();
		String gettransferid = request.getParameter("transferid");
		String getosaid = request.getParameter("getuser");
		String getremarks = request.getParameter("remarks");
		String getButton = request.getParameter("optionverify");
		String verified;
		
		String event = "Requirements Approval";
		String description = "Checking the requirements of "+gettransferid+"";
		
		OSAVerifyDAO osa = new OSAVerifyDAO();
		osa.setUserid(getosaid);
		osa.setEvent(event);
		osa.setDescription(description);

		osa.setTransferid(gettransferid);
		
		if(getButton.equals("Approved")){
			verified="Approved";
			osa.setApproved(verified);
			osa.verifyStudent(conn);
			notif.sendNotif(gettransferid);
			
		}
		else if(getButton.equals("Disapproved")){
			verified = "Disapproved";
			osa.setApproved(verified);
			osa.setRemarks(getremarks);
			osa.dontverifyStudent(conn);
			notif.sendNotif(gettransferid);
		}
		
		osa.insertLogs(conn);
		
		request.getRequestDispatcher("OsaTransactions.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
