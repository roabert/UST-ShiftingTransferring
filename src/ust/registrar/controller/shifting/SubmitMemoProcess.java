package ust.registrar.controller.shifting;

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
import ust.registrar.model.shifting.ShifterMemoDAO;

/**
 * Servlet implementation class SubmitMemoProcess
 */
@WebServlet("/SubmitMemoProcess")
public class SubmitMemoProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitMemoProcess() {
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
		String getdate = request.getParameter("date");
		String getfullname = request.getParameter("fullname");
		String getnewcourse = request.getParameter("newcourse");
		String getsemester = request.getParameter("semester");
		int get1year = Integer.parseInt(request.getParameter("firstyear"));
		int get2year = Integer.parseInt(request.getParameter("secondyear"));
		String getcurrentcourse = request.getParameter("currentcourse");
		String getfirstterm = request.getParameter("firstterm");
		int getfirst1year = Integer.parseInt(request.getParameter("firstterm_1year"));
		int getfirst2year = Integer.parseInt(request.getParameter("firstterm_2year"));
		String getsecondterm = request.getParameter("secondterm");
		int getsecond1year = Integer.parseInt(request.getParameter("secondterm_1year"));
		int getsecond2year = Integer.parseInt(request.getParameter("secondterm_2year"));
		String getthirdterm = request.getParameter("thirdterm");
		int getthird1year = Integer.parseInt(request.getParameter("thirdterm_1year"));
		int getthird2year = Integer.parseInt(request.getParameter("thirdterm_2year"));
		String getfourthterm = request.getParameter("fourthterm");
		int getfourth1year = Integer.parseInt(request.getParameter("fourthterm_1year"));
		int getfourth2year = Integer.parseInt(request.getParameter("fourthterm_2year"));
		String getspecial1 = request.getParameter("specialterm_1");
		String getspecial2 = request.getParameter("specialterm_2");
		String getspecial3 = request.getParameter("specialterm_3");
		String getspecial4 = request.getParameter("specialterm_4");
		
		ShifterMemoDAO s = new ShifterMemoDAO();
		s.setStudentid(getstudentid);
		s.setDate(getdate);
		s.setFullname(getfullname);
		s.setNewcourse(getnewcourse);
		s.setSemester(getsemester);
		s.setFirstyear(get1year);
		s.setSecondyear(get2year);
		s.setCurrentcourse(getcurrentcourse);
		s.setFirstterm(getfirstterm);
		s.setFirstterm_1year(getfirst1year);
		s.setFirstterm_2year(getfirst2year);
		s.setSpecialterm_1(getspecial1);
		s.setSecondterm(getsecondterm);
		s.setSecondterm_1year(getsecond1year);
		s.setSecondterm_2year(getsecond2year);
		s.setSpecialterm_2(getspecial2);
		s.setThirdterm(getthirdterm);
		s.setThirdterm_1year(getthird1year);
		s.setThirdterm_2year(getthird2year);
		s.setSpecialterm_3(getspecial3);
		s.setFourthterm(getfourthterm);
		s.setFourthterm_1year(getfourth1year);
		s.setFourthterm_2year(getfourth2year);
		s.setSpecialterm_4(getspecial4);
		s.doStep3Indorsed(conn);
		
		response.sendRedirect("Shifter-MemoDone.jsp");
	}

}
