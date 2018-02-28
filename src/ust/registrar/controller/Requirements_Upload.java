package ust.registrar.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.liferay.portal.kernel.servlet.PortalIncludeUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;

import DatabaseHandler.SingletonDB;
import java.sql.*;

/**
 * Servlet implementation class Shifting_Upload
 */
@WebServlet("/Requirements_Upload")
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
		
			if(ServletFileUpload.isMultipartContent(request)) {
			try{
			//	UploadPortletRequest uploadRequest = PortalIncludeUtil.getUploadPortletRequest(request);
				String newcourse = request.getParameter("outgoing_college");
				String newprogram = request.getParameter("outgoing_program");
				String getstudent = ParamUtil.getString(request, "studentid");
				String g = null;
				List<FileItem> requirements = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : requirements){
					if(!item.isFormField()) {
						String name = new File(item.getName()).getName();
						item.write(new File(Directory_image + File.separator + name));
						String imagepath = Directory_image + File.separator + name;
						/**PreparedStatement ps = conn.prepareStatement("INSERT INTO shifters_requirements (shifter_id, requirementsimage) VALUES (?, ?)");
						ps.setString(1, getstudent);
						ps.setString(2, imagepath);
						ps.executeUpdate();
						PreparedStatement ps1 = conn.prepareStatement("UPDATE student_shifter SET newcourse = ?, newprogram = ? WHERE studentid = ?");
						ps1.setString(1, newcourse);
						ps1.setString(2, newprogram);
						ps1.setString(3, getstudent);
						ps1.executeUpdate(); */
					}
					else {
					/**	g = (String)item.getFieldName();
						getstudent = (String)item.getString();
						System.out.println(getstudent);*/
					}
				}
			
				
			}
			catch(Exception ex) {
				out.println(ex);
			}
			
		}
	}
		
	

}
