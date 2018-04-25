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
import ust.registrar.utility.NotifSender;

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
		NotifSender notif = new NotifSender();
        String getstudentid = request.getParameter("studentid");
        String getsecgen = request.getParameter("getuser");
        String getremarks = request.getParameter("endorsement");
        String getapproval = request.getParameter("approval");
        String getbutton = request.getParameter("endorse");
        String event = "Endorsement Approval";
        String description = "Memo request of "+getstudentid+" has been reviewed";
        OSGIndorseStudentDAO o = new OSGIndorseStudentDAO();
       o.setEvent(event);
       o.setDescription(description);
        o.setSecgen(getsecgen);
        o.setStudentid(getstudentid);
        o.setRemarks(getremarks);
       if(getbutton.equals("endorsewithremarks")) {
        if(getapproval != null) {
        o.finalStep(conn);
        notif.sendNotif(getstudentid);
        o.insertLogs(conn);
        request.getRequestDispatcher("OsgEndorse_Shifter.jsp").include(request, response);
        out.print("<script>alert('Memo of "+getstudentid+" approved! Student has been shifted!')</script>");
        }
        else { 
        o.dontIndorseStudent(conn);
        notif.sendNotif(getstudentid);
        o.insertLogs(conn);
        request.getRequestDispatcher("OsgEndorse_Shifter.jsp").include(request, response);
        out.print("<script>alert('Memo of "+getstudentid+" has been disapproved!')</script>");
        }
       }
       else if(getbutton.equals("endorsenow")) {
           o.finalStep(conn);
           notif.sendNotif(getstudentid);
           o.insertLogs(conn);
           request.getRequestDispatcher("OsgEndorse_Shifter.jsp").include(request, response);
           out.print("<script>alert('Memo of "+getstudentid+" approved! Student has been shifted!')</script>");
       }
        
	}

}
