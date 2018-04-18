package ust.registrar.controller.registrar;

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
import ust.registrar.model.registrar.RegistrarIndorseTransferDAO;

/**
 * Servlet implementation class RegistrarIndorseTransferProcess
 */
@WebServlet("/RegistrarIndorseTransferProcess")
public class RegistrarIndorseTransferProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarIndorseTransferProcess() {
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
		String getdeanid = request.getParameter("getuser");
		String getremarks = request.getParameter("endorsement");
		String ifchecked = request.getParameter("approval");
		String getbutton = request.getParameter("endorse");
		String event = "Endorsement Approval";
		String description = "Memo request of "+gettransferid+" has been reviewed";
		RegistrarIndorseTransferDAO d = new RegistrarIndorseTransferDAO();
		d.setEvent(event);
		d.setDescription(description);
		d.setRegistrar(getdeanid);
		d.setTransferid(gettransferid);
		d.setEndorsement(getremarks);
		
     if(getbutton.equals("endorsewithremarks")) {
		if(ifchecked != null){
		d.registrarIndorsed(conn);
		d.insertLogs(conn);
		 request.getRequestDispatcher("RegistrarEndorse_Transfer.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+gettransferid+" forwarded!');</script>");
		}
		else {
		d.registrarNotIndorsed(conn);
		d.insertLogs(conn);
		 request.getRequestDispatcher("RegistrarEndorse_Transfer.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+gettransferid+" was rejected!');</script>");
		}
	  }
     else if(getbutton.equals("endorsenow")){
    		d.registrarIndorsed(conn);
    		d.insertLogs(conn);
   		 request.getRequestDispatcher("RegistrarEndorse_Transfer.jsp")
   		    .include(request, response);
   		    out.print("<script>alert('Memo of "+gettransferid+" forwarded!');</script>");
     }
	}

}
