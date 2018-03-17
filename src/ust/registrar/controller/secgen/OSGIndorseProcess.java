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
import ust.registrar.model.secgen.OSGIndorseStudentDAO;

/**
 * Servlet implementation class OSGIndorseProcess
 */
@WebServlet("/OSGIndorseProcess")
public class OSGIndorseProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OSGIndorseProcess() {
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
	
        String getstudentid = request.getParameter("getstudent");
        String getsecgen = request.getParameter("getuser");
        
        OSGIndorseStudentDAO o = new OSGIndorseStudentDAO();
        o.setSecgen(getsecgen);
        o.setStudentid(getstudentid);
        o.indorseStudent(conn);
        
        request.getRequestDispatcher("OsgEndorse_Shifter.jsp").include(request, response);
        out.print("<script>alert('Memo of "+getstudentid+" forwarded!')</script>");
	}

}
