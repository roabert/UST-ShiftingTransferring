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
import ust.registrar.model.osa.OSAVerifyDAO;

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
		String gettransferid = request.getParameter("getstudent");
		String getosaid = request.getParameter("getuser");
		String getremarks = request.getParameter("remarks");
		
		OSAVerifyDAO osa = new OSAVerifyDAO();
		osa.setUserid(getosaid);
		osa.setRemarks(getremarks);
		osa.setTransferid(gettransferid);
		
		if(getremarks.equals("Approved"))
			osa.verifyStudent(conn);
		else if(getremarks.equals("Disapproved"))
			osa.dontverifyStudent(conn);
		
		request.getRequestDispatcher("OsaTransactions.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}