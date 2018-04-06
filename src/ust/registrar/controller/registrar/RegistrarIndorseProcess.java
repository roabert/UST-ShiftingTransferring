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
import ust.registrar.model.registrar.*;

/**
 * Servlet implementation class DeanIndorseProcess
 */
@WebServlet("/RegistrarIndorseProcess")
public class RegistrarIndorseProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarIndorseProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */Connection conn = null;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String getstudentid = request.getParameter("studentid");
		String getdeanid = request.getParameter("getuser");
		String getremarks = request.getParameter("endorsement");
		String ifchecked = request.getParameter("approval");
		String getbutton = request.getParameter("endorse");
		
		RegistrarIndorseDAO d = new RegistrarIndorseDAO();
		d.setRegistrar(getdeanid);
		d.setStudentid(getstudentid);
		d.setEndorsement(getremarks);
		

	 if(getbutton.equals("endorsewithremarks")) {
		if(ifchecked != null){
		d.registrarIndorsed(conn);
		 request.getRequestDispatcher("RegistrarEndorse_Shifter.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+getstudentid+" forwarded!');</script>");
		}
		else {
		d.registrarNotIndorsed(conn);
		 request.getRequestDispatcher("RegistrarEndorse_Shifter.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+getstudentid+" was rejected!');</script>");
		}
	 }
	 else if(getbutton.equals("endorsenow")) {
		 d.registrarIndorsed(conn);
		 request.getRequestDispatcher("RegistrarEndorse_Shifter.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+getstudentid+" forwarded!');</script>");
	 }
	
		
	}

}
