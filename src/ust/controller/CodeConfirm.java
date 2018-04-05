package ust.controller;

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
import ust.registrar.model.studentprocess.forgotpassword;

/**
 * Servlet implementation class CodeConfirm
 */
@WebServlet("/CodeConfirm")
public class CodeConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodeConfirm() {
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String getEmail = request.getParameter("get_confirmedemail");
		String getpasscode = request.getParameter("passcode");
		
		forgotpassword f = new forgotpassword();
		f.setConfirmemail(getEmail);
		f.confirmCode(conn);
		
		if(f.getConfirmemail() != null) {
			if(f.getConfirmcode().equals(getpasscode)) {
			request.setAttribute("set_email", getEmail);
			request.getRequestDispatcher("login.jsp").include(request, response);
			out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal('show');  });</script>");
			}
			else if(!(getpasscode.equals(f.getConfirmcode()))){
				request.setAttribute("setemail", getEmail);
				request.getRequestDispatcher("login.jsp").include(request, response);
				out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#passwordrecovery').modal('show');  });</script>");
				out.print("<script>alert('The passcode you entered is invalid, Please try again.');</script>");
			}
		}
		
		
	}

}
