package ust.registrar.controller.encodescores;

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
import ust.registrar.model.ofad.EncodeScoreShifterDAO;

/**
 * Servlet implementation class EncodeScoreShifter
 */
@WebServlet("/EncodeScoreShifter")
public class EncodeScoreShifter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EncodeScoreShifter() {
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
		PrintWriter out = response.getWriter();
		String getstudentid = request.getParameter("getstudent");
		String getofadid = request.getParameter("getuser");
		int getmath_score = Integer.parseInt(request.getParameter("mathscore"));
		int getscience_score = Integer.parseInt(request.getParameter("sciencescore"));
		int getenglish_score = Integer.parseInt(request.getParameter("englishscore"));
		int getiq_score = Integer.parseInt(request.getParameter("iqscore"));
		
		int getallscore = getmath_score + getscience_score + getenglish_score + getiq_score;
		int getaverage = getallscore / 4;
		
		EncodeScoreShifterDAO e = new EncodeScoreShifterDAO();
	    e.setUserid(getofadid);
	    e.setMath(getmath_score);
	    e.setScience(getscience_score);
	    e.setEnglish(getenglish_score);
	    e.setIq(getiq_score);
	    e.setTotal(getaverage);
	    e.setStudentid(getstudentid);
	    e.doEncodeShifter(conn);
	    
	    request.getRequestDispatcher("OfadScores_Shifter.jsp").include(request, response);
	    out.print("<script>alert('Submitted!');</script>");

	}

}
