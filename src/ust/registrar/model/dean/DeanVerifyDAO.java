package ust.registrar.model.dean;

import java.sql.*;
import DatabaseHandler.*;
public class DeanVerifyDAO implements DatabaseSQLs {

	public String studentid, deanname, approved, remarks;
	public String event, description;
	
	

	public String getEvent() {
		return event;
	}



	public void setEvent(String event) {
		this.event = event;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



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
			PreparedStatement pst = conn.prepareStatement("UPDATE shifters_status SET dean_id = ?, dean_verified = ?, dean_date_verified = NOW(), secgen_verified = 'In-progress' WHERE shifter_id = ?");
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
			PreparedStatement pst = conn.prepareStatement("UPDATE shifters_status SET dean_id = ?, dean_verified = ?, dean_remarks = ?, dean_date_verified = NOW() WHERE shifter_id = ?");
			pst.setString(1, deanname);
			pst.setString(2, approved);
			pst.setString(3, remarks);
			pst.setString(4, studentid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, deanname);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); ps.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
