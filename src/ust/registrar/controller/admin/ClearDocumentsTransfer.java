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
 * Servlet implementation class ClearDocuments
 */
@WebServlet("/ClearDocumentsTransfer")
public class ClearDocumentsTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
    public ClearDocumentsTransfer() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() throws ServletException {
 	   conn = SingletonDB.getConnection();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String getStatus = request.getParameter("status");
		String getID = request.getParameter("id");
		
		ClearDocumentsDAO c = new ClearDocumentsDAO();
		c.clearTransferDocus(conn, getID, getStatus);

		request.getRequestDispatcher("AdminsStudent_Transfer.jsp").include(request, response);
		out.print("<script>alert('Cleared!');</script>"); 
	}

}
