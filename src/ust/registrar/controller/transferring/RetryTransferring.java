package ust.registrar.controller.transferring;

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
import ust.registrar.model.transferring.RetryTransferringDAO;

/**
 * Servlet implementation class RetryTransferring
 */
@WebServlet("/RetryTransferring")
public class RetryTransferring extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetryTransferring() {
        super();
        // TODO Auto-generated constructor stub
    }
    Connection conn = null;
    public void init(ServletConfig config) throws ServletException {
    	conn = SingletonDB.getConnection();
    }
	/**
	 * 
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
		String gettransferid = request.getParameter("getuser_retry");
		
		RetryTransferringDAO r = new RetryTransferringDAO();
		r.setTransferid(gettransferid);
		r.RetryProcess(conn);
		
		request.getRequestDispatcher("Transfer-Transferring.jsp").include(request, response);
		out.print("<script>alert('You may now retry your application for shifting.');</script>");
	}

}
