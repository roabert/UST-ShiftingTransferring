package ust.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatabaseHandler.SingletonDB;

import java.sql.*;
/**
 * Servlet implementation class DisplayProfilePic
 */
@WebServlet("/DisplayProfilePic")
public class DisplayProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection conn = null;
	
	public void init() throws ServletException {
		conn = SingletonDB.getConnection();
	}
    public DisplayProfilePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String pkey = request.getParameter("pkey");
		
		try {
			 String s = "SELECT idpicture FROM student_shifter WHERE studentid = '"+pkey+"'";
			 String imgLen = "";
			 Statement ms = conn.createStatement();
			 ResultSet rs = ms.executeQuery(s);
			 if(rs.next()){
				 imgLen = rs.getString(1);
				 System.out.println(imgLen.length());
				 }  
			 rs = ms.executeQuery(s);
			 if(rs.next()){
				  int len = imgLen.length();
				  byte [] rb = new byte[len];
				  InputStream readImg = rs.getBinaryStream(1);
				  int index=readImg.read(rb, 0, len);  
				  System.out.println("index"+index);
				  ms.close();
				  response.reset();
				  response.setContentType("image/jpg");
				  response.getOutputStream().write(rb,0,len);
				  response.getOutputStream().flush();  
			 }
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
