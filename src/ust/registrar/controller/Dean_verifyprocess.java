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
import ust.registrar.model.dean.DeanVerifyDAO;


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
		
		String getstudentid = request.getParameter("studentid");
		String getdeanname = request.getParameter("getuser");
		String remarks = request.getParameter("remarks");
		
		
		DeanVerifyDAO d = new DeanVerifyDAO();
		d.setDeanname(getdeanname);
		d.setApproved(remarks);
		d.setStudentid(getstudentid);
		d.verifyStudent(conn);
		
		
		response.sendRedirect("DeanTransaction.jsp");
		
		
	}

}
