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
import ust.registrar.model.dean.DeanExamStatusShifterDAO;
import ust.registrar.model.dean.DeanExamStatusTransferDAO;

/**
 * Servlet implementation class DeanVerifyScoreTransfer
 */
@WebServlet("/DeanVerifyScoreTransfer")
public class DeanVerifyScoreTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeanVerifyScoreTransfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    Connection conn = null;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		conn = SingletonDB.getConnection();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String getstudent = request.getParameter("getstudent");
		String getdeanid = request.getParameter("getuser");
		String getstatus = request.getParameter("studentstatus");
		
		DeanExamStatusTransferDAO d = new DeanExamStatusTransferDAO();
		d.setDeanid(getdeanid);
		d.setStatus(getstatus);
		d.setTransferid(getstudent);
		
		if(getstatus.equals("Approved")) {
			d.doPassStudent(conn);
		}
		else if(getstatus.equals("Disapproved")) {
			d.doFailStudent(conn);
		}
		
		request.getRequestDispatcher("DeanExam_Transfer.jsp").include(request, response);
		out.print("<script>alert('Submitted!');</script>");
		
	}

}
