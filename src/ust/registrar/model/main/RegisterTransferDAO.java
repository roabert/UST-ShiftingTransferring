
package ust.registrar.model.main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.http.Part;

import DatabaseHandler.DatabaseSQLs;


public class RegisterTransferDAO implements DatabaseSQLs {

	String lname, fname, mname, gender, bdate, type, userid;
    Part idpic;
	 public String getUserid() {
		return userid;
	}
	public Part getIdpic() {
		return idpic;
	}
	public void setIdpic(Part idpic) {
		this.idpic = idpic;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	// for Transferees
	 String oldschool, transferoldcollege, transferoldprogram, transfernewcollege, transfernewprogram;
	 
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
	public String getOldschool() {
		return oldschool;
	}
	public void setOldschool(String oldschool) {
		this.oldschool = oldschool;
	}
	public String getTransferoldcollege() {
		return transferoldcollege;
	}
	public void setTransferoldcollege(String transferoldcollege) {
		this.transferoldcollege = transferoldcollege;
	}
	public String getTransferoldprogram() {
		return transferoldprogram;
	}
	public void setTransferoldprogram(String transferoldprogram) {
		this.transferoldprogram = transferoldprogram;
	}
	public String getTransfernewcollege() {
		return transfernewcollege;
	}
	public void setTransfernewcollege(String transfernewcollege) {
		this.transfernewcollege = transfernewcollege;
	}
	public String getTransfernewprogram() {
		return transfernewprogram;
	}
	public void setTransfernewprogram(String transfernewprogram) {
		this.transfernewprogram = transfernewprogram;
	}
	
	public void RegisterProcessTransfer(Connection conn) {
		 try{
				
					   PreparedStatement ps = conn.prepareStatement(transferRegisterSQL);
					     ps.setString(1, userid);
						 ps.setString(2, lname);
						 ps.setString(3, fname);
						 ps.setString(4, mname);
						 ps.setString(5, gender);
						 ps.setString(6, type);
						 ps.setString(7, bdate);
						 ps.setString(8, oldschool);
						 ps.setString(9, transferoldcollege);
						 ps.setString(10, transferoldprogram);
						 ps.setString(11, "");
						 ps.setString(12, "");
						 ps.setBinaryStream(13, idpic.getInputStream(), (int) idpic.getSize());	
						
					     ps.executeUpdate();
					     
					    // request.setAttribute("sessionUser", generateID);
					  //   request.getRequestDispatcher("Student-Transferee/Transfer-Welcome.jsp")
					   //  .forward(request, response);
				   
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
			
					 PreparedStatement ps = conn.prepareStatement(insertStudentUser);
					 ps.setString(1, userid);
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
		InsertStudentUser(conn);
		RegisterProcessTransfer(conn);
	}
	
}
