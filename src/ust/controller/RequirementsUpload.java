package ust.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class RequirementsUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File file;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OutputStream outStream = new FileOutputStream(file);
		boolean isMultipart;
		String filePath;
		int maxFileSize = 5000*1024;
		filePath = getServletContext().getInitParameter("fileUploadLocation");
		// Insert code here to retrieve student number
		// Insert code here to combine student number with file upload location
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(!isMultipart){
			out.print("file not uploaded");
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxFileSize);
		factory.setRepository(new File("C:\\temp"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFileSize);
		try{
			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			int checker = 0;
			while(i.hasNext()){
				checker++;
				FileItem fi = (FileItem) i.next();
				if(!fi.isFormField()){
					String fieldName = fi.getFieldName();
					String fileName = "";
					switch (checker) {
		            	case 1:  fileName = "Req1"+fi.getName();
		            	break;
		            	case 2:  fileName = "Req2"+fi.getName();
		            	break;
		            	case 3:  fileName = "Req3"+fi.getName();
		            	break;
		            	case 4:  fileName = "Req4"+fi.getName();
	                    break;}
					//Add Student Number to the file name//
					//Specify the name of the requirement//
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					if(fileName.lastIndexOf("\\")>=0){
						file = new File(filePath+fileName.substring(fileName.lastIndexOf("\\")));
						//Insert ^ to database
					}else{
						file = new File(filePath+fileName.substring(fileName.lastIndexOf("\\")+1));
						//Insert ^ to database
					}
					out.println("File Uploaded"+fileName+"<br>");
				}
			}
		}catch(Exception e){
			out.println(e);
		}
	}
/*
 * To Do:
 * Dapat masasave sa database kung saan nakasave sa fileserver yung uploaded na requirements
 * Dapat marerename yung file to be that of the students info ganun
 * */
}
