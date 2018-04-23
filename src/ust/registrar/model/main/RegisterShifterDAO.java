package ust.registrar.model.main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.http.Part;

import DatabaseHandler.DatabaseSQLs;


public class RegisterShifterDAO implements DatabaseSQLs {

	String lname, fname, mname, gender, bdate, type;
	 // for Shifters
	 String studentid, shiftoldcollege, shiftoldprogram, shiftnewcollege, shiftnewprogram;
	 Part picture;
	
	 
	public Part getPicture() {
		return picture;
	}
	 
	public void setPicture(Part picture) {
		this.picture = picture;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getShiftoldcollege() {
		return shiftoldcollege;
	}
	public void setShiftoldcollege(String shiftoldcollege) {
		this.shiftoldcollege = shiftoldcollege;
	}
	public String getShiftoldprogram() {
		return shiftoldprogram;
	}
	public void setShiftoldprogram(String shiftoldprogram) {
		this.shiftoldprogram = shiftoldprogram;
	}
	public String getShiftnewcollege() {
		return shiftnewcollege;
	}
	public void setShiftnewcollege(String shiftnewcollege) {
		this.shiftnewcollege = shiftnewcollege;
	}
	public String getShiftnewprogram() {
		return shiftnewprogram;
	}
	public void setShiftnewprogram(String shiftnewprogram) {
		this.shiftnewprogram = shiftnewprogram;
	}
	
	
	public void RegisterProcessShift(Connection conn) {
		 try{
				// String url = "jdbc:mysql://localhost:3306/capstone";
				// Class.forName("com.mysql.jdbc.Driver");
				// Connection con = DriverManager.getConnection(url, "ustregistrar", "ustadmin@2018");
			
					 PreparedStatement ps = conn.prepareStatement("INSERT INTO student_shifter(lastname, firstname, middlei, gender, typeofstudent, birthday, studentid, oldcourse, oldprogram, newcourse, newprogram, idpicture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
					 ps.setString(1, lname);
					 ps.setString(2, fname);
					 ps.setString(3, mname);
					 ps.setString(4, gender);
					 ps.setString(5, type);
					 ps.setString(6, bdate);
					 ps.setString(7, studentid);
					 ps.setString(8, shiftoldcollege);
					 ps.setString(9, shiftoldprogram);
					 ps.setString(10, "");
					 ps.setString(11, "");
					 ps.setBinaryStream(12, picture.getInputStream(), (int) picture.getSize());					
										
				     ps.executeUpdate(); 
				     
				  //   request.setAttribute("sessionUser", getstudentid);
				  //   request.getRequestDispatcher("Student-Shifter/Shifter-Welcome.jsp")
				  //   .forward(request, response);
				   
				  
			 }catch(SQLException sql) {
				 sql.printStackTrace();
			 } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public void InsertStudentUser(Connection conn) {
		 try{
				// String url = "jdbc:mysql://localhost:3306/capstone";
				// Class.forName("com.mysql.jdbc.Driver");
				// Connection con = DriverManager.getConnection(url, "ustregistrar", "ustadmin@2018");
			
					 PreparedStatement ps = conn.prepareStatement("INSERT INTO useraccounts (userid, password, type) VALUES (?, ?, ?)");
					 ps.setString(1, studentid);
					 ps.setString(2, bdate);
					 ps.setString(3, type);
					
				     ps.executeUpdate(); 
				     
				  //   request.setAttribute("sessionUser", getstudentid);
				  //   request.getRequestDispatcher("Student-Shifter/Shifter-Welcome.jsp")
				  //   .forward(request, response);
				   
				  
			 }catch(SQLException sql) {
				 sql.printStackTrace();
			 }
	}
	public void registerProcess(Connection conn) {
		RegisterProcessShift(conn);
		InsertStudentUser(conn);
	}
}
