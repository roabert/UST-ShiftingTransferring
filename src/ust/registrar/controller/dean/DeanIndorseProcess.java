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
import ust.registrar.model.dean.DeanIndorseStudentDAO;

/**
 * Servlet implementation class DeanIndorseProcess
 */
@WebServlet("/DeanIndorseProcess")
public class DeanIndorseProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeanIndorseProcess() {
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
		
		DeanIndorseStudentDAO d = new DeanIndorseStudentDAO();
		d.setDeanid(getdeanid);
		d.setStudentid(getstudentid);
		d.setIndorsement(getremarks);
		
		if(ifchecked != null){
		d.deanIndorsed(conn);
		 request.getRequestDispatcher("DeanMemo_Shifter.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+getstudentid+" forwarded!');</script>");
		}
		else {
		d.deanNotIndorsed(conn);
		 request.getRequestDispatcher("DeanMemo_Shifter.jsp")
		    .include(request, response);
		    out.print("<script>alert('Memo of "+getstudentid+" was rejected!');</script>");
		}
		
	   
	    
		
	}

}
