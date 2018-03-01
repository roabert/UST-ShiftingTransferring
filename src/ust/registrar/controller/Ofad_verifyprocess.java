package ust.registrar.controller;

import java.io.IOException;
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
		String getstudentid = request.getParameter("studentid");
		String getofadid = request.getParameter("getuser");
		String getremarks = request.getParameter("remarks");
		
		OFADVerifyDAO ofad = new OFADVerifyDAO();
		ofad.setOfadid(getofadid);
		ofad.setRemarks(getremarks);
		ofad.setStudentid(getstudentid);
		
		ofad.verifyOfad(conn);
         
		response.sendRedirect("OfadTransaction_Shifter.jsp");
	}

}