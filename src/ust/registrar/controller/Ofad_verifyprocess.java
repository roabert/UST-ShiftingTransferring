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
		String getstudentid = request.getParameter("studentid");
		String getofadid = request.getParameter("getuser");
		String getButton = request.getParameter("optionverify");
		String getremarks = request.getParameter("remarks");
	    String verified;
	    
		OFADVerifyDAO ofad = new OFADVerifyDAO();
		ofad.setOfadid(getofadid);
	
		ofad.setStudentid(getstudentid);
		if(getButton.equals("Approved")){
		verified = "Approved";
		ofad.setApproved(verified);
		ofad.doVerifyStudent(conn);
		}
		else if(getButton.equals("Disapproved")) {
			verified = "Approved";
			ofad.setApproved(verified);
			ofad.setRemarks(getremarks);
		ofad.dontverifyOfad(conn);
		}
         
		request.getRequestDispatcher("OfadTransaction_Shifter.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
	}

}
