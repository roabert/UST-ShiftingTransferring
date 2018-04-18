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
import ust.registrar.model.secgen.OSGVerifyDAO;


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
		String getstudentid = request.getParameter("studentid");
		String getosgname = request.getParameter("getuser");
		String remarks = request.getParameter("remarks");
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
		}
		else if(getButton.equals("Disapproved")){
			verified = "Dispproved";
			osg.setRemarks(remarks);
		    osg.setApproved(verified);
	    osg.dontverifyStudent(conn);
		}
		
		osg.insertLogs(conn);
		
		//out.println(getstudentid + getosgname + remarks);
		request.getRequestDispatcher("OsgTransaction_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
