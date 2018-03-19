package ust.registrar.controller;

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
import ust.registrar.model.ofad.OFADVerifyTransferDAO;

/**
 * Servlet implementation class Ofad_verifyTransfer
 */
@WebServlet("/Ofad_verifyTransfer")
public class Ofad_verifyTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ofad_verifyTransfer() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServl	etResponse response)
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
		String gettransferid = request.getParameter("getstudent");
		String getofadid = request.getParameter("getuser");
		String getremarks = request.getParameter("remarks");
		
		OFADVerifyTransferDAO ofad = new OFADVerifyTransferDAO();
		ofad.setOfadid(getofadid);
		ofad.setRemarks(getremarks);
		ofad.setTransferid(gettransferid);
		
		if(getremarks.equals("Approved")) 
		ofad.doVerifyStudent(conn);
		else if(getremarks.equals("Disapproved"))
		ofad.dontverifyOfad(conn);
         
		request.getRequestDispatcher("OfadTransaction_Transfer.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
