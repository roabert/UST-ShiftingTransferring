package ust.registrar.controller;

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
import ust.registrar.model.secgen.OSGVerifyTransferDAO;

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
		String gettransferid = request.getParameter("getstudent");
		String getosgname = request.getParameter("getuser");
		String remarks = request.getParameter("remarks");
		
		OSGVerifyTransferDAO osg = new OSGVerifyTransferDAO();
		osg.setSecgenid(getosgname);
		osg.setRemarks(remarks);
		osg.setTransferid(gettransferid);
		
		if(remarks.equals("Approved"))
		osg.verifyStudent(conn);
		else if(remarks.equals("Disapproved"))
	    osg.dontverifyStudent(conn);
		
		//out.println(getstudentid + getosgname + remarks);
		request.getRequestDispatcher("OsgTransaction_Transfer.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
		
	}

}
