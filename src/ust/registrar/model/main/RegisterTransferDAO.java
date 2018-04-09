
package ust.registrar.model.main;

import java.io.IOException;
import java.sql.*;

import javax.servlet.http.Part;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import DatabaseHandler.DatabaseSQLs;


public class RegisterTransferDAO implements DatabaseSQLs {

	String lname, fname, mname, email, getemail, gender, bdate, type, userid, newid, emailvalidate;
	public String getGetemail() {
		return getemail;
	}
	public void setGetemail(String getemail) {
		this.getemail = getemail;
	}
	public String getEmailvalidate() {
		return emailvalidate;
	}
	public void setEmailvalidate(String emailvalidate) {
		this.emailvalidate = emailvalidate;
	}
	public int getLastid() {
		return lastid;
	}
	public void setLastid(int lastid) {
		this.lastid = lastid;
	}

	int lastid;
    Part idpic;
	 public String getUserid() {
		return userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getNewid() {
		return newid;
	}
	public void setNewid(String newid) {
		this.newid = newid;
	}
	
	public void checkEmail(Connection conn) {
		
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts WHERE email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getemail = rs.getString("email");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void RegisterProcessTransfer(Connection conn) {
		 try{
	
					   PreparedStatement ps = conn.prepareStatement(transferRegisterSQL, Statement.RETURN_GENERATED_KEYS);
					     ps.setString(1, userid);
						 ps.setString(2, lname);
						 ps.setString(3, fname);
						 ps.setString(4, mname);
						 ps.setString(5, email);
						 ps.setString(6, gender);
						 ps.setString(7, type);
						 ps.setString(8, bdate);
						 ps.setString(9, oldschool);
						 ps.setString(10, transferoldcollege);
						 ps.setString(11, transferoldprogram);
						 ps.setString(12, "");
						 ps.setString(13, "");
						 ps.setBinaryStream(14, idpic.getInputStream(), (int) idpic.getSize());	
						
					     ps.executeUpdate();
					     ResultSet rs = ps.getGeneratedKeys();
					     if(rs.next()) {
					    	 lastid = rs.getInt(1);
					     }
					     newid = userid + Integer.toString(lastid);
					     PreparedStatement p = conn.prepareStatement("UPDATE student_transfer SET userid = ? WHERE id = ?");
					     p.setString(1, newid);
					     p.setInt(2, lastid);
					     p.executeUpdate();
					    // request.setAttribute("sessionUser", generateID);
					  //   request.getRequestDispatcher("Student-Transferee/Transfer-Welcome.jsp")
					   //  .forward(request, response);
					     PreparedStatement ps2 = conn.prepareStatement(insertStudentUser);
						 ps2.setString(1, newid);
						 ps2.setString(2, bdate);
						 ps2.setString(3, email);
						 ps2.setString(4, type);
						
					     ps2.executeUpdate();
				   
			 }catch(SQLException sql) {
				 sql.printStackTrace();
				 emailvalidate = sql.getMessage();
				
			 } catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    
	}


	
}
