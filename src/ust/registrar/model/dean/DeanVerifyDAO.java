package ust.registrar.model.dean;

import java.sql.*;
import DatabaseHandler.*;
public class DeanVerifyDAO implements DatabaseSQLs {

	public String studentid, deanname, approved;
	
	

	public String getStudentid() {
		return studentid;
	}



	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}



	public String getDeanname() {
		return deanname;
	}



	public void setDeanname(String deanname) {
		this.deanname = deanname;
	}



	public String getApproved() {
		return approved;
	}



	public void setApproved(String approved) {
		this.approved = approved;
	}



	public void verifyStudent(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(Dean_approveStudent);
			pst.setString(1, deanname);
			pst.setString(2, approved);
			pst.setString(3, studentid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dontverifyStudent(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(Dean_disapproveStudent);
			pst.setString(1, deanname);
			pst.setString(2, approved);
			pst.setString(3, studentid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
