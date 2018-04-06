package ust.registrar.controller.secgen;

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
import ust.registrar.model.secgen.OSGIndorseTransfereeDAO;

/**
 * Servlet implementation class OSGIndorseTransferProcess
 */
@WebServlet("/OSGIndorseTransferProcess")
public class OSGIndorseTransferProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OSGIndorseTransferProcess() {
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
		
        String gettransferid = request.getParameter("transferid");
        String getsecgen = request.getParameter("getuser");
        String getremarks = request.getParameter("endorsement");
        String getapproval = request.getParameter("approval");
        String getbutton = request.getParameter("endorse");
        
        OSGIndorseTransfereeDAO o = new OSGIndorseTransfereeDAO();
        o.setSecgen(getsecgen);
        o.setTransferid(gettransferid);
        o.setRemarks(getremarks);
       if(getbutton.equals("endorsewithremarks")) {
        if(getapproval != null) {
        o.approveTransfer(conn);
        request.getRequestDispatcher("OsgEndorse_Transfer.jsp").include(request, response);
        out.print("<script>alert('Memo of "+gettransferid+" approved! Student has been transferred!')</script>");
        }
        else { 
        o.dontIndorseStudent(conn);
        request.getRequestDispatcher("OsgEndorse_Transfer.jsp").include(request, response);
        out.print("<script>alert('Memo of "+gettransferid+" has been disapproved!')</script>");
        }
       }
       else if(getbutton.equals("endorsenow")) {
    	   o.approveTransfer(conn);
           request.getRequestDispatcher("OsgEndorse_Transfer.jsp").include(request, response);
           out.print("<script>alert('Memo of "+gettransferid+" approved! Student has been transferred!')</script>");
    	   
       }
	}

}
