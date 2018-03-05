package ust.registrar.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

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
		 String getlname = request.getParameter("register_lname");
		 String getfname = request.getParameter("register_fname");
		 String getmname = request.getParameter("register_mi");
		 String getgender = request.getParameter("register_gender");
		 String getbdate = request.getParameter("register_bday");
		 String gettype = request.getParameter("register_typeofstudent");
     // List of Variables for Shifters 
		 String getstudentid = request.getParameter("register_studentid");
		 String get_shiftoldcollege = request.getParameter("shift_oldcollege");
		 String get_shiftoldprogram = request.getParameter("shift_oldprogram");
		 String get_shiftnewcollege = request.getParameter("shift_newcollege");
		 String get_shiftnewprogram = request.getParameter("shift_newprogram");
		 Part get_shiftpic = request.getPart("shifter_idpicture");
	 // List of Variables for Transferees
		 String getoldschool = request.getParameter("transfer_school");
		 String get_transferoldcollege = request.getParameter("transfer_oldcollege");
		 String get_transferoldprogram = request.getParameter("transfer_oldprogram");
		 String get_transfernewcollege = request.getParameter("transfer_newcollege");
		 String get_transfernewprogram = request.getParameter("transfer_newprogram");
		 Part get_transferpic = request.getPart("transfer_idpicture");
		// String filename = extractFileName(part);
		
		 String generateUsername = getlname+getfname+getmname;
	
		 
     //   part.write(savepath + File.separator + filename);
	//	 String imagepath = savepath + File.separator + filename;
		 HttpSession session = request.getSession();

		if(gettype.toUpperCase().equals("SHIFTER")) {
			RegisterShifterDAO register = new RegisterShifterDAO();
			register.setLname(getlname);
			register.setFname(getfname);
			register.setMname(getmname);
			register.setGender(getgender);
			register.setBdate(getbdate);
			register.setType(gettype);
			register.setStudentid(getstudentid);
			register.setShiftoldcollege(get_shiftoldcollege);
			register.setShiftoldprogram(get_shiftoldprogram);
			register.setPicture(get_shiftpic);
			register.registerProcess(conn);
			
			   session.setAttribute("setuser", getstudentid);
			   request.getRequestDispatcher("Shifter-Welcome.jsp")
			   .forward(request, response);
			
		}
		else if(gettype.toUpperCase().equals("TRANSFEREE")) {
			
			RegisterTransferDAO register = new RegisterTransferDAO();
			register.setLname(getlname);
			register.setFname(getfname);
			register.setMname(getmname);
			register.setGender(getgender);
			register.setBdate(getbdate);
			register.setUserid(generateUsername);
			register.setType(gettype);
			register.setOldschool(getoldschool);
			register.setTransferoldcollege(get_transferoldcollege);
			register.setTransferoldprogram(get_transferoldprogram);
	        register.setIdpic(get_transferpic);
			register.registerProcess(conn);
			
			   session.setAttribute("setuser", generateUsername);
			   request.getRequestDispatcher("Transfer-Welcome.jsp")
			   .forward(request, response);
		}
		 
	}

}


