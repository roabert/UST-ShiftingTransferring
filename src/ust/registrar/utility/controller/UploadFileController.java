package ust.registrar.utility.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ust.registrar.model.studentprocess.fileUpload;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;


@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
    		
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                fileUpload upload= new fileUpload();
                int row1=0;
                int row2=0;
                int row3=0;
                int row4=0;
                int row5=0;
                int row6=0;
                Part file1 = request.getPart("req1");
                Part file2 = request.getPart("req2");
                Part file3 = request.getPart("req3");
                Part file4 = request.getPart("req4");
                Part file5 = request.getPart("req5");
                Part file6 = request.getPart("req6");
                if (file1.getSize()>= 10){
                	row1 = upload.insertFile(file1);
                }else{
                	
                }
                if (file2.getSize()>= 10){
                	row2 = upload.insertFile(file2);
                }else{
                	
                }
                if (file3.getSize()>= 10){
                	row3 = upload.insertFile(file3);
                }else{
                	
                }
                if (file4.getSize()>= 10){
                	row4 = upload.insertFile(file4);
                }else{
                	
                }
                if (file5.getSize()>= 10){
                	row5 = upload.insertFile(file5);
                }else{
                	
                }
                if (file6.getSize()>= 10){
                	row6 = upload.insertFile(file6);
                }else{
                	
                }
                

                if (row1 <= 0 || row2 <= 0 || row3 <= 0 || row4 <= 0 || row5 <= 0 || row6 <= 0) 
                {
                    out.println("There was a problem uploading one of your files<br>");
                    if(row1 <=0){
                    	out.println ("Requirement1 didn't upload<br>");
                    }
                    if(row2 <=0){
                    	out.println ("Requirement2 didn't upload<br>");
                    }
                    if(row3 <=0){
                    	out.println ("Requirement3 didn't upload<br>");
                    }
                    if(row4 <=0){
                    	out.println ("Requirement4 didn't upload<br>");
                    }
                    if(row5 <=0){
                    	out.println ("Requirement5 didn't upload<br>");
                    }
                    if(row6 <=0){
                    	out.println ("Requirement6 didn't upload<br>");
                    }
                    
                    RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                    rs.include(request, response);
                }
                else
                {
                    out.println("All files succesfully uploaded");
                    
                    
                    RequestDispatcher rs = request.getRequestDispatcher("upload_form.jsp");
                    rs.include(request, response);
                }                    
 
    }   
}