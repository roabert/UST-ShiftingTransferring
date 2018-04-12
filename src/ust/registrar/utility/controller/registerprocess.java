package ust.registrar.utility.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.main.RegisterShifterDAO;
import ust.registrar.model.main.RegisterTransferDAO;

import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.sql.*;
import java.util.List;

/**
 * Servlet implementation class registerprocess
 */
@WebServlet("/registerprocess")
@MultipartConfig

public class registerprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
	
	public void init() throws ServletException {
		conn = SingletonDB.getConnection();
	}
    public registerprocess() {
        super();
        // TODO Auto-generated constructor stub
    }
    String generatename = "TFE-Student";
    int number =+ 1;
    String generateID = generatename+"-"+Integer.toString(number);
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
	   // List of Variables
		PrintWriter out = response.getWriter();
		 String getlname = request.getParameter("register_lname");
		 String getfname = request.getParameter("register_fname");
		 String getmname = request.getParameter("register_mi");
		 String getgender = request.getParameter("register_gender");
		 String getemail = request.getParameter("register_email");
		 String getbdate = request.getParameter("register_bday");
		 String gettype = request.getParameter("register_typeofstudent");

	 // List of Variables for Transferees
		 String getoldschool = request.getParameter("transfer_school");
		 String get_transferoldcollege = request.getParameter("transfer_oldcollege");
		 String get_transferoldprogram = request.getParameter("transfer_oldprogram");

		 Part get_transferpic = request.getPart("transfer_idpicture");
		// String filename = extractFileName(part);
		
		 String generateUsername = "transferee-";
	
		 
     //   part.write(savepath + File.separator + filename);
	//	 String imagepath = savepath + File.separator + filename;
		 HttpSession session = request.getSession();

			RegisterTransferDAO register = new RegisterTransferDAO();
		
			
		
			register.setLname(getlname);
			register.setFname(getfname);
			register.setMname(getmname);
			register.setGender(getgender);
			register.setEmail(getemail);
			register.setBdate(getbdate);
			register.setUserid(generateUsername);
			register.setType(gettype);
			register.setOldschool(getoldschool);
			register.setTransferoldcollege(get_transferoldcollege);
			register.setTransferoldprogram(get_transferoldprogram);
	        register.setIdpic(get_transferpic);
           
	        register.checkEmail(conn);
	       
	        if(!(getemail.equals(register.getGetemail()))) {
			register.RegisterProcessTransfer(conn);
			
			   session.setAttribute("setuser", register.getNewid());
			   request.getRequestDispatcher("Transfer-Transferring.jsp")
			   .forward(request, response);
	        }else {
	        	   request.getRequestDispatcher("login.jsp")
				   .include(request, response);
	        	   out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('.register').modal('show');  });</script>");
	        	   out.print("<script>alert('Account creation was not successful! the email address you have entered is already taken, Try again.');</script>");
	        }
		 
	}

}


