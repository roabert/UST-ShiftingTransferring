package ust.registrar.utility.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.liferay.portal.kernel.servlet.PortalIncludeUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;

import DatabaseHandler.SingletonDB;
import ust.registrar.model.studentprocess.RequirementsDAO;

import java.sql.*;

/**
 * Servlet implementation class Shifting_Upload
 */
@WebServlet("/Requirements_Upload")
@MultipartConfig
public class Requirements_Upload extends HttpServlet {
	public final String Directory_image = "C:/workspace/UST-ShiftingTransferring/WebContent/Images";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Requirements_Upload() {
        super();
        // TODO Auto-generated constructor stub
    }
Connection conn = null;
	
	public void init() throws ServletException {
		conn = SingletonDB.getConnection();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
				String newcourse = request.getParameter("outgoing_college");
				String newprogram = request.getParameter("outgoing_program");
				String getstudent = request.getParameter("studentid");		
				String gettype = request.getParameter("typeofstudent");
				//Requirement Upload//
				RequirementsDAO r = new RequirementsDAO();
				 String event = "Requirements Submission";
				 String description = getstudent+" submitted requirements in the process";
				 r.setEvent(event);
				 r.setDescription(description);
				r.setNewcourse(newcourse);
				r.setNewprogram(newprogram);
				r.setStudentid(getstudent);
				 if(gettype.equals("Shifter")) {
				 for (Part part : request.getParts()) {
				        if(part.getContentType() == null) {
				            continue;
				        }
						
						r.setRequirements(part);
						r.submitRequirementsShifter(conn);
				        
				 }
				
				r.doStep1Shifter(conn);
				
				response.sendRedirect("Shifter-Step1Done.jsp");
				 }
				 
				 else if(gettype.equals("Transferee")) {
					 for (Part part : request.getParts()) {
					        if(part.getContentType() == null) {
					            continue;
					        }
							
							r.setRequirements(part);
							r.submitRequirementsTransfer(conn);
					        
					 }
					
					r.doStep1Transfer(conn);
					
					response.sendRedirect("Transfer-Step1Done.jsp");
					 }
			
		}
	}
		
	


