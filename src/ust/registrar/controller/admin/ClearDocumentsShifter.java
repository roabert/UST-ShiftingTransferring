package ust.registrar.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.admin.ClearDocumentsDAO;

/**
 * Servlet implementation class ClearDocumentsShifter
 */
@WebServlet("/ClearDocumentsShifter")
public class ClearDocumentsShifter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public ClearDocumentsShifter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void init() throws ServletException {
  	   conn = SingletonDB.getConnection();
 	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		String getStatus = request.getParameter("status");
		String getID = request.getParameter("id");
		
		ClearDocumentsDAO c = new ClearDocumentsDAO();
		c.clearShifterDocus(conn, getID, getStatus);

		request.getRequestDispatcher("AdminsStudent_Shifter.jsp").include(request, response);
		out.print("<script>alert('Cleared!');</script>"); 
	}

}
